import 'package:flutter/material.dart';
class SignInPart extends StatelessWidget{
  String title;
  final IconData icon;
  SignInPart({super.key,required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
   return Container(
           width: 150,
           height: 60,
           decoration: const BoxDecoration(color: Color(0xFF1D013A)),
           child:  Padding(
             padding: const EdgeInsets.all(16.0),
             child: Row(
               children: [
                 Icon(
                   icon, // Use the provided icon
                   color: Colors.white,
                   size: 30,
                 ),
                 const SizedBox(width: 20),
                 Text(
                   title,
                   style: const TextStyle(color: Colors.white, fontSize: 20),
                 ),

               ],
             ),
           ),





   );
  }

}