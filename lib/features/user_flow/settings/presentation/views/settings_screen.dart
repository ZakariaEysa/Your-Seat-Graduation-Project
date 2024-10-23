import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/about_us/presentation/views/about_us.dart';
import 'package:yourseatgraduationproject/features/user_flow/settings/presentation/views/language_sheet.dart';
import 'package:yourseatgraduationproject/features/user_flow/settings/presentation/views/profile_card.dart';
import 'package:yourseatgraduationproject/features/user_flow/settings/presentation/views/theme_sheet.dart';
import 'package:yourseatgraduationproject/features/user_flow/settings/presentation/widgets/settings_item/settings_item.dart';
import 'package:yourseatgraduationproject/utils/navigation.dart';

import '../../../../../widgets/scaffold/scaffold_f.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaffoldF(
      title: "Settings",
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SettingsItem(
            title: "Profile",
            imageIcon: "assets/images/account.png",
            onPress: () {
              navigateTo(context: context, screen: const ProfileCard());
            },
          ),
          SettingsItem(
              title: "Language",
              imageIcon: "assets/images/language.png",
              onPress: () {
                showLanguageBottomSheet(context);
              }),
          SettingsItem(
              title: "Theme",
              imageIcon: "assets/images/theme.png",
              onPress: () {
                showThemeBottomSheet(context);
              }),
          SettingsItem(
              title: "About Us",
              imageIcon: "assets/images/account.png",
              onPress: () {
                navigateTo(context: context, screen: const AboutUs());
              }),
          SettingsItem(
              title: "LogOut",
              imageIcon: "assets/images/logout 1.png",
              onPress: () {})
        ],
      )),
    );
  }

  void showThemeBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context, builder: (context) => const ThemeSheet());
  }

  void showLanguageBottomSheet(context) {
    showModalBottomSheet(
        context: context, builder: (context) => const LanguageSheet());
  }
}
