// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:yourseatgraduationproject/core/Network/end_points.dart';
import 'package:yourseatgraduationproject/data/hive_keys.dart';
import 'package:yourseatgraduationproject/data/hive_stroage.dart';
import 'package:yourseatgraduationproject/features/user_flow/movie_details/data/model/movies_details_model/movies_details_model.dart';
import 'package:yourseatgraduationproject/features/user_flow/payment/presentation/views/payment_successful.dart';
import 'package:yourseatgraduationproject/utils/app_logs.dart';
import 'package:yourseatgraduationproject/utils/navigation.dart';
import 'package:yourseatgraduationproject/widgets/scaffold/scaffold_f.dart';

class PayMobPayment {
  Dio dio = Dio(BaseOptions(
    validateStatus: (status) => true, // يقبل أي status code
  ));
}

class PaymentScreen extends StatefulWidget {
  final String paymentToken;
  final MoviesDetailsModel model;
  final List<String> seats;
  final String seatCategory;

  final num price;
  final String location;
  final String date;
  final String time;
  final String cinemaId;
  const PaymentScreen({
    super.key,
    required this.paymentToken,
    required this.model,
    required this.seats,
    required this.seatCategory,
    required this.price,
    required this.location,
    required this.date,
    required this.time,
    required this.cinemaId,
  });

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late final InAppWebViewController _controller;
  var currentUser;

  @override
  void initState() {
    super.initState();
  }

  void startPayment() {
    _controller.loadUrl(
      urlRequest: URLRequest(
        url: WebUri(
            "https://accept.paymob.com/api/acceptance/iframes/901395?payment_token=${widget.paymentToken}"),
      ),
    );
  }

  void injectScript() {
    _controller.evaluateJavascript(source: """
      function clickSubmitButton() {
        console.log("Checking for submit button...");
        if (document.body.innerText.includes("Payment Information")) {
          console.log("Payment information found, script will not execute.");
          return;
        }
        
        let submitButton = document.querySelector("button[name='Submit']") || 
                           document.getElementById("Submit") || 
                           document.getElementsByName("Submit")[0] || 
                           document.querySelector("button[type='submit']") || 
                           document.querySelector("input[type='submit']") || 
                           document.querySelector("button");

        if (submitButton) {
          console.log("Submit button found!");
          if (!submitButton.disabled) {
            submitButton.focus();
            submitButton.click();
            submitButton.dispatchEvent(new Event('click', { bubbles: true }));
            console.log("Submit button clicked");
          } else {
            console.log("Submit button is disabled, retrying...");
            setTimeout(clickSubmitButton, 500);
          }
        } else {
          console.log("Submit button not found, retrying...");
          setTimeout(clickSubmitButton, 500);
        }
      }
      
      function monitorPageChanges() {
        console.log("Monitoring page for submit button...");
        let observer = new MutationObserver((mutations, obs) => {
          if (document.body.innerText.includes("payment information")) {
            console.log("Payment information found, stopping observer.");
            obs.disconnect();
            return;
          }
          
          let submitButton = document.querySelector("button[name='Submit']") || 
                             document.getElementById("Submit") || 
                             document.getElementsByName("Submit")[0] || 
                             document.querySelector("button[type='submit']") || 
                             document.querySelector("input[type='submit']") || 
                             document.querySelector("button");
          
          if (submitButton) {
            console.log("Submit button detected in DOM!");
            if (!submitButton.disabled) {
              submitButton.focus();
              submitButton.click();
              submitButton.dispatchEvent(new Event('click', { bubbles: true }));
              console.log("Submit button clicked from observer");
              obs.disconnect();
            } else {
              console.log("Submit button is disabled, waiting...");
            }
          }
        });
        
        observer.observe(document.body, { childList: true, subtree: true });
      }
      
      document.addEventListener("DOMContentLoaded", function() {
        console.log("DOM fully loaded, attempting to click submit button");
        setTimeout(clickSubmitButton, 500);
        monitorPageChanges();
      });

      window.onload = function () {
        console.log("Page fully loaded, attempting to click submit button");
        setTimeout(clickSubmitButton, 500);
        monitorPageChanges();
      };

      setTimeout(clickSubmitButton, 1500); // محاولة الضغط بعد 1.5 ثانية لضمان تحميل الصفحة
    """);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Center(
          child: Text(
            "إتمام عملية الدفع",
            style: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: const Color(0xFF2E1371),
      ),
      body: InAppWebView(
        initialOptions: InAppWebViewGroupOptions(
          crossPlatform: InAppWebViewOptions(
            javaScriptEnabled: true,
          ),
        ),
        onWebViewCreated: (InAppWebViewController controller) {
          _controller = controller;
          startPayment();
        },
        onLoadStop: (controller, url) {
          injectScript();
          if (url != null &&
              url.queryParameters.containsKey("success") &&
              url.queryParameters["success"] == "true") {
            String? transactionId = url.queryParameters["transaction_id"];
            if (transactionId != null && transactionId.isNotEmpty) {
              _handlePaymentSuccess(transactionId);
            } else {
              AppLogs.errorLog(
                  "❌ فشل في جلب transaction_id، التحقق من الـ URL!");
            }
          } else if (url != null &&
              url.queryParameters.containsKey("success") &&
              url.queryParameters["success"] == "false") {
            AppLogs.debugLog("❌ فشل في الدفع!");
          }
        },
        onReceivedError: (controller, request, error) {
          AppLogs.errorLog(error.toString());
        },
      ),
    );
  }

