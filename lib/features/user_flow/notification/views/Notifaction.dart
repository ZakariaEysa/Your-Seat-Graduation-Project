import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:yourseatgraduationproject/widgets/loading_indicator.dart';
import '../../../../data/hive_keys.dart';
import '../../../../data/hive_storage.dart';
import '../../../../generated/l10n.dart';
import '../../../../widgets/app_bar/head_appbar.dart';
import '../../../../widgets/scaffold/scaffold_f.dart';
import '../notification_cubit/notification_cubit.dart';
import '../notification_cubit/notification_state.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  late NotificationCubit notificationCubit;

  @override
  void initState() {
    super.initState();
    notificationCubit = NotificationCubit();
    notificationCubit.fetchNotifications();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var lang = S.of(context);

    return ScaffoldF(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.onPrimary,
          size: 28.sp,
        ),
        title: HeadAppBar(
          title: lang.notifications,
        ),
      ),
      body: BlocBuilder<NotificationCubit, NotificationState>(
        bloc: notificationCubit,
        builder: (context, state) {
          if (state is NotificationLoading) {
            return const LoadingIndicator();
          } else if (state is NotificationError) {
            return Center(child: Text('Error: ${state.message}'));
          } else if (state is NotificationLoaded) {
            final notifications = state.notifications;

            if (notifications.isEmpty) {
              return Center(
                child: Text(
                  lang.noNotificationsYet,
                  style: theme.textTheme.bodyLarge?.copyWith(fontSize: 18.sp),
                ),
              );
            }

            return ListView.builder(
              padding: const EdgeInsets.only(top: 50, left: 10, right: 15),
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                final bool isArb = HiveStorage.get(HiveKeys.isArabic) ?? false;
                final notification = notifications[index];
                final title = isArb
                    ? notification['title_arb'] ?? 'No Title'
                    : notification['title'] ?? 'No Title';
                final body = isArb
                    ? notification['body_arb'] ?? 'No Body'
                    : notification['body'] ?? 'No Body';
                final time = notification['timeAgo'] ?? 'No time';

                return NotificationCard(
                  time: time,
                  title: title,
                  body: body,
                  index: index,
                  onDelete: (i) async {
                    print("تم حذف الإشعار رقم $i");
                    await notificationCubit
                        .removeNotificationAtIndex(i); // أو أي دالة حذف
                  },
                );
              },
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String title;
  final String body;
  final String time;
  final int index;
  final void Function(int index)? onDelete;

  const NotificationCard({
    super.key,
    required this.time,
    required this.title,
    required this.body,
    required this.index,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Slidable(
          startActionPane: ActionPane(
            extentRatio: 0.40,
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  if (onDelete != null) {
                    onDelete!(index);
                  }
                },
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                icon: Icons.delete,
                label: 'Delete',
              ),
            ],
          ),
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              color: Color(0xFF877AA7),
              borderRadius: BorderRadius.all(Radius.circular(18)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Left side: title & body
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        body,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
                  ),
                ),
                // Right side: time
                Text(
                  time,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
