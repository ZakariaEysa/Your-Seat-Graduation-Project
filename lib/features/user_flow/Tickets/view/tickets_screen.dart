
import 'package:flutter/material.dart';
import 'package:yourseatgraduationproject/widgets/scaffold/scaffold_f.dart';

import '../../../../widgets/app_bar/head_appbar.dart';

class TicketPage extends StatelessWidget {
  final List<Ticket> tickets = [
    Ticket(
      movieName: 'Avengers: Infinity War',
      imageUrl: 'assets/images/avg_ticket.png',
      time: '14:15 pm',
      date: '25.9.2024',
      seats: '10,11,12',
      price: '210.000 EGP',
      status: TicketStatus.active,
    ),
    Ticket(
      movieName: 'Batman v Superman',
      imageUrl: 'assets/images/bat_ticket.png',
      time: '14:15 pm',
      date: '25.9.2024',
      seats: '10,11,12',
      price: '200.000 EGP',
      status: TicketStatus.used,
    ),
    Ticket(
      movieName: 'Guardians of the Galaxy',
      imageUrl: 'assets/images/Gua_ticket.png',
      time: '14:15 pm',
      date: '25.9.2024',
      seats: '10,11,12',
      price: '200.000 EGP',
      status: TicketStatus.canceled,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ScaffoldF(

      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF2E1371),
        title: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(100, 0, 0, 0),
          child: HeadAppBar(
            title: "Tickets",
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: tickets.length,
        itemBuilder: (context, index) {
          return TicketCard(ticket: tickets[index]);
        },
      ),

    );
  }
}

class TicketCard extends StatelessWidget {
  final Ticket ticket;

  TicketCard({required this.ticket});

  @override
  Widget build(BuildContext context) {
    Color statusColor = _getStatusColor(ticket.status);
    String statusText = _getStatusText(ticket.status);

    return Card(
      margin: EdgeInsets.only(bottom: 15),
      color: Color(0xFF3E1E68),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        height: 150, // الارتفاع الكلي للكارت
        child: Row(
          children: [
            // الصورة تأخذ ارتفاع الكارت بالكامل
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: Image.asset(
                ticket.imageUrl,
                height: double.infinity, // تمدد الصورة لتأخذ كامل الارتفاع
                width: 120, // عرض مناسب للصورة
                fit: BoxFit.cover, // تحكم في كيفية تمدد الصورة
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(ticket.movieName,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                    SizedBox(height: 5),
                    Text('${ticket.time}    ${ticket.date}',
                        style: TextStyle(color: Colors.white)),
                    SizedBox(height: 5),
                    Text('Seat: ${ticket.seats}',
                        style: TextStyle(color: Colors.white)),
                    SizedBox(height: 5),
                    Text(ticket.price,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: statusColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    child: Text(
                      statusText,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  SizedBox(height: 8),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.red),
                      minimumSize: Size(50, 25),
                    ),
                    child: Text('Cancel',
                        style: TextStyle(color: Colors.red, fontSize: 12)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getStatusColor(TicketStatus status) {
    switch (status) {
      case TicketStatus.active:
        return Colors.green;
      case TicketStatus.used:
        return Colors.blue;
      case TicketStatus.canceled:
        return Colors.red;
      default:
        return Colors.grey;
    }
  }

  String _getStatusText(TicketStatus status) {
    switch (status) {
      case TicketStatus.active:
        return 'Active';
      case TicketStatus.used:
        return 'Used';
      case TicketStatus.canceled:
        return 'Canceled';
      default:
        return '';
    }
  }
}



class Ticket {
  final String movieName;
  final String imageUrl;
  final String time;
  final String date;
  final String seats;
  final String price;
  final TicketStatus status;

  Ticket({
    required this.movieName,
    required this.imageUrl,
    required this.time,
    required this.date,
    required this.seats,
    required this.price,
    required this.status,
  });
}

enum TicketStatus { active, used, canceled }
