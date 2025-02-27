import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../widgets/app_bar/head_appbar.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';
import '../../../../../generated/l10n.dart';
import '../widget/ticket_card.dart';

class TicketPage extends StatefulWidget {
  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> tickets = [];
  bool isLoading = true;

  Future<void> fetchTickets() async {
    try {
      DocumentSnapshot userDoc = await _firestore.collection('users').doc('yourseatgp@gmail.com').get();
      if (userDoc.exists) {
        List<dynamic>? myTickets = userDoc.get('myTickets');
        if (myTickets != null) {
          setState(() {
            tickets = List<Map<String, dynamic>>.from(myTickets);
          });
        }
      }
    } catch (e) {
      print("❌ Error fetching tickets: $e");
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchTickets();
  }

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return ScaffoldF(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF2E1371),
        title: Center(
          child: Padding(
            padding: EdgeInsetsDirectional.only(start: 80.w),
            child: HeadAppBar(title: lang.tickets),
          ),
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : tickets.isEmpty
          ? Center(child: Text("error")) // يمكنك استبداله بنص مناسب
          : SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          child: Column(
            children: [
              ListView.builder(
                padding: EdgeInsets.symmetric(vertical: 10.h),
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: tickets.length,
                itemBuilder: (context, index) {
                  final ticket = tickets[index];
                  return TicketCard(
                    ticket: Ticket(
                      movieName: ticket['movieName'],
                      location: ticket['cinemaId'],
                      imageUrl: ticket['poster_image'],
                      time: ticket['time'],
                      date: ticket['date'],
                      seats: ticket['seats'].join(', '),
                      price: ticket['totalPrice']?.toString() ?? '0 EGP', // ✅ معالجة null
                      status: ticket['status'],
                      statusImage: getStatusImage(ticket['status']),
                      statusImageWidth: 28.w,
                      statusImageHeight: 28.h,
                    ),
                    // isFirstTicket: ticket['status'] == "active",
                    isFirstTicket: ticket['status'] == "active",
                  );
                },
              ),

            ],
          ),
        ),
      ),
    );
  }

  String getStatusImage(String status) {
    switch (status.toLowerCase()) {
      case 'active':
        return 'assets/icons/icon_active.png';
      case 'used':
        return 'assets/icons/user.png';
      case 'cancelled':
        return 'assets/icons/canllll.png';
      default:
        return 'assets/icons/default_status.png'; // صورة افتراضية للحالات غير المعروفة
    }
  }
}
