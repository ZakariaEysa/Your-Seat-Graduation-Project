// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:qr_flutter/qr_flutter.dart';
// import '../../../about_us/presentation/views/about_us.dart';
//
// class QrState extends StatelessWidget {
//    QrState({super.key});
//   Map<String,dynamic> ahmed = {
//     "ahmed" : "1235",
//     "cinema" : "Plaza",
//     "movie" : "Avengers"
//     };
//   @override
//   Widget build(BuildContext context) {
//
//     return Padding(
//       padding:  EdgeInsetsDirectional.fromSTEB(0, 560.h, 0, 0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.end,
//         children: [
//           Padding(
//             padding: EdgeInsetsDirectional.only(bottom: 70.h),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 QrImageView(
//                     data: ahmed.toString(),
//                     size: 120.sp,
//                     backgroundColor: Colors.white,
//                   ),
//                 Column(
//                   children: [
//                     Text(
//                       "Payment : paymed",
//                       style: TextStyle(color: Colors.black, fontSize: 14.sp),
//                     ),
//                     SizedBox(height: 5.h),
//                     Text(
//                       "Status    :      Active",
//                       style: TextStyle(color: Colors.black, fontSize: 14.sp),
//                     ),
//                     SizedBox(height: 7.h),
//                     Row(
//                       children: [
//                         Text(
//                           "Download ticket",
//                           style: TextStyle(color: Colors.black, fontSize: 14.sp),
//                         ),
//                         InkWell(
//                           onTap: () {
//                             print('Image clicked!');
//                           },
//                           child: Padding(
//                             padding: EdgeInsetsDirectional.only(start: 5.w),
//                             child: Image.asset(
//                               "assets/icons/img_4.png",
//                               width: 15.w,
//                               height: 15.h,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
//
//
//
//

import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:yourseatgraduationproject/features/user_flow/my_tikect/presentation/view/ticket_done.dart';

class QrState extends StatelessWidget {
  String orderId;
  QrState({super.key,
    required this.orderId});

  Map<String, dynamic> ticketData = {
    "id": "44444",
    "cinema": "City Center Almaza",
    "movie": "Fury",
    "payment": "Paid",
    "status": "Active"
  };

  Future<String> getDownloadPath() async {
    Directory? directory;
    if (Platform.isAndroid) {
      directory = Directory('/storage/emulated/0/Download'); // مجلد التنزيلات في أندرويد
    } else {
      directory = await getApplicationDocumentsDirectory(); // المسار الافتراضي في iOS
    }
    return directory.path;
  }

  Future<void> generateAndSavePDF(BuildContext context) async {
    final pdf = pw.Document();

    // إنشاء QR Code كصورة
    final qrImage = await QrPainter(
      data: orderId,
      version: QrVersions.auto,
      gapless: false,
    ).toImage(200);

    final ByteData? byteData = await qrImage.toByteData(format: ImageByteFormat.png);
    final Uint8List qrBytes = byteData!.buffer.asUint8List();

    //إنشاء ملف PDF
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Center(
            child: pw.Column(
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                pw.Text("Booked Cinema Ticket",
                    style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
                pw.SizedBox(height: 10),
                pw.Text("Movie: ${ticketData['movie']}", style: pw.TextStyle(fontSize: 18)),
                pw.Text("Cinema: ${ticketData['cinema']}", style: pw.TextStyle(fontSize: 18)),
                pw.Text("Payment: ${ticketData['payment']}", style: pw.TextStyle(fontSize: 18)),
                pw.Text("Status: ${ticketData['status']}", style: pw.TextStyle(fontSize: 18)),
                pw.SizedBox(height: 30),
                pw.Image(pw.MemoryImage(qrBytes), width: 150, height: 150),

              ],
            ),
          );
        },
      ),
    );

  //  حفظ الملف في مجلد التنزيلات

    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.letter,
        build: (pw.Context context) {
          return pw.Container(
            padding: pw.EdgeInsets.all(16),
            decoration: pw.BoxDecoration(
              color: PdfColor.fromHex("#1E0460"),
              borderRadius: pw.BorderRadius.circular(10),
              border: pw.Border.all(color: PdfColors.black, width: 2),
            ),
            child: pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                // Movie Image
                pw.Center(
                  //child: pw.Image(pw.MemoryImage(Uint8List(length)), width: 100, height: 150),
                ),
                pw.SizedBox(height: 10.h),

                // Movie Title
                pw.Text(ticketData['movie'], style: pw.TextStyle(fontSize: 20, fontWeight: pw.FontWeight.bold,color: PdfColors.white)),

                // Movie Details
                pw.Text("Duration: ${ticketData['duration']}", style: pw.TextStyle(fontSize: 14,color: PdfColors.white)),
                pw.Text("Genre: ${ticketData['genre']}", style: pw.TextStyle(fontSize: 14,color: PdfColors.white)),
                pw.SizedBox(height: 10.h),

                // Time & Seat
                pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Text("${ticketData['time']} ${ticketData['date']}", style: pw.TextStyle(fontSize: 14,color: PdfColors.white)),
                    pw.Text("Seat: ${ticketData['seat']}", style: pw.TextStyle(fontSize: 14,color: PdfColors.white)),
                  ],
                ),
                pw.SizedBox(height: 10.h),

                // Price & Cinema
                pw.Text("Price: ${ticketData['price']} VND", style: pw.TextStyle(fontSize: 14,color: PdfColors.white)),
                pw.Text("Cinema: ${ticketData['cinema']}", style: pw.TextStyle(fontSize: 14,color: PdfColors.white)),
                pw.SizedBox(height: 10.h),

                // QR Code
                pw.Center(
                  child: pw.Image(pw.MemoryImage(qrBytes), width: 100, height: 100),
                ),

                pw.SizedBox(height: 10.h),
                pw.Text("Payment: ${ticketData['payment']} | Status: ${ticketData['status']}", style: pw.TextStyle(fontSize: 14,color: PdfColors.white)),
              ],
            ),
          );
        },
      ),
    );
    final downloadPath = await getDownloadPath();
    final file = File("$downloadPath/YourSeat Ticket.pdf");
    await file.writeAsBytes(await pdf.save());

    // إشعار المستخدم
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("📄 Your Ticket saved in ${file.path}")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 560.h, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: EdgeInsetsDirectional.only(bottom: 70.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                QrImageView(
                  data: orderId,
                  size: 120.sp,
                  backgroundColor: Colors.white,
                ),
                Column(
                  children: [
                    Text(
                      "Payment : ${ticketData['payment']}",
                      style: TextStyle(color: Colors.black, fontSize: 14.sp),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      "Status : ${ticketData['status']}",
                      style: TextStyle(color: Colors.black, fontSize: 14.sp),
                    ),
                    SizedBox(height: 7.h),
                    Row(
                      children: [
                        Text(
                          "Download ticket",
                          style: TextStyle(color: Colors.black, fontSize: 14.sp),
                        ),
                        InkWell(
                          onTap: () => generateAndSavePDF(context),
                          child: Padding(
                            padding: EdgeInsetsDirectional.only(start: 5.w),
                            child: Image.asset(
                              "assets/icons/img_4.png",
                              width: 20.w,
                              height: 20.h,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
