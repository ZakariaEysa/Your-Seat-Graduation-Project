import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/data/hive_keys.dart';
import 'package:yourseatgraduationproject/features/user_flow/Settings/presentation/widgets/profile_card/profile_edit_card.dart';
import 'package:yourseatgraduationproject/features/user_flow/settings/presentation/widgets/profile_card/personal_info_card.dart';
import 'package:yourseatgraduationproject/utils/app_logs.dart';
import 'package:yourseatgraduationproject/utils/navigation.dart';
import '../../../../../data/hive_stroage.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';

class ProfileCard extends StatefulWidget {
  const ProfileCard({super.key});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  var currentUser;


  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    if (HiveStorage.get(HiveKeys.role) == Role.google.toString()) {
      currentUser = HiveStorage.getGoogleUser();
      setState(() {

      });
    } else {
      currentUser = HiveStorage.getDefaultUser();
      setState(() {

      });
      AppLogs.scussessLog(currentUser.toString());
    }
    var lang = S.of(context);
    return ScaffoldF(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              navigateTo(context: context, screen: const ProfileEditCard());
            },
            child: Icon(
              Icons.edit,
              size: 27.sp,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 12.w,
          ),
        ],
        backgroundColor: const Color(0xFF2E1371),
        iconTheme: IconThemeData(
          size: 28.sp,
          color: Colors.white,
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.w),
            child: Container(
              margin: EdgeInsets.only(top: 40.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(51.r),
                  topRight: Radius.circular(48.r),
                ),
                color: const Color(0xFF00002B),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 100.h, left: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 10.h),
                      Text(
                        textAlign: TextAlign.center,
                        currentUser?.name ?? "-",
                        style: TextStyle(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Container(
                          alignment: Alignment.center,
                          width: 150.w,
                          height: 38.h,
                          decoration: BoxDecoration(
                            color: const Color(0xFFD9D9D9).withOpacity(0.6),
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Text(
                            lang.personalInfo,
                            textAlign: TextAlign.start,
                            style: theme.textTheme.titleLarge!
                                .copyWith(fontSize: 18.sp),
                          ),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      PersonalInfoCard(
                        title: lang.email,
                        icon: "assets/images/email 2.png",
                        info: currentUser?.email ?? "-",
                      ),
                      SizedBox(height: 20.h),
                      PersonalInfoCard(
                        title: lang.birthDate,
                        icon: "assets/icons/birthday_cake.png",
                        info: currentUser?.dateOfBirth ?? "-",
                      ),
                      SizedBox(height: 20.h),
                      PersonalInfoCard(
                        title: lang.gender,
                        icon: "assets/icons/gender.png",
                        info: currentUser?.gender ?? "-",
                      ),
                      SizedBox(height: 20.h),
                      PersonalInfoCard(
                        title: lang.location,
                        icon: "assets/icons/location.png",
                        info: currentUser?.location ?? "-",
                      ),
                      SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 105.w,
            child: CircleAvatar(
              radius: 80.r,
              backgroundImage: currentUser?.image != null && currentUser.image.isNotEmpty
                  ? MemoryImage(base64Decode(currentUser.image))
                  : const AssetImage("assets/images/film1.png") as ImageProvider,
            ),
          ),
        ],
      ),
    );
  }
}
