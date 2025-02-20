import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../utils/navigation.dart';
import '../../../home/presentation/views/home_layout.dart';

class CinemaHeaderDescription extends StatelessWidget {
  final Map<String, dynamic> cinemaData;

  const CinemaHeaderDescription({super.key, required this.cinemaData});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var lang = S.of(context);
    final cinemaName = cinemaData['name'] ?? 'Cinema';
    final description = cinemaData['description'] ?? 'لا يوجد وصف متاح';
    final imageUrl = cinemaData['poster_image'] ?? '';
    final rating = cinemaData['rating'] ?? 0.0;
    final ratingCount = cinemaData['rating_count'] ?? 0;

    return Stack(
      clipBehavior: Clip.none,
      children: [

        imageUrl.isNotEmpty
            ? Image.network(
          imageUrl,
          width: 450.w,
          height: 250.h,
          fit: BoxFit.cover,
        )
            : Container(
          width: 450.w,
          height: 390.h,
          color: Colors.grey,
          child: const Icon(Icons.image, color: Colors.white),
        ),
        Padding(
          padding: EdgeInsets.only(top: 50.h),
          child: IconButton(
            onPressed: () {
              navigateTo(context: context, screen: const HomeLayout());
            },
            icon: const Icon(Icons.arrow_back, color: Colors.white, size: 25),
          ),
        ),
        Positioned(
          bottom: -50.h,
          left: 20.w,
          child: Container(
            padding: EdgeInsets.all(10.sp),
            color: const Color(0xFF37313B).withOpacity(.9),
            width: 340.w,
            height: 180.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(cinemaName, style: theme.textTheme.bodyMedium!.copyWith(fontSize: 14.sp)),
                Text(
                  description,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontSize: 11.sp,
                    color: const Color(0xFFD4D0D0),
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 5.h),
                Row(
                  children: [
                    Text(lang.review, style: theme.textTheme.bodyMedium!.copyWith(fontSize: 15.sp)),
                    SizedBox(width: 10.w),
                    Image.asset('assets/images/cinemastar.png', width: 12.w, height: 11.h),
                    SizedBox(width: 10.w),
                    Text('$rating ($ratingCount)', style: theme.textTheme.bodyMedium!.copyWith(fontSize: 11.sp)),
                  ],
                ),
                RatingBar.builder(
                  initialRating: rating,
                  minRating: 1,
                  ignoreGestures: true,
                  direction: Axis.horizontal,
                  itemSize: 33,
                  itemCount: 5,
                  itemBuilder: (context, index) => Icon(
                    rating >= index + 1 ? Icons.star : Icons.star_border,
                    color: rating >= index + 1 ? const Color(0xFFCCC919) : const Color(0xFF575757),
                  ),
                  onRatingUpdate: (rating) {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}