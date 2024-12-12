import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/views/sign_in.dart';
import 'package:yourseatgraduationproject/utils/navigation.dart';
import 'package:yourseatgraduationproject/widgets/scaffold/scaffold_f.dart';

import '../../../../../data/hive_keys.dart';
import '../../../../../data/hive_stroage.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../widgets/button/button_builder.dart';
import '../../../../../widgets/text_field/text_field/text_form_field_builder.dart';
import '../../../forget/presentation/views/forget.dart';

class NewPassword extends StatefulWidget{

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  bool obscure = true;
  bool obscure2 = true;
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var lang = S.of(context);
    return ScaffoldF(
      appBar:AppBar(
        backgroundColor: Color(0xFF2E1371),
        leading: IconButton(onPressed:(){
          navigateTo(context: context, screen: Forget());
        }, icon:Icon(Icons.arrow_back,color: Colors.white,size:25,)),
        title: Text(lang.createNewPassword,style:theme.textTheme.labelLarge!.copyWith(fontSize:24.sp),),
        titleSpacing:20,
      ),
        body:SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top:50.h),
                child: Image.asset("assets/images/image 14.png",width:210.w,height:207.h,),
              ),
              SizedBox(
                height: 50.h,
              ),
              Text(lang.yourNewPasswordMustBeDifferentFromPreviouslyUsedPassword,
                  style: theme.textTheme.bodyMedium!.copyWith(
                    fontSize:18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center),
              SizedBox(
                height: 50.h,
              ),
              TextFormFieldBuilder(
                width: 330.w,
                height: 48.h,
                controller: newPasswordController,
                type: TextInputType.visiblePassword,
                label: lang.newPassword,
                imagePath: "assets/images/padlock.png",
                color: Color(0xFF2E126E),
                obsecure: obscure,
                suffixIcon:  InkWell(
                    onTap: () {
                      setState(() {
                        obscure = !obscure;
                      });
                    },
                    child: Icon(
                      obscure
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.grey,
                    )),
              ),
              SizedBox(
                height:20.h,
              ),
              TextFormFieldBuilder(
                width: 330.w,
                height: 48.h,
                controller: confirmPasswordController,
                type: TextInputType.visiblePassword,
                label:lang.confirmPassword,
                hinitText: "",
                imagePath: "assets/icons/access (1).png",
                color: Color(0xFF2E126E),
                obsecure: obscure2,
                suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        obscure2 = !obscure2;
                      });
                    },
                    child: Icon(
                      obscure2
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Colors.grey,
                    )),

              ),
              SizedBox(
                height: 50.h,
              ),
              ButtonBuilder(
                width: 220.w,
                height:52.h,
                image: HiveStorage.get(HiveKeys.isArabic)
                    ? "assets/icons/save1_arabic.png"
                    : "assets/icons/save1111.png",
                text: "",
                onTap: () {
                  navigateTo(context: context, screen: SignIn());
                },
              ),
              SizedBox(
                height: 60.h,
              ),

            ],
          ),
        )
    );
  }
}