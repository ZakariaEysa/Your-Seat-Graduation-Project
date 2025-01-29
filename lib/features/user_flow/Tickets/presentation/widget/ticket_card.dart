import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/Tickets/presentation/widget/vertical_status_card.dart';

class TicketCard extends StatelessWidget {
  final Ticket ticket;
  final bool isFirstTicket;

  const TicketCard({super.key, required this.ticket, this.isFirstTicket = false});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 15.h),
      color: Color(0xFF0E0643),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Container(
        height: 185.h,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12.r),
                bottomLeft: Radius.circular(12.r),
              ),
              child: Image.asset(
                ticket.imageUrl,
                height: double.infinity,
                width: 120.w,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ticket.movieName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 14.sp,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/clock_icon.png',
                          width: 18.w,
                          height: 18.h,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          '${ticket.time}    ${ticket.date}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/location_icon.png',
                          width: 20.w,
                          height: 20.h,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          ticket.location,
                          style: TextStyle(
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/Group 4.png',
                          width: 19.w,
                          height: 15.h,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          'Seat: ${ticket.seats}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 5.h),
                    Row(
                      children: [
                        Image.asset(
                          'assets/icons/price-tag 2.png',
                          width: 18.w,
                          height: 20.h,
                        ),
                        SizedBox(width: 5.w),
                        Text(
                          ticket.price,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                    if (isFirstTicket)
                      Padding(
                        padding: EdgeInsets.only(left: 80.w),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF08086A),
                            fixedSize: Size(140.w, 0.h),
                            side: BorderSide(
                              color: Color(0xFFBD1A2F),
                              width: 1.5.w,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.r),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              fontSize: 13.sp,
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
              imageWidth: ticket.statusImageWidth,
              imageHeight: ticket.statusImageHeight,
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
  final double statusImageWidth;
  final double statusImageHeight;

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
    required this.statusImageWidth,
    required this.statusImageHeight,
  });
}
