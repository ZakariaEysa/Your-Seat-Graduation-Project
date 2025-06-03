import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../data/hive_keys.dart';
import '../../../../../data/hive_storage.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../utils/dialog_utilits.dart';
import '../../../auth/presentation/views/sign_in.dart';
import '../../../notification/notification_cubit/notification_cubit.dart';
import '../../../notification/notification_cubit/notification_state.dart';
import '../../../notification/views/Notifaction.dart';
import '../../../../../utils/navigation.dart';

class HeadWidget extends StatelessWidget {
  const HeadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return SizedBox(
      height: 120.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/yourseat.png",
            width: 190.w,
            height: 120.h,
          ),
          BlocBuilder<NotificationCubit, NotificationState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () {
                  if (HiveStorage.get(HiveKeys.role) == Role.guest.toString()) {
                    DialogUtils.showMessage(
                        context, "You Have To Sign In To Continue",
                        isCancelable: false,
                        posActionTitle: lang.sign_in,
                        negActionTitle: lang.cancel, posAction: () {
                      HiveStorage.set(HiveKeys.role, "");

                      navigateAndRemoveUntil(
                        context: context,
                        screen: const SignIn(),
                      );
                    }, negAction: () {
                      navigatePop(context: context);
                    });
                  } else {
                    navigateTo(context: context, screen: Notifications());
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset(
                    NotificationCubit.get(context).notifications.isEmpty
                        ? "assets/icons/no_notification_icon.png"
                        : "assets/icons/notification_icon.png",

                    width: 36.w,
                    height: 115.h,
                    // color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
