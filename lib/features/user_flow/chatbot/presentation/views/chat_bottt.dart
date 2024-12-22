import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/chatbot/presentation/widgets/chat_ask.dart';
import 'package:yourseatgraduationproject/features/user_flow/chatbot/presentation/widgets/chat_message.dart';
import 'package:yourseatgraduationproject/widgets/scaffold/scaffold_f.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/chat_up.dart';

class ChatBottt extends StatelessWidget {
  const ChatBottt({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    final theme = Theme.of(context);

    return ScaffoldF(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const ChatUp(),
              const SizedBox(height: 10),
              const ChatMessage(),
              Padding(
                padding: EdgeInsets.only(left: 240.w, top: 30.h),
                child: Container(
                  width: 80.w,
                  height: 45.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF777171),
                        Color(0xFF7E59FD),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    border: Border.all(color: Colors.white),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(18, 0, 0, 0),
                    child: Text(
                      lang.yes,
                      style: theme.textTheme.labelSmall!.copyWith(
                        fontSize: 24.sp,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 310.h),
              const ChatAsk(),
            ],
          ),
        ),
      ),
    );
  }
}
