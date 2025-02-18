import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../data/hive_keys.dart';
import '../../../../../data/hive_stroage.dart';
import '../../../../../generated/l10n.dart';

class Rating extends StatelessWidget {
  const Rating({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var lang = S.of(context);
    return Center(
      child: Container(
        padding: EdgeInsets.all(20.sp),
        width: 300.w,
        decoration: BoxDecoration(
          color: Color(0x4DD9D9D9).withOpacity(0.1),
          borderRadius: BorderRadius.circular(50.sp),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
            ),

            //----------------      Rate movie     -------------------//

            Text(
              lang.pleaseRateTheMovie,
              style: theme.textTheme.bodyLarge!.copyWith(fontSize: 22.sp),
            ),
            SizedBox(height: 5.h),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              //  itemSize: 30,
              itemPadding: EdgeInsets.symmetric(horizontal: 3.w),
              itemBuilder: (context, _) =>
              const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {},
            ),
            SizedBox(height: 15.h),


            //----------------      Rate Cinema      -------------------//

            Text(
              lang.pleaseRateTheCinema,
              style: theme.textTheme.bodyLarge!.copyWith(fontSize: 22.sp),
            ),
            SizedBox(height: 5.h),
            RatingBar.builder(
              initialRating: 4,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              // itemSize: 30,
              itemPadding: EdgeInsets.symmetric(horizontal: 3.w),
              itemBuilder: (context, _) =>
              const Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),

            //----------------      Reason     -------------------//

            SizedBox(height: 15.h),
            Align(
              child: Text(
                lang.canYouTellUsTheReason,
                style: theme.textTheme.bodySmall!.copyWith(fontSize: 19.sp),
              ),
            ),
            SizedBox(height: 5.h),

            //----------------      Evaluation     -------------------//

            TextField(
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0x4DD9D9D9),
                hintText: lang.yourEvaluationIsInterested,
                hintStyle: theme.textTheme.bodySmall!
                    .copyWith(fontSize: 13.sp, color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(33.sp),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 20.h),


            //----------------      Button      -------------------//

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF675e7d),
                padding: EdgeInsets.symmetric(
                    horizontal: 26, vertical: 7),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    HiveStorage.get(HiveKeys.isArabic)
                        ? "assets/images/doneArabic.PNG"
                        : "assets/images/Done2.PNG",
                    width: 41,
                    height: 41,
                  ),
                  SizedBox(width: 8),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}