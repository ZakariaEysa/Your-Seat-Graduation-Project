import 'package:flutter/material.dart';
class SignInPart extends StatelessWidget{
  String title;
  final IconData icon;
  SignInPart({super.key,required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      width:331,
      height: 52,
      decoration: const BoxDecoration(color: Color(0xFF1D013A)),
      child:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Icon(
              icon, // Use the provided icon
              color: Colors.white,
              size: 40,
            ),
            const SizedBox(width: 20),
            Text(
              title,
              style:theme.textTheme.labelLarge!.copyWith(fontSize: 17),
            ),

          ],
        ),
      ),





    );
  }

}