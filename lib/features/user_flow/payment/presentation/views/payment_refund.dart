import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/payment/presentation/widgets/payment_part.dart';

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
              height: 30.h,
            ),
            PaymentPart(total: "240.0 EGP", title:lang.paymentRefundMethod)
          ],
        ));
  }
}
