import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/home/presentation/views/home_layout.dart';

import '../../../../../generated/l10n.dart';
import '../../../../../utils/navigation.dart';

class ChatUp extends StatelessWidget{
  const ChatUp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    var lang = S.of(context);
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 50.h, right: 20.w, left: 20.w),
          child: Row(
            children: [
             IconButton(onPressed:(){
               navigateTo(context: context, screen: HomeLayout());
             }, icon:Icon(Icons.close,size:30,),color: Colors.white,),
              const Spacer(),
              Image.asset(
                'assets/images/chatbot.png',
                width: 60.w,
                height: 60.h,
              ),
            ],
          ),
        ),
        Padding(
          padding:  EdgeInsetsDirectional.fromSTEB(15, 20,90, 0),
          child: Text(
            lang.HelloIamyourAIAssistant,
            style: theme.textTheme.titleLarge!.copyWith(fontSize: 35.sp),
            textAlign: TextAlign.start,
          ),
        ),


      ],
    );
  }
}