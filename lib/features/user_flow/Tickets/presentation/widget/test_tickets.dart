import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TicketsScreen extends StatefulWidget {
  @override
  _TicketsScreenState createState() => _TicketsScreenState();
}

class _TicketsScreenState extends State<TicketsScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> tickets = [];

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
      print("Error fetching tickets: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchTickets();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Tickets")),
      body: tickets.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: tickets.length,
        itemBuilder: (context, index) {
          final ticket = tickets[index];
          return Card(
            margin: EdgeInsets.all(10),
            child: ListTile(
              title: Text("🎬 ${ticket['movieName']}"),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("📍 Cinema: ${ticket['cinemaId']}"),
                  Text("🗓️ Date: ${ticket['date']}"),
                  Text("🕒 Time: ${ticket['time']}"),
                  Text("🏛️ Hall: ${ticket['hall']}"),
                  Text("🎟️ Category: ${ticket['seatCategory']}"),
                  Text("🪑 Seats: ${ticket['seats'].join(', ')}"),
                  Text("📌 Status: ${ticket['status']}"),
                  Text("🔢 Order ID: ${ticket['orderId']}"),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
