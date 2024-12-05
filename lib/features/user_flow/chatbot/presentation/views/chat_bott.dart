import 'package:flutter/material.dart';
import 'package:yourseatgraduationproject/features/user_flow/chatbot/presentation/widgets/chat_ask.dart';
import 'package:yourseatgraduationproject/features/user_flow/chatbot/presentation/widgets/chat_message.dart';
import 'package:yourseatgraduationproject/features/user_flow/chatbot/presentation/widgets/chat_up.dart';
import 'package:yourseatgraduationproject/widgets/scaffold/scaffold_f.dart';
class ChatBott extends StatelessWidget {
  const ChatBott({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return  const ScaffoldF(
      body: Column(
          children: [
        ChatUp(),
        ChatMessage(),
        Spacer(),
        ChatAsk()
      ]),
    );
  }
}
