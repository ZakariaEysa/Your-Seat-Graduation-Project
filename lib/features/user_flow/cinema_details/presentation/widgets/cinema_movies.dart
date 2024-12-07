import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CinemaMovies extends StatelessWidget{
  final String image;
  final String title;

  const CinemaMovies({super.key, required this.image, required this.title});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

   return Padding(
     padding: EdgeInsets.only(left:10.w),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
       Image.asset(
         image,
         width: 170.w,
         height: 265.h,
         fit: BoxFit.cover,
       ),
         SizedBox(height: 10.h,),
         Text(title,style:theme.textTheme.bodyMedium!.copyWith(fontSize:13.sp ) ,),
         SizedBox(height: 10.h,),

         Row(
           children: [
             Image.asset("assets/images/cinemastar.png",width:14.w,height: 16.h,),
             SizedBox(width:5.w,),
              Text('4.0 (982)',style:theme.textTheme.bodyMedium!.copyWith(fontSize:12.sp))
           ],
         ),
         Row(
           children: [
             Image.asset("assets/icons/clock.png",width: 14.w,height: 16.h,),
             SizedBox(width: 5.w,),
             Text('2 hour 5 minutes',style:theme.textTheme.bodyMedium!.copyWith(fontSize:12.sp))
           ],
         ),
         Row(
           children: [
             Image.asset("assets/icons/video.png",width:16.w,height:16.h,),
             SizedBox(width: 10.w,),
             Text('Action, Sci-fi',style:theme.textTheme.bodyMedium!.copyWith(fontSize:12.sp))
           ],
         )
      ]
     ),
   );
  }

}