import 'package:flutter/material.dart';

class HeadAppBar extends StatelessWidget {
  final String title;
  final VoidCallback? onBackPressed;

  const HeadAppBar({
    super.key,
    required this.title,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0XFFFFFFFF)),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
