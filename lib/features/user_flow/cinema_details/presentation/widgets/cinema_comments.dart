import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CinemaComments extends StatelessWidget{
  final String image;
  final String titlename;
  final String title;
  const CinemaComments({super.key, required this.image, required this.title, required this.titlename});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
   return Container(
     decoration: BoxDecoration(
       borderRadius:BorderRadius.circular(20),
        color: const Color(0xFF150B34),
     ),

     child:Row(
       mainAxisAlignment: MainAxisAlignment.spaceBetween,
       children: [
        Image.asset(image,width:45.w,height:45.h,),
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text(titlename,style:theme.textTheme.bodyMedium!.copyWith(fontSize: 16.sp),),
             SizedBox(height:3.h,),
             Text(title,style:theme.textTheme.bodyMedium!.copyWith(fontSize:12.sp),)
           ],
         )
       ],
     ) ,

   );
  }

}