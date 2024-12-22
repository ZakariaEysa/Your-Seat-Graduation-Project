import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadMyticket extends StatelessWidget {
  const HeadMyticket({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
         // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(40,60, 0,0 ),
            child: Image.asset(
              "assets/images/tik_film.png",
              width: 110.w,
              height: 180.h,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top:100.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text("Avengers: Infinity War" , style: TextStyle(color: Colors.black),),
                SizedBox(height: 5.h,),
                Row(
                  children: [
                    Image.asset("assets/icons/clock_icon.png" , width: 18.w , height: 20.h, color: Colors.black,),
                    SizedBox(width: 5,),
                    Text("Status    :      Active" , style: TextStyle(color: Colors.black),),
                  ],
                ),
                SizedBox(height: 5.h,),
                Row(
                  children: [
                    SizedBox(width: 10.w,),
                 Image.asset("assets/icons/video.png" , width: 18.w , height: 20.h, color: Colors.black,),
                    SizedBox(width: 5,),
                    Text("on, adventure, sci-fi" , style: TextStyle(color: Colors.black),),
                  ],
                )
              ],
            ),
          ),


               Padding(
                 padding: const EdgeInsets.only(bottom: 80.0 ),
                 child: Text("Vip" ,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFA79F06),

                    ),),
               ),

        ]
        ),
        Row(
          children: [
            SizedBox(width: 20.w,),
            Row(
              children: [
                Image.asset('assets/icons/calendar.png' , width: 80, height: 80,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  Text("14h15’" , style: TextStyle(color: Colors.black),),
                  Text("10.12.2022",style: TextStyle(color: Colors.black),),
                ],)

              ],
            ),
            SizedBox(width: 40.w,),
            Row(
              children: [
                Image.asset('assets/icons/vYzyIu_2_.png' , width: 80, height: 80,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text("seat F10" , style: TextStyle(color: Colors.black),),
                    Text("Section 4",style: TextStyle(color: Colors.black),),
                  ],)

              ],
            ),
          ],
        )
      ],
    );
  }
}
