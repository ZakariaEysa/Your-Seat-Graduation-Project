import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({super.key});

  @override

  Widget build(BuildContext context) {
    return Scaffold(

        body:
        Container(
        padding: const EdgeInsets.only(bottom: 90.0),
    width: 500.sp,
    height: 900.sp,
    decoration: const BoxDecoration(
    gradient: const LinearGradient(
    begin: const Alignment(-0.00, -1.00),
    end: const Alignment(0, 1),
    colors: [const Color(0xFF2E1371), const Color(0xFF130B2B)],
    ),
    ),
    child: const Center(
      child: const Text("Tickets" ,style: const TextStyle(color: Colors.white , fontSize: 50), ),
    ),
    )
            
    );
  }
}
