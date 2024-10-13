import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yourseatgraduationproject/resources/constants.dart';
import 'package:yourseatgraduationproject/widgets/scaffold/scaffold_f.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldF(
      title: "About us",
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.bottomCenter,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/${AppConstVariables.aboutUs}"),
          )),
          child: Stack(
            alignment: Alignment.bottomCenter,
            // mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                height: 80.h,
              ),
              // CustomBottomSheet(
              //   scrollController: ScrollController(),
              //   title: "About Us",
              //   content: AppConstVariables.aboutUsContent,
              //   initialHeight: .5,
              // ),
              CustomBottomSheet(
                scrollController: ScrollController(),
                title: "About Us",
                content: AppConstVariables.aboutUsContent,
                initialHeight: .4,
              ),
              // CustomBottomSheet(
              //   scrollController: ScrollController(),
              //   title: "About Us",
              //   content: AppConstVariables.aboutUsContent,
              //     initialHeight: .5,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomBottomSheet extends StatelessWidget {
  final double initialHeight; // الارتفاع المبدئي للـ Bottom Sheet
  final ScrollController scrollController;
  final String content; // المحتوى كنص
  final Widget? bottomWidget; // أداة اختيارية في الأسفل
  final String title; // العنوان للـ Bottom Sheet

  const CustomBottomSheet({
    Key? key,
    required this.initialHeight, // الارتفاع المبدئي
    required this.scrollController,
    required this.content,
    this.bottomWidget,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: initialHeight, // الارتفاع المبدئي
      minChildSize: 0.3, // الحد الأدنى للارتفاع
      maxChildSize: 1.0, // الحد الأقصى للارتفاع
      builder: (BuildContext context, ScrollController innerScrollController) {
        return Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 91, 76, 145),
            borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
          ),
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              // العنوان في الأعلى
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10), // مسافة بين العنوان والمحتوى
              Expanded(
                child: SingleChildScrollView(
                  controller: innerScrollController,
                  child: Text(
                    content, // عرض المحتوى
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
              if (bottomWidget != null) // عرض الأداة الاختيارية إذا كانت موجودة
                Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.only(top: 20.0), // مسافة اختيارية
                  child: bottomWidget,
                ),
            ],
          ),
        );
      },
    );
  }
}
