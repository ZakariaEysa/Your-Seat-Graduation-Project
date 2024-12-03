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
    // return Row(
    //   children: [
    //     // Display back button if onBackPressed is provided
    //     // if (onBackPressed != null)
    //     //   IconButton(
    //     //     icon: Icon(Icons.arrow_back, color: Colors.white),
    //     //     onPressed: onBackPressed,
    //     //   ),
      return  Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );




  }
}
