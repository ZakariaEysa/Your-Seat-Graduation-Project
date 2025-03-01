import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/Watch_list/presentation/views/watch_list.dart';
import 'package:yourseatgraduationproject/utils/navigation.dart';
import '../../../../../data/hive_keys.dart';
import '../../../../../data/hive_stroage.dart';
import '../../../../../widgets/app_bar/head_appbar.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';
import '../../../../../generated/l10n.dart';
import '../../../movie_details/data/model/movies_details_model/movies_details_model.dart';
import '../../../my_tikect/presentation/view/ticket_done.dart';
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
      String? userEmail =
          HiveStorage.get(HiveKeys.role) == Role.google.toString()
              ? HiveStorage.getGoogleUser()?.email
              : HiveStorage.getDefaultUser()?.email;

      if (userEmail == null) {
        print("❌ Error: No user email found");
        return;
      }

      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(userEmail).get();
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

  Future<void> cancelTicket(int index) async {
    try {
      String? userEmail =
          HiveStorage.get(HiveKeys.role) == Role.google.toString()
              ? HiveStorage.getGoogleUser()?.email
              : HiveStorage.getDefaultUser()?.email;

      if (userEmail == null) {
        print("❌ Error: No user email found");
        return;
      }

// تحديث الحالة محليًا إلى "pending"
      setState(() {
        tickets[index]['status'] = 'pending';
      });

// تحديث التذكرة في مجموعة `users`
      await _firestore.collection('users').doc(userEmail).update({
        'myTickets': tickets,
      });

// تحديث التذكرة في `Cinemas`
      await updateTicketStatus(
          tickets[index]['cinemaId'], tickets[index]['orderId']);

// إضافة التذكرة إلى `pending_tickets`
      await ticketspending(tickets[index]);

      print("✅ تم تحديث الحالة بنجاح في جميع الأماكن.");
    } catch (e) {
      print("❌ Error canceling ticket: $e");
    }
  }

  Future<void> updateTicketStatus(String cinemaId, String orderId) async {
    try {
      DocumentReference cinemaRef =
          _firestore.collection('Cinemas').doc(cinemaId);

      DocumentSnapshot cinemaSnapshot = await cinemaRef.get();

      if (cinemaSnapshot.exists) {
        Map<String, dynamic>? cinemaData =
            cinemaSnapshot.data() as Map<String, dynamic>?;

        if (cinemaData != null && cinemaData.containsKey('tickets')) {
          List<dynamic> tickets = List.from(cinemaData['tickets']);

          // تحديث حالة التذكرة المطلوبة
          bool updated = false;
          for (int i = 0; i < tickets.length; i++) {
            if (tickets[i]['orderId'] == orderId) {
              tickets[i]['status'] = 'pending';
              updated = true;
              break;
            }
          }

          if (updated) {
            await cinemaRef.update({'tickets': tickets});
            print(
                '✅ تم تحديث التذكرة في السينما إلى "pending" للطلب: $orderId');
          } else {
            print('❌ لم يتم العثور على التذكرة داخل قائمة التذاكر.');
          }
        } else {
          print('❌ لا تحتوي هذه السينما على قائمة تذاكر.');
        }
      } else {
        print('❌ السينما غير موجودة.');
      }
    } catch (e) {
      print('❌ خطأ أثناء تحديث التذكرة في السينما: $e');
    }
  }

  Future<void> ticketspending(Map<String, dynamic> ticketData) async {
    try {
      String orderId = ticketData['orderId'];

      DocumentReference ticketRef =
          _firestore.collection('pending_tickets').doc(orderId);

      await ticketRef.set({
        ...ticketData,
        'status': 'pending',
      });

      print('✅ تم إضافة التذكرة إلى pending_tickets باسم المستند: $orderId');
    } catch (e) {
      print('❌ خطأ أثناء إضافة التذكرة إلى pending_tickets: $e');
    }
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
              ? Center(child: Text("No tickets"))
              : SingleChildScrollView(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                    child: Column(
                      children: [
                        ListView.builder(
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: tickets.length,
                          itemBuilder: (context, index) {
                            final ticket = tickets[index];
                            return InkWell(
                              onTap: () {
                                if (ticket['status'].toString().toLowerCase() == 'active') {
                                  navigateTo(
                                    context: context,
                                    screen: TicketDone(
                                      model: MoviesDetailsModel(
                                        name: ticket['movieName'],
                                        category: ticket['category'],
                                        duration: ticket['duration'],
                                        posterImage: ticket['poster_image'],
                                      ),
                                      seats: List<String>.from(ticket['seats']),
                                      seatCategory: ticket['seatCategory'],
                                      price: ticket['totalPrice'],
                                      location: ticket['cinemaId'],
                                      date: ticket['date'],
                                      time: ticket['time'],
                                      cinemaId: ticket['cinemaId'],
                                      hall: ticket['hall'],
                                      orderId: ticket['orderId'],
                                      status: ticket['status'],
                                    ),
                                  );
                                } else {
                                  print("🚫 لا يمكن عرض التذكرة لأن حالتها ليست 'active'");
                                }
                              },

                              child: TicketCard(
                                ticket: Ticket(
                                  orderId: ticket["orderId"],
                                  movieName: ticket['movieName'],
                                  location: ticket['cinemaId'],
                                  imageUrl: ticket['poster_image'],
                                  time: ticket['time'],
                                  date: ticket['date'],
                                  seats: ticket['seats'].join(', '),
                                  price: ticket['totalPrice']?.toString() ??
                                      '0 EGP',
                                  status: ticket['status'],
                                  statusImage: getStatusImage(ticket['status']),
                                  statusImageWidth: 28.w,
                                  statusImageHeight: 28.h,
                                ),
                                isFirstTicket: ticket['status'] == "active",
                                onCancel: () => cancelTicket(index),
                              ),
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
        return 'assets/icons/pending.png';
    }
  }
}
