import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/settings/presentation/widgets/profile_card/personal_info_card.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return ScaffoldF(
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: () {},
              child: const Icon(
                Icons.edit,
                size: 27,
                color: Colors.white,
              )),
          const SizedBox(
            width: 12,
          ),
        ],
        backgroundColor: const Color(0xFF2E1371),
        iconTheme: const IconThemeData(
          size: 28,
          color: Colors.white,
        ),
      ),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
          child: Container(
            //height: 700,
            margin: const EdgeInsets.only(top: 40),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(51),
                topRight: Radius.circular(48),
              ),
              color: Color(0xFF00002B),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 100.0, left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(height: 10),
                    const Text(
                      textAlign: TextAlign.center,
                      'Mohamed Ahmed',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      textAlign: TextAlign.center,
                      '@mohamed-ahmed21',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                        alignment: Alignment.center,
                        width: 150.w,
                        height: 38.h,
                        decoration: BoxDecoration(
                            color: const Color(0xFFD9D9D9).withOpacity(0.6),
                            borderRadius: BorderRadius.circular(15)),
                        child: Text(
                          "Personal Info",
                          textAlign: TextAlign.start,
                          style: theme.textTheme.titleLarge!
                              .copyWith(fontSize: 22),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const PersonalInfoCard(
                      title: "phone number",
                      icon: "assets/icons/telephone.png",
                      info: "010635199443",
                    ),
                    const SizedBox(height: 20),
                    const PersonalInfoCard(
                      title: "Date of Birth",
                      icon: "assets/icons/birthday_cake.png",
                      info: "21 May 2022",
                    ),
                    const SizedBox(height: 20),
                    const PersonalInfoCard(
                      title: "Gender",
                      icon: "assets/icons/gender.png",
                      info: "Male",
                    ),
                    const SizedBox(height: 20),
                    const PersonalInfoCard(
                      title: "Location",
                      icon: "assets/icons/location.png",
                      info: "Egypt , Sheikh Zayed",
                    ),
                    const SizedBox(height: 20),
                    const PersonalInfoCard(
                      title: "Email Address",
                      icon: "assets/icons/email.png",
                      info: "Mohamed555@gmail.com",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 105.w,
          // top: -3.h,

          child: const CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(
                  "assets/images/film1.png") // Replace with your image URL
              ),
        ),
      ]),
    );
  }
}
