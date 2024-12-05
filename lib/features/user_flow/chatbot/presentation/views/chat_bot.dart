import 'package:flutter/material.dart';
import 'package:yourseatgraduationproject/features/user_flow/chatbot/presentation/widgets/chat_ask.dart';
import 'package:yourseatgraduationproject/widgets/scaffold/scaffold_f.dart';
import '../widgets/chat_up.dart';

class ChatBot extends StatelessWidget {
  const ChatBot({super.key});

  @override
  Widget build(BuildContext context) {
    return  const ScaffoldF(
      body: Column(children: [
        ChatUp(),
        Spacer(),
        ChatAsk()
      ]),
    );
  }
}
