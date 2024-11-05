import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/chatbot/presentation/widgets/chat_ask.dart';
import 'package:yourseatgraduationproject/features/user_flow/chatbot/presentation/widgets/chat_message.dart';
import 'package:yourseatgraduationproject/widgets/scaffold/scaffold_f.dart';
import '../widgets/chat_up.dart';

class ChatBottt extends StatelessWidget {
  const ChatBottt({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ScaffoldF(
      body: Column(children: [
        const ChatUp(),
        const ChatMessage(),
        Padding(
          padding: EdgeInsets.only(left: 200.w,top: 30.h),
          child: Container(
              width: 128.w,
              height: 55.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF777171),
                      Color(0xFF7E59FD),

                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  border: Border.all(
                      color: Colors.white
                  )

              ),
              child: Padding(
                padding:  EdgeInsets.all(8.0.sp),
                child: Text(' Yes , plz ',style: theme.textTheme.labelSmall!.copyWith(fontSize: 24.sp,color: Colors.white),),
              )
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right:250.w,),
          child: Container(
              width: 100.w,
              height: 50.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF802886),
                      Color(0xFF3E1B95),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  border: Border.all(
                      color: Colors.white
                  )

              ),
              child: Padding(
                padding: EdgeInsets.all(5.0.sp),
                child: Text(' typing ...',style: theme.textTheme.labelSmall!.copyWith(fontSize: 24.sp,color: Colors.white),),
              )
          ),
        ),
       const Spacer(),
        const ChatAsk()

       ]),
    );
  }
}

