// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class WatchListPart extends StatelessWidget {
//   final String smallimage;
//   final String time;
//   final String title;
//   final String smalltitle;
//   final String image;
//
//   const WatchListPart({
//     super.key,
//     required this.image,
//     required this.title,
//     required this.time,
//     required this.smallimage,
//     required this.smalltitle,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     return Padding(
//       padding:  EdgeInsets.all(15.0.sp),
//       child: Container(
//         width: 500.w, // Use screen width
//         height: 150.h,
//         decoration: const BoxDecoration(
//           color: Colors.transparent,
//         ),
//         child: Flexible(
//           child: Row(
//             children: [
//               Image.network(
//                 image,
//                 width: 100.w,
//                 height: 150.h,
//                 fit: BoxFit.cover,
//               ),
//               Padding(
//                 padding:  EdgeInsets.all(16.sp),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       title,
//                       style: theme.textTheme.bodyMedium!.copyWith(fontSize: 18.sp),
//                     ),
//                      SizedBox(height: 7.h),
//                     Row(
//                       children: [
//                         Image.asset(smallimage, width: 70.w, height: 30.h),
//                         const SizedBox(width: 10),
//                         Text(
//                           smalltitle,
//                           style:
//                               theme.textTheme.bodyMedium!.copyWith(fontSize: 14.sp),
//                         ),
//                       ],
//                     ),
//                      SizedBox(height: 8.h),
//                     Text(
//                       time,
//                       style: theme.textTheme.bodyMedium!.copyWith(
//                         fontSize: 14.sp,
//                         color: const Color(0XFFD9D9D9),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               const Spacer(),
//               Padding(
//                 padding:  EdgeInsets.only(bottom: 100.h, right: 5.w),
//                 child: InkWell(
//                   onTap: (){},
//                   child: Icon(Icons.cancel,color: theme.colorScheme.onSecondary,
//                   size: 22.sp,
//                   ),
//                 )
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WatchListPart extends StatelessWidget {
  final String smallimage;
  final String time;
  final String title;
  final String smalltitle;
  final String image;
  final VoidCallback onRemove; // دالة لحذف الفيلم

  const WatchListPart({
    super.key,
    required this.image,
    required this.title,
    required this.time,
    required this.smallimage,
    required this.smalltitle,
    required this.onRemove, // تمرير الدالة هنا
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.all(15.sp),
      child: Container(
        width: double.infinity,
        height: 150.0.h,
        decoration: const BoxDecoration(
          color: Colors.transparent,
        ),
        child: Row(
          children: [
            ClipRRect(
             borderRadius: BorderRadius.circular(15.r),
              child: Image.network(
                image,
                width: 100.w,
                height: 150.h,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding:  EdgeInsets.all(16.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: theme.textTheme.bodyMedium!
                        .copyWith(fontSize: 18.sp),
                  ),
                   SizedBox(height: 7.h),
                  Row(
                    children: [
                      Image.asset(smallimage, width: 70.w, height: 30.h),
                       SizedBox(width: 10.w),
                      Text(
                        smalltitle,
                        style: theme.textTheme.bodyMedium!
                            .copyWith(fontSize: 14.sp),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    time,
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontSize: 14.sp,
                      color: const Color(0XFFD9D9D9),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding:  EdgeInsets.only(bottom: 100.h, right: 5.w),
              child: InkWell(
                onTap: onRemove, // استدعاء دالة الحذف عند النقر
                child: Icon(
                  Icons.cancel,
                  color: theme.colorScheme.onSecondary,
                  size: 22.sp,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

