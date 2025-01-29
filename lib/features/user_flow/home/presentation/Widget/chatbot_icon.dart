import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/navigation.dart';
import '../../../chatbot/presentation/views/chat_bottt.dart';

class DraggableFloatingButton extends StatefulWidget {
  const DraggableFloatingButton({super.key});

  @override
  _DraggableFloatingButtonState createState() => _DraggableFloatingButtonState();
}

class _DraggableFloatingButtonState extends State<DraggableFloatingButton> {
  late Offset buttonPosition;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    buttonPosition = Offset(screenWidth * 0.75, screenHeight * 0.75);
  }

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
                feedback: FloatingButton(),
                childWhenDragging: Container(),
                onDraggableCanceled: (velocity, offset) {
                  setState(() {
                    double newX = offset.dx.clamp(0, constraints.maxWidth - 80.w);
                    double newY = offset.dy.clamp(0, constraints.maxHeight - 80.h);
                    buttonPosition = Offset(newX, newY);
                  });
                },
                child: GestureDetector(
                  onTap: () => navigateTo(context: context, screen: const ChatBottt()),
                  child: FloatingButton(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class FloatingButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/chat_bot.png',
      width: 80.w,
      height: 80.h,
    );
  }
}
