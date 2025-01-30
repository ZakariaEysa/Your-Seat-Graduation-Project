import 'package:flutter/material.dart';
import 'package:yourseatgraduationproject/features/user_flow/chatbot/presentation/widgets/chat_ask.dart';
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
      body: Column(
        mainAxisAlignment:  MainAxisAlignment.spaceBetween,

        children: [
          Expanded(
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              reverse: true, // لجعل المحتوى يبدأ من الأسفل
              child: Column(
                mainAxisAlignment:  MainAxisAlignment.spaceBetween,
                children: [
                  const ChatUp(),
                ],
              ),
            ),
          ),
          Spacer(flex: 2,),
          const ChatAsk(), // TextField سيظهر فوق الكيبورد
        ],
      ),
    );
  }
}