import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/about_us/presentation/views/about_us.dart';

import '../../../../../data/hive_keys.dart';
import '../../../../../data/hive_stroage.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../utils/navigation.dart';
import '../../../../../widgets/button/button_builder.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';
import '../../../../../widgets/text_field/text_field/text_form_field_builder.dart';
import '../../../auth/presentation/views/otp.dart';

class CarrdRefund extends StatefulWidget {
  const CarrdRefund({super.key});

  @override
  State<CarrdRefund> createState() => _CarrdState();
}

class _CarrdState extends State<CarrdRefund> {
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
              onPressed: () {},
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 30,
              )),
        ),
        body: Padding(
            padding: EdgeInsets.only(left: 30.w, top: 50.h, right: 20.w),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                   lang.cardNumber,
                    style: theme.textTheme.bodyMedium!.copyWith(fontSize: 20.sp),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                      width: 318.w,
                      height: 58.h,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2F2F2).withOpacity(.29),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Color(0xFFFF89F3).withOpacity(.30),
                          width: 1.w
                          ,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.w, top: 10.h),
                        child: TextFormField(
                          obscureText: true,
                          style:theme.textTheme.bodyMedium!.copyWith(fontSize:18,color: Colors.white) ,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "*************",
                            hintStyle:theme.textTheme.bodyMedium!.copyWith(color: Color(0xFFA59B9B),letterSpacing: 3,fontSize: 18.sp
                            ),

                          ),
                        ),
                      )),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    lang.expiryDate,
                    style: theme.textTheme.bodyMedium!.copyWith(fontSize: 20.sp),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                      width: 318.w,
                      height: 58.h,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2F2F2).withOpacity(.29),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Color(0xFFFF89F3).withOpacity(.30),
                          width: 1.w,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.w, top: 10.h),
                        child: TextFormField(
                          obscureText: true,
                          style:theme.textTheme.bodyMedium!.copyWith(fontSize:18,color: Colors.white) ,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "MM / YYYY",
                            hintStyle:theme.textTheme.bodyMedium!.copyWith(color: Color(0xFFA59B9B),letterSpacing: 3,fontSize: 18.sp),

                          ),
                        ),
                      )),
                  SizedBox(
                    height: 20.h,
                  ),
                  Text(
                    lang.cvv,
                    style: theme.textTheme.bodyMedium!.copyWith(fontSize: 20.sp),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Container(
                      width: 318.w,
                      height: 58.h,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2F2F2).withOpacity(.29),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Color(0xFFFF89F3).withOpacity(.30),
                          width: 1.w,
                        ),
                      ),
                      child: Padding(
                        padding:EdgeInsets.only(left: 20.w, top: 10.h),
                        child: TextFormField(
                          obscureText: true,
                          style:theme.textTheme.bodyMedium!.copyWith(fontSize:18.sp,color: Colors.white) ,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "*****",
                            hintStyle:theme.textTheme.bodyMedium!.copyWith(color: Color(0xFFA59B9B),letterSpacing: 3,fontSize: 18.sp),

                          ),
                        ),
                      )),
                  SizedBox(height: 50.h,),
                  SizedBox(height: 60.h,),
                  Container(
                      height:58,
                      width:287,
                      decoration: BoxDecoration(
                        color: Color(0xFFDCD3D3).withOpacity(.50),
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(
                          color: Color(0xFFFF89F3).withOpacity(.35),
                          width: 1.w,
                        ),
                      ),
                      child:ElevatedButton(onPressed: () {  }, child:Image.asset(HiveStorage.get(HiveKeys.isArabic)
                          ? "assets/icons/send11_arabic.png"
                          : "assets/images/complete_your_purchase.png",),

                      )
                  ),
                ] )
        ));
  }
}
