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
        children: [
          // Display back button if onBackPressed is provided
          if (onBackPressed != null)
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: onBackPressed,
            ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          // Add Spacer to balance layout if no back button
          if (onBackPressed == null) const Spacer(),
        ],
      ),
    );
  }
}
