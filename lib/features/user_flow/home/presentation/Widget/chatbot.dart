import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/home/presentation/views/home_screen.dart';

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
    return Positioned(
      left: buttonPosition.dx,
      top: buttonPosition.dy,
      child: Draggable(
        feedback: Image.asset(
          'assets/images/chat_bot.png',
          width: 80.w,
          height: 80.h,
        ),
        childWhenDragging:
            Container(), // While dragging, hide the original button
        onDraggableCanceled: (velocity, offset) {
          setState(() {
            buttonPosition = offset;
          });
        },
        child: Image.asset(
          'assets/images/chat_bot.png',
          width: 80.w,
          height: 80.h,
        ),
      ),
    );
  }
}
