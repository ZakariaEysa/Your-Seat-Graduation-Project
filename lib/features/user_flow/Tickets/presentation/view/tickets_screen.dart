import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/Watch_list/presentation/views/watch_list.dart';
import 'package:yourseatgraduationproject/features/user_flow/my_tikect/presentation/view/ticket_done.dart';
import 'package:yourseatgraduationproject/utils/navigation.dart';
import '../../../../../data/hive_keys.dart';
import '../../../../../data/hive_stroage.dart';
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
      String? userEmail = HiveStorage.get(HiveKeys.role) == Role.google.toString()
          ? HiveStorage.getGoogleUser()?.email
          : HiveStorage.getDefaultUser()?.email;

      if (userEmail == null) {
        print("❌ Error: No user email found");
        return;
      }

      DocumentSnapshot userDoc = await _firestore.collection('users').doc(userEmail).get();
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
      String? userEmail = HiveStorage.get(HiveKeys.role) == Role.google.toString()
          ? HiveStorage.getGoogleUser()?.email
          : HiveStorage.getDefaultUser()?.email;

      if (userEmail == null) {
        print("❌ Error: No user email found");
        return;
      }

      // تحديث حالة التذكرة محليًا
      setState(() {
        tickets[index]['status'] = 'pending';
      });

      // تحديث بيانات التذكرة في Firestore -> Collection: users
      await _firestore.collection('users').doc(userEmail).update({
        'myTickets': tickets,
      });


      await updateTicketStatus(tickets[index]['cinemaId'] , tickets[index]['orderId'],);

      print("✅ Ticket status updated successfully in both collections.");
      await ticketspending(tickets[index] , userEmail);
    } catch (e) {
      print("❌ Error canceling ticket: $e");
    }
  }


  Future<void> updateTicketStatus(String cinemaId, String orderId) async {
    try {
      // المرجع إلى مجموعة السينمات
      CollectionReference cinemas = FirebaseFirestore.instance.collection('Cinemas');

      // جلب جميع التذاكر داخل السينما المحددة
      QuerySnapshot ticketsSnapshot =
      await cinemas.doc(cinemaId).collection('tickets').get();

      // البحث عن التذكرة التي تحتوي على orderId المطلوب
      for (var doc in ticketsSnapshot.docs) {
        if (doc['orderId'] == orderId) {
          // تحديث الحالة إلى "pending"
          await cinemas
              .doc(cinemaId)
              .collection('tickets')
              .doc(doc.id)
              .update({'status': 'pending'});

          print('تم تحديث الحالة بنجاح للتذكرة ذات المعرف: $orderId');
          return; // الخروج بعد تحديث التذكرة
        }
      }

      // إذا لم يتم العثور على التذكرة
      print('لم يتم العثور على التذكرة بهذا المعرف.');
    } catch (e) {
      print('حدث خطأ: $e');
    }
  }



  Future<void> ticketspending(Map<String, dynamic> ticketData , String emaill) async {
    try {
      String email = ticketData['orderId'];

      // المرجع إلى مجموعة "pending_tickets"
      DocumentReference ticketRef =
      FirebaseFirestore.instance.collection('pending_tickets').doc(email);

      // إضافة البيانات مع تعيين الحالة إلى "pending"
      await ticketRef.set({
        ...ticketData, // بيانات التذكرة
        'status': 'pending', // تعيين الحالة
      });

      print('تمت إضافة التذكرة بنجاح في مجموعة pending_tickets باسم المستند: $email');
    } catch (e) {
      print('حدث خطأ أثناء إضافة التذكرة: $e');
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
                  return InkWell(
                    onTap: (){
                      navigateTo(context: context, screen: WatchList());
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
                        price: ticket['totalPrice']?.toString() ?? '0 EGP',
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
