import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yourseatgraduationproject/data/hive_stroage.dart';
import 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit() : super(NotificationInitial());

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  var currentUserEmail = HiveStorage.getDefaultUser()?.email ?? "";

  List<Map<String, String>> notifications = [];

  Future<void> initializeNotificationList() async {
    emit(NotificationLoading());
    try {
      final userDoc = firestore.collection('users').doc(currentUserEmail);
      final snapshot = await userDoc.get();

      if (snapshot.exists) {
        final data = snapshot.data()!;
        if (!data.containsKey('notifications')) {
          await userDoc.set({'notifications': []}, SetOptions(merge: true));
        }
        await fetchNotifications();
      } else {
        await userDoc.set({'notifications': []});
        notifications = [];
        emit(NotificationLoaded([]));
      }
    } catch (e) {
      emit(NotificationError(e.toString()));
    }
  }

  Future<void> addNotification(String title, String body) async {
    try {
      final userDoc = firestore.collection('users').doc(currentUserEmail);

      final Map<String, dynamic> notification = {
        'title': title,
        'body': body,
        'timestamp': DateTime.now().toIso8601String(),
      };

      await userDoc.update({
        'notifications': FieldValue.arrayUnion([notification]),
      });

      await fetchNotifications();
    } catch (e) {
      emit(NotificationError(e.toString()));
    }
  }

  Future<void> removeNotificationAtIndex(int index) async {
    try {
      emit(NotificationLoading());

      final userDoc = firestore.collection('users').doc(currentUserEmail);
      final snapshot = await userDoc.get();

      if (!snapshot.exists) {
        emit(NotificationError("User document does not exist"));
        return;
      }

      final data = snapshot.data();
      final List<dynamic> notifications = data?['notifications'] ?? [];

      if (index < 0 || index >= notifications.length) {
        emit(NotificationError("Invalid notification index"));
        return;
      }

      notifications.removeAt(index);

      await userDoc.update({'notifications': notifications});

      await fetchNotifications();
    } catch (e) {
      emit(NotificationError(e.toString()));
    }
  }


  String getTimeAgo(String timestampString) {
    final timestamp = DateTime.parse(timestampString);
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds}s ago';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inDays}d ago';
    }
  }

  Future<void> fetchNotifications() async {
    emit(NotificationLoading());
    try {
      final userDoc = await firestore.collection('users').doc(currentUserEmail).get();
      if (userDoc.exists) {
        final data = userDoc.data();
        final List<dynamic> rawList = data?['notifications'] ?? [];

        notifications = rawList.map<Map<String, String>>((e) {
          final map = Map<String, String>.from(e as Map);
          final timestamp = map['timestamp'] ?? '';
          final timeAgo = timestamp.isNotEmpty ? getTimeAgo(timestamp) : '';
          return {
            'title': map['title'] ?? '',
            'body': map['body'] ?? '',
            'timestamp': timestamp,
            'timeAgo': timeAgo,
          };
        }).toList();

        emit(NotificationLoaded(notifications));
      } else {
        notifications = [];
        emit(NotificationLoaded([]));
      }
    } catch (e) {
      emit(NotificationError(e.toString()));
    }
  }
}
