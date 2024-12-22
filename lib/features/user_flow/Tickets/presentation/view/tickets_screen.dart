import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/about_us/presentation/views/about_us.dart';
import 'package:yourseatgraduationproject/widgets/app_bar/head_appbar.dart';
import 'package:yourseatgraduationproject/widgets/scaffold/scaffold_f.dart';



import '../../../../../generated/l10n.dart';
import '../widget/ticket_card.dart';
import '../widget/vertical_status_card.dart';

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
    ),
    Ticket(
      movieName: 'Batman v Superman',
      location: 'Vincom Ocean Park CGV',
      imageUrl: 'assets/images/bat_ticket.png',
      time: '14:15 pm',
      date: '25.9.2024',
      seats: '10,11,12',
      price: '200.000 EGP',
      status: 'Used',
      statusImage: 'assets/icons/user.png',
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
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return ScaffoldF(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF2E1371),
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(100, 0, 0, 0),
          child: HeadAppBar(
            title: lang.tickets,
          ),
        ),
      ),
      body:  ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: tickets.length,
        itemBuilder: (context, index) {
          return TicketCard(
            ticket: tickets[index],
            isFirstTicket: index == 0, // Pass true only for the first ticket
          );
        },
      ),
    );
  }
}


