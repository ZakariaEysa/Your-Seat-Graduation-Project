import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/widgets/network_image/image_replacer.dart';
import '../views/card.dart';
import '../../../../../utils/navigation.dart';

import '../../../../../generated/l10n.dart';

class PaymentPart extends StatelessWidget {
  final String total;
  final String title;
  const PaymentPart({super.key, required this.total, required this.title});

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    final theme = Theme.of(context);
    return Column(children: [
      Container(
        width: 350.w,
        height: 273.h,
        decoration: BoxDecoration(
            color: Color(0xFF3B2082).withOpacity(.90),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Container(
              width: 335.w,
              height: 141.h,
              decoration: BoxDecoration(
                  color: Color(0xFF382076).withOpacity(.90),
                  borderRadius: BorderRadius.circular(20)),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: ImageReplacer(
                      imageUrl: "assets/images/film11111.png",
                      width: 95.w,
                      height: 105.h,
                    ),
                  ),
                  SizedBox(width: 9.w),
                  Padding(
                    padding: EdgeInsets.only(top: 20.h),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Avengers: Infinity War",
                          style: theme.textTheme.bodyMedium!
                              .copyWith(fontSize: 19.sp, color: Colors.yellow),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/icons/video-play.png",
                              width: 16.w,
                              height: 16.h,
                              color: Color(0xFFE6E6E6),
                            ),
                            SizedBox(
                              width: 10.h,
                            ),
                            Text(
                              "Acton, adventure, sci-fi",
                              style: theme.textTheme.bodyMedium!.copyWith(
                                  fontSize: 12.sp, color: Color(0xFFE6E6E6)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/icons/location1.png",
                              width: 16.w,
                              height: 16.h,
                              color: Color(0xFFE6E6E6),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "Vincom Ocean Park CGV",
                              style: theme.textTheme.bodyMedium!.copyWith(
                                  fontSize: 12.sp, color: Color(0xFFE6E6E6)),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/icons/clock.png",
                              width: 16.w,
                              height: 16.h,
                              color: Color(0xFFE6E6E6),
                            ),
                            SizedBox(
                              width: 10.h,
                            ),
                            Text(
                              "10.12.2022 • 14:15",
                              style: theme.textTheme.bodyMedium!.copyWith(
                                  fontSize: 12.sp, color: Color(0xFFE6E6E6)),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40.w, top: 20.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    lang.seat,
                    style:
                        theme.textTheme.bodyMedium!.copyWith(fontSize: 20.sp),
                  ),
                  SizedBox(
                    width: 60.w,
                  ),
                  Text("F10, F11 , F12",
                      style:
                          theme.textTheme.bodyMedium!.copyWith(fontSize: 20.sp))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 40.w, top: 15.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    lang.total,
                    style:
                        theme.textTheme.bodyMedium!.copyWith(fontSize: 20.sp),
                  ),
                  SizedBox(
                    width: 60.w,
                  ),
                  Text(total,
                      style:
                          theme.textTheme.bodyMedium!.copyWith(fontSize: 20.sp))
                ],
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        height: 30.h,
      ),
      Text(
        title,
        style: theme.textTheme.labelLarge!.copyWith(fontSize: 20.sp),
      ),
      SizedBox(
        height: 50.h,
      ),
    ]);
  }
}
