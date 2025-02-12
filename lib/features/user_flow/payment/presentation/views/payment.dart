import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/payment_part.dart';
import 'payment_policy.dart';
import '../../../../../utils/navigation.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';

import '../../../../../generated/l10n.dart';
import 'card.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    final theme = Theme.of(context);
    return ScaffoldF(
        appBar: AppBar(
          title: Text(
            lang.payment,
            style: theme.textTheme.labelLarge!.copyWith(fontSize: 24.sp),
          ),
          titleSpacing: 80.0,
          backgroundColor: const Color(0xFF2E1371),
          leading: IconButton(
              onPressed: () {
                navigateTo(context: context, screen: PaymentPolicy());
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 26.sp,
              )),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            PaymentPart(
              total: '210.0 EGP',
              title: lang.paymentMethod,
            ),
            Container(
              width: 292.w,
              height: 50.h,
              decoration: BoxDecoration(
                  color: Color(0xFF382076).withOpacity(.90),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/images/card.png",
                        width: 40.41.w,
                        height: 35.83.h,
                      ),
                      Spacer(),
                      Text(
                        lang.payWithCard,
                        style: theme.textTheme.bodyMedium!
                            .copyWith(fontSize: 16.sp),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {
                            navigateTo(context: context, screen: PaymentCard());
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.white,
                            size: 20.sp,
                          )),
                      //   color: Colors.white,

                      SizedBox(
                        width: 2.w,
                      ),
                    ]),
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Container(
              width: 292.w,
              height: 50.h,
              decoration: BoxDecoration(
                  color: Color(0xFF382076).withOpacity(.90),
                  borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(
                        "assets/images/payy.png",
                        width: 30.w,
                        height: 31.h,
                      ),
                      Spacer(),
                      Text(
                        lang.instapay,
                        style: theme.textTheme.bodyMedium!
                            .copyWith(fontSize: 16.sp),
                      ),
                      Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.arrow_forward_ios_sharp,
                            color: Colors.white,
                            size: 20.sp,
                          )),
                      //   color: Colors.white,

                      SizedBox(
                        width: 1.w,
                      ),
                    ]),
              ),
            ),
            SizedBox(
              height: 60.h,
            ),
            Container(
              width: 208.w,
              height: 36.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xFF31215B),
                border: Border.all(
                  color: Color(0xFF673667),
                  width: 2.w,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(8.sp),
                child: Row(
                  children: [
                    Text(
                      lang.completeYourPaymentIn,
                      style:
                          theme.textTheme.bodyMedium!.copyWith(fontSize: 11.sp),
                    ),
                    Spacer(),
                    Text(
                      "15:00",
                      style: theme.textTheme.bodyMedium!
                          .copyWith(fontSize: 11.sp, color: Color(0xFFC11E88)),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
