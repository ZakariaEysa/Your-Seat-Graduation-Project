import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/payment/presentation/widgets/payment_part.dart';
import 'package:yourseatgraduationproject/widgets/scaffold/scaffold_f.dart';

import '../../../../../generated/l10n.dart';

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
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              )),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            PaymentPart(
              total: '210.0 EGP',
              title:lang.paymentMethod,
            ),
            SizedBox(
              height: 60.h,
            ),
            Container(
              width:220.w,
              height: 36.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xFF31215B),
                border: Border.all(
                  color: Color(0xFF673667),
                  width: 2.w,
                ),
              ),
              child:Padding(
                padding: EdgeInsets.all(8.sp),
                child: Row(
                  children: [
                    Text(lang.completeYourPaymentIn,style: theme.textTheme.bodyMedium!.copyWith(fontSize:11.sp),),
                   Spacer(),
                    Text("15:00",style: theme.textTheme.bodyMedium!.copyWith(fontSize:11.sp,color: Color(0xFFC11E88)),),

                  ],
                ),
              ),
            )
          ],
        ));
  }
}
