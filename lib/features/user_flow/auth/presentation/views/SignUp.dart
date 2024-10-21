import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/views/sign_in.dart';
import 'package:yourseatgraduationproject/utils/navigation.dart';

import '../../../../../widgets/app_bar/appbar.dart';
import '../../../../../widgets/button/button_builder.dart';
import '../../../../../widgets/scaffold/scaffold_f.dart';
import '../../../../../widgets/text_field/text_field/text_form_field_builder.dart';
import '../widgets/BirthDateDropdown.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String? selectedMonth;
  int? selectedDay;
  int? selectedYear;

  final List<String> months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December'
  ];

  final List<int> days = List<int>.generate(31, (index) => index + 1);
  final List<int> years =
      List<int>.generate(80, (index) => DateTime.now().year - index);

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ScaffoldF(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BuilderAppBar(
              actions: [
                IconButton(
                    onPressed: () {
                      navigateTo(context: context, screen: SignIn());
                    },
                    icon: Icon(
                      Icons.arrow_back_outlined,
                      color: Colors.white,
                    ))
              ],
              title: 'Sign Up',
            ),
             Padding(
              padding: EdgeInsets.only(left: 20.w),
              child: Text(
                '\n\nPlease fill in the credentials',
                style: theme.textTheme.bodySmall!.copyWith(fontSize: 16),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.all(16.0.sp),
              child: TextFormFieldBuilder(
                controller: usernameController,
                type: TextInputType.text,
                obsecure: false,
                label: 'Username',
                imagePath: 'assets/images/Username.png',
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0.sp),
              child: TextFormFieldBuilder(
                controller: phoneController,
                label: 'Phone Number',
                obsecure: false,
                type: TextInputType.phone,
                imagePath: 'assets/images/Phone.png',
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0.sp),
              child: TextFormFieldBuilder(
                controller: passwordController,
                type: TextInputType.text,
                label: 'Password',
                //   obsecure: true,
                imagePath: 'assets/images/Password.png',
                suffixImagePath: 'assets/images/show.png',
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0.sp),
              child: TextFormFieldBuilder(
                controller: confirmPasswordController,
                label: 'Confirm Password',
                type: TextInputType.text,
                //obsecure: true,
                suffixImagePath: 'assets/images/hide.png',
              ),
            ),
            SizedBox(height: 35.h),
            Text('Birth Date :',  style: theme.textTheme.labelLarge!.copyWith(fontSize: 16),),
            SizedBox(height: 25.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BirthDateDropdown<String>(
                  hintText: 'Month',
                  selectedValue: selectedMonth,
                  itemsList: months,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedMonth = newValue;
                    });
                  },
                ),
                BirthDateDropdown<int>(
                  hintText: 'Day',
                  selectedValue: selectedDay,
                  itemsList: days,
                  onChanged: (int? newValue) {
                    setState(() {
                      selectedDay = newValue;
                    });
                  },
                ),
                BirthDateDropdown<int>(
                  hintText: 'Year',
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
            SizedBox(height: 25.h),
            Row(
              children: [
                SizedBox(width: 45.w),
                Container(
                  width: 28.w,
                  height: 28.h,
                  decoration: BoxDecoration(
                    color: Colors.purple,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check,
                    size: 20,
                    color: Colors.black,
                  ),
                ),
                SizedBox(width: 10.w),
                 Text(
                  'I agree with privacy policy',
                   style: theme.textTheme.bodySmall!.copyWith(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 30.h),
            ButtonBuilder(
              text: 'Sign Up',
              ontap: () {},
              width: 220.w,
              height: 55.h,
            ),
          ],
        ),
      ),
    );
  }
}
