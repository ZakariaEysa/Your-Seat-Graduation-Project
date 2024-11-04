import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    // Use LayoutBuilder to get constraints of the Stack
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Positioned(
              left: buttonPosition.dx,
              top: buttonPosition.dy,
              child: Draggable(
                feedback: Image.asset(
                  'assets/images/chat_bot.png',
                  width: 80.w,
                  height: 80.h,
                ),
                childWhenDragging: Container(), // While dragging, hide the original button
                onDraggableCanceled: (velocity, offset) {
                  setState(() {
                    // Ensure the button doesn't go outside the visible area of the Stack
                    double newX = offset.dx;
                    double newY = offset.dy;

                    // Adjust X and Y to stay within the Stack's constraints
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
                child: Image.asset(
                  'assets/images/chat_bot.png',
                  width: 80.w,
                  height: 80.h,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
