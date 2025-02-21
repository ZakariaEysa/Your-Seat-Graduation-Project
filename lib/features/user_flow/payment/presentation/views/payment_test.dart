import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:yourseatgraduationproject/core/Network/end_points.dart';
import 'package:yourseatgraduationproject/data/hive_keys.dart';
import 'package:yourseatgraduationproject/data/hive_stroage.dart';
import 'package:yourseatgraduationproject/features/user_flow/payment/presentation/views/payment_successful.dart';
import 'package:yourseatgraduationproject/utils/app_logs.dart';
import 'package:yourseatgraduationproject/utils/navigation.dart';
import 'package:yourseatgraduationproject/widgets/scaffold/scaffold_f.dart';

class PayMobPayment {
  Dio dio = Dio();

  Future<String?> payWithPayMob(int amount) async {
    try {
      final token = await getAuthToken();
      AppLogs.errorLog("token : $token");
      final orderId =
          await getOrderId(token: token!, amount: (100 * amount).toString());
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
}

// class PaymentScreen extends StatefulWidget {
//   final String paymentToken;
//   const PaymentScreen({super.key, required this.paymentToken});

//   @override
//   _PaymentScreenState createState() => _PaymentScreenState();
// }

// class _PaymentScreenState extends State<PaymentScreen> {
//   late final InAppWebViewController _controller;

//   @override
//   void initState() {
//     super.initState();
//   }

//   void startPayment() {
//     _controller.loadUrl(
//         urlRequest: URLRequest(
//             url: WebUri(
//                 "https://accept.paymob.com/api/acceptance/iframes/901395?payment_token=${widget.paymentToken}")));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ScaffoldF(

//         appBar: AppBar(
//            iconTheme:  IconThemeData( color: Colors.white) ,
//           title: Text(" إتمام الدفع",style: TextStyle(color: Colors.white),)
//           , backgroundColor: const Color(0xFF2E1371),

//         ),

//         body: InAppWebView(

//           initialOptions: InAppWebViewGroupOptions(
//             crossPlatform: InAppWebViewOptions(
//               javaScriptEnabled: true,
//             ),
//           ),
//           onWebViewCreated: (InAppWebViewController controller) {
//             _controller = controller;
//             startPayment();
//           },
//           onReceivedError: (controller, request, error) {
//             AppLogs.errorLog(error.toString());
//           },
//           onLoadStop: (controller, url) {
//             if (url != null &&
//                 url.queryParameters.containsKey("success") &&
//                 url.queryParameters["success"] == "true") {
//               navigateTo(context: context, screen: PaymentSuccessful());
//               AppLogs.debugLog("success");
//             } else if (url != null &&
//                 url.queryParameters.containsKey("success") &&
//                 url.queryParameters["success"] == "false") {
//               AppLogs.debugLog("failure");
//             }
//           },
//         ));
//   }
// }

/* 
  PayMobPayment().payWithPayMob(100).then(
                        (value) {
                          AppLogs.scussessLog("payment token: $value");
                          navigateTo(
                              context: context,
                              screen: PaymentScreen(paymentToken: value ?? ""));
                        },
                      ); 
                       */

class PaymentScreen extends StatefulWidget {
  final String paymentToken;
  const PaymentScreen({super.key, required this.paymentToken});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  late final InAppWebViewController _controller;

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
            navigateTo(context: context, screen: PaymentSuccessful());
            AppLogs.debugLog("success");
          } else if (url != null &&
              url.queryParameters.containsKey("success") &&
              url.queryParameters["success"] == "false") {
            AppLogs.debugLog("failure");
          }
        },
        onReceivedError: (controller, request, error) {
          AppLogs.errorLog(error.toString());
        },
      ),
    );
  }
}
