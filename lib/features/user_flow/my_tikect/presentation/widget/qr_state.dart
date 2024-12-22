import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/about_us/presentation/views/about_us.dart';

class QrState extends StatelessWidget {
  const QrState({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 70),
          child: Row (
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset("assets/images/qr.png" , width: 125.w , height: 125.h,)
              ,Column(children: [
                Text("Payment : paymed" , style: TextStyle(color: Colors.black),),
                SizedBox(height: 5.h,),
                Text("Status    :      Active" , style: TextStyle(color: Colors.black),),
                SizedBox(height: 5.h,),
                Row(
                  children: [
                    Text("Download ticket" , style: TextStyle(color: Colors.black),),
                   InkWell(
                       onTap: () {
                         // ضع هنا الكود الذي تريد تشغيله عند النقر
                         print('Image clicked!');
                       },
                       child: Padding(
                         padding: const EdgeInsetsDirectional.fromSTEB(5,0,0,0),
                         child: Image.asset("assets/icons/img_4.png" , width: 28.w , height:28),
                       ))
                  ],
                )

              ],)
            ],
          ),
        ),

      ],
    );
  }
}
