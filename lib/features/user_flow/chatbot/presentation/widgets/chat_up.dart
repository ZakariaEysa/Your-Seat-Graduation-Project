import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/home/presentation/views/home_layout.dart';

import '../../../../../utils/navigation.dart';

class ChatUp extends StatelessWidget{
  const ChatUp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 50.h, right: 20.w, left: 20.w),
          child: Row(
            children: [
              GestureDetector(
                  onTap: () {
                    navigateTo(context: context, screen: const HomeLayout());
                  },
                  child: Image.asset('assets/icons/close.png')),
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
          padding:  EdgeInsets.only(top:20.h, right: 100.w),
          child: Text(
            'Hello , I’m your AI\nAssistant !',
            style: theme.textTheme.titleLarge!.copyWith(fontSize: 35.sp),
            textAlign: TextAlign.start,
          ),
        ),


      ],
    );
  }
}