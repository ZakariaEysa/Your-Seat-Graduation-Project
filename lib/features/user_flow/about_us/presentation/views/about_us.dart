import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/about_us/presentation/widgets/row_of_social_items.dart';
import 'package:yourseatgraduationproject/generated/l10n.dart';
import 'package:yourseatgraduationproject/resources/app_styles_manager.dart';
import 'package:yourseatgraduationproject/resources/constants.dart';
import 'package:yourseatgraduationproject/widgets/scaffold/scaffold_f.dart';

import '../widgets/custom_bottom_sheet.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return ScaffoldF(
      title: lang.aboutUs,
      body: Container(
        alignment: Alignment.bottomCenter,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/${AppConstVariables.aboutUsImg}"),
          ),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomBottomSheet(
                scrollController: DraggableScrollableController(),
                title: "Terms and Conditions",
                content: lang.termsAndConditionsContent,
                initialHeight: .23,
                maxHeight: .97,
                minHeight: .23,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomBottomSheet(
                scrollController: DraggableScrollableController(),
                title: "Privacy Policy",
                content: lang.privacyPolicyContent,
                initialHeight: .16,
                maxHeight: .89,
                minHeight: .16,
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: CustomBottomSheet(
                scrollController: DraggableScrollableController(),
                title: "Contact Us",
                content: lang.contactUsContent,
                initialHeight: .08,
                maxHeight: .82,
                minHeight: .08,
                bottomWidget: const RowOfSocialItems(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
