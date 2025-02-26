// ignore_for_file: public_member_api_docs, sort_constructors_first
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
                ));
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
