import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/Settings/presentation/widgets/profile_card/info_container.dart';
import 'package:yourseatgraduationproject/widgets/button/button_builder.dart';

import '../../../../../../data/hive_keys.dart';
import '../../../../../../data/hive_stroage.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../utils/app_logs.dart';
import '../../../../../../utils/navigation.dart';
import '../../../../../../widgets/scaffold/scaffold_f.dart';
import '../../../../auth/presentation/widgets/BirthDateDropdown.dart';

class ProfileEditCard extends StatefulWidget {
   ProfileEditCard({super.key});


  @override
  State<ProfileEditCard> createState() => _ProfileEditCardState();
}

class _ProfileEditCardState extends State<ProfileEditCard> {
  final List<int> days = List<int>.generate(31, (index) => index + 1);

  TextEditingController emailController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final List<int> years =
  List<int>.generate(80, (index) => DateTime.now().year - index);
  String? selectedMonth;
  int? selectedDay;
  int? selectedYear;


  @override
  Widget build(BuildContext context) {

    var currentUser;
    if (HiveStorage.get(HiveKeys.role) == Role.gmail.toString()) {
      currentUser = HiveStorage.getGoogleUser();
    } else {
      currentUser = HiveStorage.getDefaultUser();
      AppLogs.scussessLog(currentUser.toString());
    }
   //var cubit = EditProfileCubit.get(context);
    var lang = S.of(context);
    var theme = Theme.of(context);
    final List<String> months = [
      lang.january,
      lang.february,
      lang.march,
      lang.april,
      lang.may,
      lang.june,
      lang.july,
      lang.august,
      lang.september,
      lang.october,
      lang.november,
      lang.december
    ];

    return  ScaffoldF(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E1371),
        iconTheme:  IconThemeData(
          size: 28.sp,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(children: [
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.w),
            child: Container(
              margin:  EdgeInsets.only(top: 40.h),
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(51.r),
                  topRight: Radius.circular(48.r),
                ),
                color: const Color(0xFF00002B),
              ),
              child: Center(
                child: Padding(
                  padding:  EdgeInsets.only(top: 130.h, left: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 12.0),
                           child: Text(lang.username,style: theme.textTheme.labelLarge!.copyWith(fontSize: 16.sp),),
                         ),
                         InfoContainer(
                           controller: userController,
                             type: TextInputType.text,
                             title: "Mohamed Ahmed"),
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 12.0),                         child: Text(lang.emailAddress,style: theme.textTheme.labelLarge!.copyWith(fontSize: 16.sp),),
                         ),
                          InfoContainer(
                             controller: emailController,
                             type: TextInputType.emailAddress,
                             title: "MohamedAhmed555@gmail.com"),
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 12.0),                         child: Text(lang.password,style: theme.textTheme.labelLarge!.copyWith(fontSize: 16.sp),),
                         ),
                          InfoContainer(
                             controller: passwordController,
                             type: TextInputType.visiblePassword,
                             title: currentUser?.name ?? "-"),
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 12.0),                         child: Text(lang.birthDate,style: theme.textTheme.labelLarge!.copyWith(fontSize: 16.sp),),
                         ),
                         Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Text(selectedMonth? "":""),
                          BirthDateDropdown<String>(
        
                            hintText: lang.month,
                            selectedValue: selectedMonth,
                            itemsList: months,
                            onChanged: (String? newValue) {
                              setState(() {
                                selectedMonth = newValue;
                              });
                            },
                          ),
                          BirthDateDropdown<int>(
                            hintText: lang.day,
                            selectedValue: selectedDay,
                            itemsList: days,
                            onChanged:
                                (int? newValue) {
                              setState(() {
                                selectedDay = newValue;
                              });
                            },
                          ),
                          BirthDateDropdown<int>(
                            hintText: lang.year,
                            selectedValue: selectedYear,
                            itemsList: years,
                            onChanged: (int? newValue) {
                              setState(() {
                                selectedYear = newValue;
                              });
                            },
                          ),
                        ],
                      ),
                         SizedBox(height: 15.h,),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                           children: [
                             ButtonBuilder(text: "",
                                 height: 49,
                                 width: 167,
                                 image: HiveStorage.get(HiveKeys.isArabic)?"assets/images/cancel_arabic.png":"assets/images/Cancel.png",
                                 onTap: (){
                               navigatePop(context: context);                               }),
                             ButtonBuilder(text: "",
                                 height: 49,
                                 width: 167,
                                 image:HiveStorage.get(HiveKeys.isArabic)?"assets/images/save_changes_arabic.png": "assets/images/Save Changes.png",
                                 onTap: (){})
                           ],
                         ),
                      ]
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 105.w,
            child:  CircleAvatar(
                radius: 80.r,
                backgroundImage: const AssetImage(
                    "assets/images/film1.png") // Replace with your image URL
            ),
          ),
        ]),
      ),
    );
  }
}
