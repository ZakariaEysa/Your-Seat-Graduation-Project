import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/about_us/presentation/views/about_us.dart';
import 'package:yourseatgraduationproject/features/user_flow/card/presentation/widgets/card_part.dart';
import 'package:yourseatgraduationproject/features/user_flow/payment/presentation/views/payment.dart';
import 'package:yourseatgraduationproject/features/user_flow/payment_done/presentation/views/payment_successful.dart';

import '../../../../../data/hive_keys.dart';
import '../../../../../data/hive_stroage.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../utils/navigation.dart';
import '../../../../../widgets/button/button_builder.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';
import '../../../../../widgets/text_field/text_field/text_form_field_builder.dart';
import '../../../auth/presentation/views/otp.dart';

class Carrd extends StatefulWidget {
  const Carrd({super.key});

  @override
  State<Carrd> createState() => _CarrdState();
}

class _CarrdState extends State<Carrd> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    final theme = Theme.of(context);
    return ScaffoldF(
        appBar: AppBar(
          title: Text(
            lang.cardInformation,
            style: theme.textTheme.labelLarge!.copyWith(fontSize: 23.sp),
          ),
          titleSpacing: 40.0,
          backgroundColor: const Color(0xFF2E1371),
          leading: IconButton(
              onPressed: () {
                navigateTo(context: context, screen:Payment());
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size:25.sp,
              )),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.only(left: 30.w, top: 50.h, right: 20.w),
              child:Column(
                children: [
                  CardPart(),
                    Padding(
                      padding:EdgeInsets.only(left:35.w,top:30.h),
                      child: Row(
                        children: [
                          Transform.scale(
                            scale:1.4,
                            child: Checkbox(
                              activeColor:Colors.transparent,
                              value: isChecked,
                              side: BorderSide(
                                color: Colors.white,
                                width:1.3.w,
                              ),
                              checkColor: Colors.white,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value ?? false;
                                });
                              },
                            ),
                          ),

                          Text(
                              lang.storeCardForFutureUse,
                              style:theme.textTheme.bodyMedium!.copyWith(fontSize:16.sp,fontWeight: FontWeight.bold)
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height:40.h,),
                    ButtonBuilder(
                            width: 287.w,
                            height:58.h,
                            text:lang.completeYourPurchase,buttonColor:Color(0xFFF2F2F2).withOpacity(.29),
                            frameColor:Color(0xFFFF89F3),
                            style:theme.textTheme.titleMedium!.copyWith(fontSize:16.sp,),
                            onTap: () {
                              navigateTo(context: context, screen:PaymentSuccessful());
                            },
                          ),



                  ] )
          ),
        ));
  }
}
