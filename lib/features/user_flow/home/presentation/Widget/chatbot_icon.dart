import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/navigation.dart';
import '../../../chatbot/presentation/views/chat_bottt.dart';

class DraggableFloatingButton extends StatefulWidget {
  const DraggableFloatingButton({super.key});

  @override
  _DraggableFloatingButtonState createState() =>
      _DraggableFloatingButtonState();
}

class _DraggableFloatingButtonState extends State<DraggableFloatingButton> {
  Offset buttonPosition = Offset(300.w, 650.h); // Starting position

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
                    navigateTo(context: context, screen: const ChatBottt());
                  },
                  child: Image.asset(
                    'assets/images/chat_bot.png',
                    width: 80.w,
                    height: 80.h,
                  ),
                ),
                childWhenDragging: Container(),
                onDraggableCanceled: (velocity, offset) {
                  setState(() {
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
                    navigateTo(context: context, screen: const ChatBottt());
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
