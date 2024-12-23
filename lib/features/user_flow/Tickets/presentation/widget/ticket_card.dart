import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/Tickets/presentation/widget/vertical_status_card.dart';

class TicketCard extends StatelessWidget {
  final Ticket ticket;
  final bool isFirstTicket; // Add this to track if it's the first ticket

  const TicketCard({super.key, required this.ticket, this.isFirstTicket = false}); // Def

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 15),
      color: Color(0xFF0E0643),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SizedBox(
        height: 185.h,

        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
              child: Image.asset(
                ticket.imageUrl,
                height: double.infinity,
                width: 120,
                fit: BoxFit.cover,
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
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/clock_icon.png',
                          width: 20,
                          height: 20,
                        ),
                        SizedBox(width: 5.w),
                        Text('${ticket.time}    ${ticket.date}',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/location_icon.png',
                          width: 20,
                          height: 20,
                        ),
                        SizedBox(width: 5.w),
                        Text(ticket.location),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/Group 4.png',
                          width: 19,
                          height: 15,
                        ),
                        SizedBox(width: 5.w),
                        Text('Seat: ${ticket.seats}',
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/price-tag 2.png',
                          width: 20,
                          height: 20,
                        ),
                        SizedBox(width: 5.w),
                        Text(ticket.price,
                            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                      ],

                    ),
                    if (isFirstTicket)
                      Padding(
                        padding: const EdgeInsets.only(left: 100 , ),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF08086A),
                            fixedSize: Size(100.w, 10.h),
                            side: BorderSide(color: Color(0xFFBD1A2F), width: 2.w), // لون وسمك الحدود
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),

            VerticalStatusCard(
              status: ticket.status,
              imagePath: ticket.statusImage,
            ),
          ],
        ),
      ),
    );
  }
}

class Ticket {
  final String movieName;
  final String location;
  final String imageUrl;
  final String time;
  final String date;
  final String seats;
  final String price;
  final String status;
  final String statusImage;

  Ticket({
    required this.movieName,
    required this.location,
    required this.imageUrl,
    required this.time,
    required this.date,
    required this.seats,
    required this.price,
    required this.status,
    required this.statusImage,
  });
}
