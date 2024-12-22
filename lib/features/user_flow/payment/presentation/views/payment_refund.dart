import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/card/presentation/views/card_refund.dart';
import 'package:yourseatgraduationproject/features/user_flow/payment/presentation/widgets/payment_part.dart';
import 'package:yourseatgraduationproject/features/user_flow/payment_policy/presentation/views/payment_policy.dart';
import 'package:yourseatgraduationproject/features/user_flow/payment_policy/presentation/views/payment_policy_refund.dart';
import 'package:yourseatgraduationproject/utils/navigation.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';

class PaymentRefund extends StatelessWidget {
  const PaymentRefund({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    final theme = Theme.of(context);
    return ScaffoldF(
        appBar: AppBar(
          title: Text(
            lang.paymentRefund,
            style: theme.textTheme.labelLarge!.copyWith(fontSize: 24.sp),
          ),
          titleSpacing: 40.0,
          backgroundColor: const Color(0xFF2E1371),
          leading: IconButton(
              onPressed: () {
                navigateTo(context: context, screen: PaymentPolicyRefund());
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 25.sp,
              )),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            PaymentPart(total: "240.0 EGP", title: lang.paymentRefundMethod),
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
                            navigateTo(context: context, screen: CarrdRefund());
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
            )
          ],
        ));
  }
}
