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
    'January', 'February', 'March', 'April', 'May', 'June',
    'July', 'August', 'September', 'October', 'November', 'December'
  ];

  final List<int> days = List<int>.generate(31, (index) => index + 1);
  final List<int> years = List<int>.generate(80, (index) => DateTime.now().year - index);

  @override
  Widget build(BuildContext context) {
    return ScaffoldF(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            BuilderAppBar(
              actions: [
                IconButton(onPressed: (){
                  navigateTo(context: context, screen: SignIn());
                }, icon: Icon(Icons.arrow_back_outlined,color: Colors.white,))
              ],
              title: 'Sign Up',
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text(
                '\n\nPlease fill in the credentials',
                style: TextStyle(fontSize: 12),
              ),
            ),
            const SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormFieldBuilder(
                controller: TextEditingController(),
                type: TextInputType.text,
                obsecure: false,
                label: 'Username',
                imagePath: 'assets/images/Username.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormFieldBuilder(
                controller: TextEditingController(),
                label: 'Phone Number',
                obsecure: false,
                type: TextInputType.phone,
                imagePath: 'assets/images/Phone.png',
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormFieldBuilder(
                controller: TextEditingController(),
                type: TextInputType.text,
                label: 'Password',
                //   obsecure: true,
                imagePath: 'assets/images/Password.png',
                suffixImagePath: 'assets/images/show.png',
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormFieldBuilder(
                controller: TextEditingController(),
                label: 'Confirm Password',
                type: TextInputType.text,
                //obsecure: true,
                suffixImagePath: 'assets/images/hide.png',
              ),
            ),
            const SizedBox(height: 20),
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
            const SizedBox(height: 20),
            Row(
              children: [
                const SizedBox(width: 45),
                Container(
                  width: 28,
                  height: 28,
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
                const SizedBox(width: 10),
                const Text(
                  'I agree with privacy policy',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
            const SizedBox(height: 20),
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