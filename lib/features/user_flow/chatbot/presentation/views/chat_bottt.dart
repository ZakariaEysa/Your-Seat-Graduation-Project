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
      bottomNavigationBar: ChatAsk(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start ,
          children: [
            const ChatUp(),



          ],
        ),
      ),
    );
  }
}
