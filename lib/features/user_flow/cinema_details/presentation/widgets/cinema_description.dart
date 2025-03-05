import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/widgets/network_image/image_replacer.dart';

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
    final rating = (cinemaData['rating'] ?? 0.0).toDouble();
    final ratingCount = cinemaData['rating_count'] ?? 0;

    return Stack(

      clipBehavior: Clip.none,
      children: [
        /// ✅ صورة الخلفية (تتكيف مع جميع الشاشات)
        imageUrl.isNotEmpty
            ? ImageReplacer(
          imageUrl: imageUrl,
          width: 1.sw, // استخدم عرض الشاشة بالكامل
          height: 0.3.sh, // نسبة 30% من ارتفاع الشاشة
          fit: BoxFit.cover,
        )
            : Container(
          width: 1.sw,
          height: 0.3.sh,
          color: Colors.grey,
          child: const Icon(Icons.image, color: Colors.white),
        ),

        /// ✅ زر الرجوع (متجاوب)
        Padding(
          padding:  EdgeInsets.only(top: 50.0.h , left: 20.w),
          child: IconButton(
            onPressed: () {
              navigateTo(context: context, screen: const HomeLayout());
            },
            icon: Icon(Icons.arrow_back, color: Colors.white, size: 25.sp),
          ),
        ),

        /// ✅ معلومات السينما (تم تحسين التناسق والتجاوب)
        Positioned(
          bottom: -50.h,
          left: 20.w,
          child: Container(
            padding: EdgeInsets.all(12.sp),
            width: 0.88.sw, // 90% من عرض الشاشة
            height: 0.22.sh, // نسبة 22% من ارتفاع الشاشة
            decoration: BoxDecoration(
              color: const Color(0xFF37313B).withOpacity(0.9),
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  cinemaName,
                  style: theme.textTheme.bodyMedium!.copyWith(fontSize: 16.sp),
                ),
                SizedBox(height: 5.h),

                Text(
                  description,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontSize: 12.sp,
                    color: const Color(0xFFD4D0D0),
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 8.h),
                Row(
                  children: [
                    Text(
                      lang.review,
                      style: theme.textTheme.bodyMedium!.copyWith(fontSize: 14.sp),
                    ),
                    SizedBox(width: 8.w),
                    Image.asset(
                      'assets/images/cinemastar.png',
                      width: 14.w,
                      height: 13.h,
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      '${rating.toStringAsFixed(1)} ($ratingCount)',
                      style: theme.textTheme.bodyMedium!.copyWith(fontSize: 12.sp),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),

                /// ✅ Rating Bar (متجاوب)
                RatingBar.builder(
                  initialRating: rating,
                  minRating: 1,
                  ignoreGestures: true,
                  direction: Axis.horizontal,
                  itemSize: 25.sp, // حجم النجوم متجاوب
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