  Future<void> updateReservedSeatsAndSaveTicket({
    required String cinemaId,
    required String movieName,
    required String selectedTime,
    required String selectedDate,
    required List<String> newSelectedSeats, // المقاعد الجديدة المختارة
    required String userId, // معرف المستخدم
    required String seatCategory,
    required num totalPrice,
    required String transactionId,
  }) async {
    try {
      // 🔹 مرجع السينما في Firestore
      DocumentReference cinemaRef =
          FirebaseFirestore.instance.collection('Cinemas').doc(cinemaId);

      // 🔹 جلب بيانات السينما
      DocumentSnapshot cinemaSnapshot = await cinemaRef.get();

      if (cinemaSnapshot.exists) {
        Map<String, dynamic>? cinemaData =
            cinemaSnapshot.data() as Map<String, dynamic>?;

        if (cinemaData != null && cinemaData.containsKey('movies')) {
          List<dynamic> moviesList = List.from(cinemaData['movies']);

          // 🔹 البحث عن الفيلم المحدد
          int movieIndex =
              moviesList.indexWhere((movie) => movie['name'] == movieName);

          if (movieIndex != -1) {
            List<dynamic> timesList =
                List.from(moviesList[movieIndex]['times']);

            // 🔹 البحث عن التوقيت المحدد داخل الفيلم
            int timeIndex = timesList.indexWhere((time) =>
                time['time'] == selectedTime && time['date'] == selectedDate);

            if (timeIndex != -1) {
              List<String> existingReservedSeats = List<String>.from(
                  timesList[timeIndex]['reservedSeats'] ?? []);

              // ✅ تحديث المقاعد المحجوزة وإضافة المقاعد الجديدة
              existingReservedSeats.addAll(newSelectedSeats);
              existingReservedSeats =
                  existingReservedSeats.toSet().toList(); // إزالة التكرارات

              timesList[timeIndex]['reservedSeats'] = existingReservedSeats;
              moviesList[movieIndex]['times'] = timesList;

              // ✅ تحديث Firestore بالبيانات الجديدة
              await cinemaRef.update({'movies': moviesList});

              print("✅ تم تحديث المقاعد المحجوزة بنجاح!");

              // 🔹 تحديث بيانات المستخدم وإضافة التذكرة
              await FirebaseFirestore.instance
                  .collection('Users')
                  .doc(userId)
                  .update({
                'tickets': FieldValue.arrayUnion([
                  {
                    "movieName": movieName,
                    "cinemaId": cinemaId,
                    "date": selectedDate,
                    "time": selectedTime,
                    "seats": newSelectedSeats,
                    "seatCategory": seatCategory,
                    "totalPrice": totalPrice,
                    "transactionId": transactionId,
                    "purchaseTime": FieldValue.serverTimestamp(), // وقت الشراء
                  }
                ])
              });

              print("🎟️✅ تم حفظ التذكرة بنجاح في حساب المستخدم!");
            } else {
              print("❌ لم يتم العثور على الوقت المحدد!");
            }
          } else {
            print("❌ لم يتم العثور على الفيلم المحدد!");
          }
        } else {
          print("❌ لا يوجد أفلام مسجلة في السينما!");
        }
      } else {
        print("❌ لم يتم العثور على السينما!");
      }
    } catch (e) {
      print("❌ خطأ أثناء تحديث البيانات: $e");
    }
  }

  Future<void> _handlePaymentSuccess(String transactionId) async {
    AppLogs.debugLog("✅ الدفع ناجح - Transaction ID: $transactionId");

    if (HiveStorage.get(HiveKeys.role) == Role.google.toString()) {
      setState(() {
        currentUser = HiveStorage.getGoogleUser();
      });
      setState(() {});
    } else {
      setState(() {
        currentUser = HiveStorage.getDefaultUser();
      });
      AppLogs.scussessLog(currentUser.toString());
    }
    await updateReservedSeatsAndSaveTicket(
        cinemaId: widget.cinemaId,
        movieName: widget.model.name.toString(),
        selectedTime: widget.time,
        selectedDate: widget.date,
        newSelectedSeats: widget.seats,
        userId: currentUser?.name,
        seatCategory: widget.seatCategory,
        totalPrice: widget.price,
        transactionId: transactionId);

    navigateAndRemoveUntil(
      context: context,
      screen: PaymentSuccessful(
        model: widget.model,
        seatCategory: widget.seatCategory,
        seats: widget.seats,
        price: widget.price,
        location: widget.location,
        date: widget.date,
        time: widget.time,
        cinemaId: widget.cinemaId,
        transactionId: transactionId, // ✅ تمرير رقم المعاملة إلى الصفحة التالية
      ),
    );
  }
}
