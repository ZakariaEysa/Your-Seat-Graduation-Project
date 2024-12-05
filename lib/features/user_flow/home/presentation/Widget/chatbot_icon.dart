import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/chatbot/presentation/views/chat_bott.dart';

import '../../../chatbot/presentation/views/chat_bot.dart';
import '../../../chatbot/presentation/views/chat_bottt.dart';

class DraggableFloatingButton extends StatefulWidget {
  const DraggableFloatingButton({Key? key}) : super(key: key);

  @override
  _DraggableFloatingButtonState createState() =>
      _DraggableFloatingButtonState();
}

class _DraggableFloatingButtonState extends State<DraggableFloatingButton> {
  Offset buttonPosition = Offset(300.w, 680.h); // Starting position

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Positioned(
              left: buttonPosition.dx,
              top: buttonPosition.dy,
              child: Draggable(
                feedback: GestureDetector(
                  onTap: () {
                    navigateTo(context: context, screen: ChatBottt);

                  },
                  child: Image.asset(
                    'assets/images/chat_bot.png',
                    width: 80.w,
                    height: 80.h,
                  ),
                ),
                childWhenDragging: Container(), // Hide original button while dragging
                onDraggableCanceled: (velocity, offset) {
                  setState(() {
                    // Adjust button position to stay within bounds
                    double newX = offset.dx;
                    double newY = offset.dy;

                    if (newX < 0) newX = 0;
                    if (newY < 0) newY = 0;
                    if (newX > constraints.maxWidth - 80.w) {
                      newX = constraints.maxWidth - 80.w;
                    }
                    if (newY > constraints.maxHeight - 80.h) {
                      newY = constraints.maxHeight - 80.h;
                    }

                    buttonPosition = Offset(newX, newY);
                  });
                },
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatBott()), // Navigate to ChatBot screen
                    );
                  },
                  child: Image.asset(
                    'assets/images/chat_bot.png',
                    width: 80.w,
                    height: 80.h,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}


