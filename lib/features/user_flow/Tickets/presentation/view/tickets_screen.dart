import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../widgets/app_bar/head_appbar.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';

import '../../../../../generated/l10n.dart';
import '../widget/ticket_card.dart';

class TicketPage extends StatelessWidget {
  final List<Ticket> tickets = [
    Ticket(
      movieName: 'Avengers: Infinity War',
      location: 'Vincom Ocean Park CGV',
      imageUrl: 'assets/images/avg_ticket.png',
      time: '14:15 pm',
      date: '25.9.2024',
      seats: '10,11,12',
      price: '210.000 EGP',
      status: 'Active',
      statusImage: 'assets/icons/icon_active.png',
      statusImageWidth: 28.w,
      statusImageHeight: 28.h,
    ),
    Ticket(
      movieName: 'Batman v Superman',
      location: 'Vincom Ocean Park CGV',
      imageUrl: 'assets/images/bat_ticket.png',
      time: '14:15 pm',
      date: '25.9.2024',
      seats: '10,11,12',
      price: '200.000 EGP',
      status: 'Used   ',
      statusImage: 'assets/icons/user.png',
      statusImageWidth: 24.w,
      statusImageHeight: 24.h,
    ),
    Ticket(
      movieName: 'Guardians of the Galaxy',
      location: 'Vincom Ocean Park CGV',
      imageUrl: 'assets/images/Gua_ticket.png',
      time: '14:15 pm',
      date: '25.9.2024',
      seats: '10,11,12',
      price: '200.000 EGP',
      status: 'Cancelled',
      statusImage: 'assets/icons/canllll.png',
      statusImageWidth: 22.w,
      statusImageHeight: 22.h,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return ScaffoldF(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF2E1371),
        title: Center(  // جعل العنوان في المنتصف
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(80.w, 0, 0, 0), // استخدم `w` لجعل المسافة ديناميكية
            child: HeadAppBar(
              title: lang.tickets,
            ),
          ),

        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h), // جعل التباعد مرنًا
          child: Column(
            children: [
              ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: tickets.length,
                itemBuilder: (context, index) {
                  return TicketCard(
                    ticket: tickets[index],
                    isFirstTicket: index == 0, // تحديد البطاقة الأولى
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
