import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/chat_ask.dart';
import '../../../../../generated/l10n.dart';
import '../widgets/chat_up.dart';

class ChatBottt extends StatelessWidget {
  const ChatBottt({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    final theme = Theme.of(context);
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
        width: 500.w,
        height: 900.h,
        decoration: BoxDecoration(
        gradient: LinearGradient(
        begin: const Alignment(-0.00, -1.00),
    end: const Alignment(0, 1),
    colors: [theme.primaryColor, theme.colorScheme.secondary],
    ),
    ), child:  Column(

        children: [
          Expanded(
            child: SingleChildScrollView(

              child: Column(
                children: [
                  const ChatUp(),
                ],
              ),
            ),
          ),
          const ChatAsk(), // TextField سيظهر فوق الكيبورد
        ],
      ),
    ));
  }
}