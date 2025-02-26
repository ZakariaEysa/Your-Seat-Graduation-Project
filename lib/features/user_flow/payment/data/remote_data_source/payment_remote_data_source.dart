import 'dart:async';

import 'package:dio/dio.dart';

import 'package:yourseatgraduationproject/core/Network/end_points.dart';
import 'package:yourseatgraduationproject/features/user_flow/payment/data/repos_impl/payment_repo_impl.dart';
import 'package:yourseatgraduationproject/features/user_flow/payment/presentation/cubit/payment_cubit.dart';
import '../../../../../utils/app_logs.dart';

import '../../../../../../data/hive_keys.dart';
import '../../../../../../data/hive_stroage.dart';

abstract class PaymentRemoteDataSource {
  Future<String?> payWithPayMob(num amount);
  Future<String?> getAuthToken();

  Future<int> getOrderId({required String token, required String amount});

  Future<String> getPaymentKey(
      {required String token, required int orderId, required String amount});

  Future<void> refundPayment(
      {required String transactionId, required int amount});

  Future<List<dynamic>> getAllTransactions({int limit = 10, int page = 1});
}

class PaymentRemoteDataSourceImpl implements PaymentRemoteDataSource {
  PaymentRemoteDataSourceImpl();
  Dio dio = Dio(BaseOptions(
    validateStatus: (status) => true, // يقبل أي status code
  ));
  @override
  Future<String?> payWithPayMob(num amount) async {
    try {
      final token = await getAuthToken();
      AppLogs.errorLog("token : $token");
      final orderId =
          await getOrderId(token: token!, amount: (100 * amount).toString());
      PaymentCubit(PaymentRepoImpl(PaymentRemoteDataSourceImpl())).orderId =
          orderId.toString();
      final paymentKey = await getPaymentKey(
          token: token, orderId: orderId, amount: (100 * amount).toString());
      AppLogs.scussessLog(paymentKey.toString());
      return paymentKey;
    } catch (e) {
      rethrow;
    }
  }

  Future<String?> getAuthToken() async {
    try {
      final response = await dio.post(
        "https://accept.paymob.com/api/auth/tokens",

        // headers: {"Content-Type": "application/json"},
        data: {"api_key": EndPoints.api_key},
      );
      AppLogs.errorLog(response.data.toString());
      AppLogs.debugLog(response.statusCode.toString());
      AppLogs.scussessLog(response.data["token"].toString());

      return response.data["token"];
    } catch (e) {
      rethrow;
    }
  }

  Future<int> getOrderId(
      {required String token, required String amount}) async {
    try {
      final response = await dio
          .post("https://accept.paymob.com/api/ecommerce/orders", data: {
        "auth_token": token,
        "delivery_needed": "true",
        "amount_cents": amount,
        "currency": "EGP",
        "items": [],
      });
      AppLogs.debugLog(response.data.toString());
      AppLogs.debugLog(response.statusCode.toString());

      AppLogs.scussessLog(response.data["id"].toString());

      return response.data["id"];
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getPaymentKey(
      {required String token,
      required int orderId,
      required String amount}) async {
    try {
      var currentUser;

      if (HiveStorage.get(HiveKeys.role) == Role.google.toString()) {
        currentUser = HiveStorage.getGoogleUser();
      } else {
        currentUser = HiveStorage.getDefaultUser();
      }
      //4979915 vc
      //visa 4979914

      final response = await dio
          .post("https://accept.paymob.com/api/acceptance/payment_keys", data: {
        "auth_token": token,
        "amount_cents": amount,
        "currency": "EGP",
        "integration_id": 4979914,
        "order_id": orderId,
        "lock_order_when_paid": "false",
        "billing_data": {
          "apartment": "NA",
          "email": currentUser.email ?? "zakariaeysa@gmail.com",
          "floor": "NA",
          "first_name": currentUser.name ?? "ziko",
          "street": "NA",
          "building": "NA",
          "phone_number": "NA",
          "shipping_method": "NA",
          "city": "NA",
          "country": "NA",
          "postal_code": "NA",
          "last_name": currentUser.name ?? "ziko",
          "state": "NA"
        }
      });
      AppLogs.infoLog(response.data.toString());
      AppLogs.debugLog(response.statusCode.toString());

      return response.data["token"];
    } catch (e) {
      AppLogs.errorLog(e.toString());
      rethrow;
    }
  }

  Future<void> refundPayment(
      {required String transactionId, required int amount}) async {
    try {
      final token = await getAuthToken();

      AppLogs.errorLog(token.toString());

      final response = await dio.post(
        "https://accept.paymob.com/api/acceptance/void_refund/refund",
        data: {
          "auth_token": token,
          "transaction_id": transactionId,
          "amount_cents": 100 * amount,
        },
      );

      AppLogs.errorLog(response.data.toString());
      if (response.statusCode != 200 && response.statusCode != 201) {
        AppLogs.errorLog(response.data["message"].toString());
      }
      // if (response.statusCode == 200 && response.data["success"] == true) {
      //   AppLogs.scussessLog("Refund successful for transaction $transactionId");
      // } else {
      //   AppLogs.errorLog("Refund failed: ${response.data}");
      // }
    } catch (e) {
      AppLogs.errorLog("Refund request failed: ${e.toString()}");
    }
  }

  Future<List<dynamic>> getAllTransactions(
      {int limit = 10, int page = 1}) async {
    try {
      final token = await getAuthToken(); // جلب التوكن

      final response = await dio.get(
        "https://accept.paymob.com/api/acceptance/transactions",
        queryParameters: {
          "page": page, // تحديد رقم الصفحة
          "limit": limit, // عدد النتائج في كل صفحة
        },
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
          },
        ),
      );
      AppLogs.scussessLog("Transactions: ${response.data["results"].length}");
      AppLogs.scussessLog("Transactions: ${response.data["results"][0]}");

      if (response.statusCode == 200) {
        AppLogs.scussessLog("Transactions: ${response.data["results"].length}");
        return response.data["results"] ?? []; // إرجاع المعاملات
      } else {
        AppLogs.errorLog("Error fetching transactions: ${response.data}");
        return [];
      }
    } catch (e) {
      AppLogs.errorLog("Failed to fetch transactions: ${e.toString()}");
      return [];
    }
  }
}
