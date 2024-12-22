import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/Tickets/presentation/widget/dashed_line_painter.dart';
import 'package:yourseatgraduationproject/features/user_flow/about_us/presentation/views/about_us.dart';
import 'package:yourseatgraduationproject/features/user_flow/my_tikect/presentation/widget/center_text.dart';
import 'package:yourseatgraduationproject/widgets/app_bar/head_appbar.dart';
import 'package:yourseatgraduationproject/widgets/scaffold/scaffold_f.dart';

import '../widget/head_myticket.dart';
import '../widget/qr_state.dart';

class TicketDone extends StatelessWidget {
  const TicketDone({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldF(
      appBar: AppBar(
        backgroundColor: Color(0xFF2E1371),
        title: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(45, 0, 0, 15),
          child: HeadAppBar(title: "My ticket"),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(20, 50, 20, 50),
            child: Container(
              width: 400.w,
              height: 800.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
          HeadMyticket(),
          Positioned(
            bottom: 0,
            left: 342,
            right: 0,
            top: 340,
            child: Image.asset(
              'assets/icons/img.png',
            ),
          ),
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0, 330, 0, 0),
            child: Center(
              child: CustomPaint(
                size: Size(310, .8), // Width and height of the line
                painter: DashedLinePainter(
                  dashWidth: 10.0, // Width of the dashes
                  dashSpace: 5.0, // Space between the dashes
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 342,
            top: 340,
            child: Image.asset(
              'assets/icons/img_1.png',
              width: 30,
            ),
          ),
          Divider(
            color: Color(0xff1A0E3D),
            height: 700.h,
            indent: 40.sp,
            endIndent: 40.sp,
            thickness: .5,
          ),
const CenterText(),
          const  QrState()
        ],
      ),
    );
  }
}
