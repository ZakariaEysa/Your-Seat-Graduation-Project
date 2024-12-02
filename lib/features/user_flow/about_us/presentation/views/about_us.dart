import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/about_us/presentation/widgets/row_of_social_items.dart';
import 'package:yourseatgraduationproject/generated/l10n.dart';
import 'package:yourseatgraduationproject/resources/constants.dart';
import 'package:yourseatgraduationproject/widgets/app_bar/head_appbar.dart';
import 'package:yourseatgraduationproject/widgets/scaffold/scaffold_f.dart';

import '../widgets/custom_bottom_sheet.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);

    return ScaffoldF(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E1371),
        iconTheme: IconThemeData(
          size: 28.sp, // ضبط حجم الأيقونة باستخدام ScreenUtil
          color: Colors.white,
        ),
        title: Padding(
          padding: EdgeInsets.only(
            bottom: 10.h, // ضبط الحافة السفلية باستخدام ScreenUtil
            right: 35.w, // ضبط الحافة اليمنى باستخدام ScreenUtil
          ),
          child: const HeadAppBar(
            title: 'About Us',
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 65.h), // ضبط المسافة العلوية باستخدام ScreenUtil
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            alignment: Alignment.topCenter,
            image: AssetImage("assets/images/${AppConstVariables.aboutUsImg}"),
          ),
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomBottomSheet(
                scrollController: DraggableScrollableController(),
                title: "Terms and Conditions",
                content: lang.termsAndConditionsContent,
                initialHeight: .28,
                maxHeight: .98,
                minHeight: .28,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomBottomSheet(
                scrollController: DraggableScrollableController(),
                title: "Privacy Policy",
                content: lang.privacyPolicyContent,
                initialHeight: .185,
                maxHeight: .89,
                minHeight: .185,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomBottomSheet(
                scrollController: DraggableScrollableController(),
                title: "Contact Us",
                content: lang.contactUsContent,
                initialHeight: .1,
                maxHeight: .82,
                minHeight: .1,
                bottomWidget: const RowOfSocialItems(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
