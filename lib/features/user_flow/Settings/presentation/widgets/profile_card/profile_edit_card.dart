import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:yourseatgraduationproject/features/user_flow/Settings/presentation/widgets/profile_card/info_container.dart';
import 'package:yourseatgraduationproject/widgets/button/button_builder.dart';

import '../../../../../../data/hive_keys.dart';
import '../../../../../../data/hive_stroage.dart';
import '../../../../../../generated/l10n.dart';
import '../../../../../../utils/app_logs.dart';
import '../../../../../../utils/navigation.dart';
import '../../../../../../widgets/scaffold/scaffold_f.dart';
import '../../../../auth/data/model/user_model.dart';
import '../../../../auth/presentation/widgets/BirthDateDropdown.dart';

class ProfileEditCard extends StatefulWidget {
  const ProfileEditCard({super.key});

  @override
  State<ProfileEditCard> createState() => _ProfileEditCardState();
}

class _ProfileEditCardState extends State<ProfileEditCard> {
  final List<int> days = List<int>.generate(31, (index) => index + 1);
  final List<int> years = List<int>.generate(80, (index) => DateTime.now().year - index);
  final List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December",
  ];
  final List<String> gender = ["Male", "Female",""];

  TextEditingController emailController = TextEditingController();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController genderController = TextEditingController();

  String? selectedMonth;
  int? selectedDay;
  int? selectedYear;
  String? selectedGender;
  var currentUser;
  List<String> splitDate = [];
  String? selectedImageBase64;

  @override
  void initState() {
    super.initState();
    _loadCurrentUser();
  }

  void _loadCurrentUser() {
    if (HiveStorage.get(HiveKeys.role) == Role.google.toString()) {
      currentUser = HiveStorage.getGoogleUser();
    } else {
      currentUser = HiveStorage.getDefaultUser();
      AppLogs.scussessLog(currentUser.toString());
    }

    String date = currentUser.dateOfBirth;
    splitDate = date.split("/");

    try {
      selectedDay = days.contains(int.parse(splitDate[0])) ? int.parse(splitDate[0]) : null;
      selectedMonth = months.contains(splitDate[1]) ? splitDate[1] : null;
      selectedYear = years.contains(int.parse(splitDate[2])) ? int.parse(splitDate[2]) : null;

      AppLogs.scussessLog("Date parsed successfully");
    } catch (e) {
      AppLogs.errorLog("Date parsing failed: $e");
    }

    userController.text = currentUser.name;
    emailController.text = currentUser.emailController;
    selectedGender = gender.contains(currentUser.gender) ? currentUser.gender : null;
    selectedImageBase64 = currentUser.image;
  }

  Future<void> updateProfile() async {
    try {
      var userDoc = FirebaseFirestore.instance.collection('users').doc(currentUser.emailController);
      await userDoc.update({
        'name': userController.text,
        'dateOfBirth': '$selectedDay/$selectedMonth/$selectedYear',
        "image": selectedImageBase64 ?? "",
        "gender": selectedGender,
        "location": "",
      });

      HiveStorage.saveDefaultUser(UserModel(
        name: userController.text,
        email: emailController.text,
        password: passwordController.text,
        dateOfBirth: '$selectedDay/$selectedMonth/$selectedYear',
        gender: selectedGender,
        image: selectedImageBase64 ?? "",
      ));

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Data Updated Successfully")),
      );

      AppLogs.infoLog(HiveStorage.getDefaultUser().toString());
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Something Went Wrong")),
      );
    }
  }

  Future<void> _pickImage() async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        var lang = S.of(context);
        var theme = Theme.of(context);
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(
                leading: const Icon(Icons.photo_library, color: Colors.white),
                title: const Text('Gallery', style: TextStyle(color: Colors.white)),
                onTap: () async {
                  Navigator.of(context).pop();
                  final ImagePicker picker = ImagePicker();
                  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                  if (image != null) {
                    final bytes = await File(image.path).readAsBytes();
                    setState(() {
                      selectedImageBase64 = base64Encode(bytes);
                    });
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.camera_alt, color: Colors.white),
                title: const Text('Camera', style: TextStyle(color: Colors.white)),
                onTap: () async {
                  Navigator.of(context).pop();
                  final ImagePicker picker = ImagePicker();
                  final XFile? image = await picker.pickImage(source: ImageSource.camera);
                  if (image != null) {
                    final bytes = await File(image.path).readAsBytes();
                    setState(() {
                      selectedImageBase64 = base64Encode(bytes);
                    });
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    var theme = Theme.of(context);

    return ScaffoldF(
      appBar: AppBar(
        backgroundColor: const Color(0xFF2E1371),
        iconTheme: IconThemeData(
          size: 28.sp,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
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
                  child: Padding(
                    padding: EdgeInsets.only(top: 130.h, left: 10.w, right: 10.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        _buildLabel(theme, lang.username),
                        SizedBox(height: 15.h),
                        InfoContainer(
                          onChanged: (value) => userController.text = value,
                          controller: userController,
                          type: TextInputType.text,
                          title: "",
                        ),
                        SizedBox(height: 15.h),
                        _buildLabel(theme, lang.emailAddress),
                        SizedBox(height: 15.h),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 12.w),
                          padding: EdgeInsets.all(15.sp),
                          alignment: Alignment.centerLeft,
                          width: double.infinity,
                          height: 55.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(23.r),
                            color: theme.colorScheme.onSecondary,
                          ),
                          child: Text(emailController.text),
                        ),
                        SizedBox(height: 15.h),
                        _buildLabel(theme, lang.birthDate),
                        SizedBox(height: 15.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: _buildDropdown(lang.month, selectedMonth, months,
                                      (String? newValue) {
                                    setState(() {
                                      selectedMonth = newValue;
                                    });
                                  }),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: _buildDropdown(lang.day, selectedDay, days, (int? newValue) {
                                setState(() {
                                  selectedDay = newValue;
                                });
                              }),
                            ),
                            SizedBox(width: 10.w),
                            Expanded(
                              child: _buildDropdown(lang.year, selectedYear, years, (int? newValue) {
                                setState(() {
                                  selectedYear = newValue;
                                });
                              }),
                            ),
                          ],
                        ),
                        SizedBox(height: 15.h),
                        _buildLabel(theme, lang.gender),
                        SizedBox(height: 15.h),
                        _buildDropdown(lang.gender, selectedGender, gender, (String? newValue) {
                          setState(() {
                            selectedGender = newValue;
                          });
                        }),
                        SizedBox(height: 45.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildButton(
                              HiveStorage.get(HiveKeys.isArabic)
                                  ? "assets/images/cancel_arabic.png"
                                  : "assets/images/Cancel.png",
                                  () => navigatePop(context: context),
                            ),
                            _buildButton(
                              HiveStorage.get(HiveKeys.isArabic)
                                  ? "assets/images/save_changes_arabic.png"
                                  : "assets/images/Save Changes.png",
                              updateProfile,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 105.w,
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 80.r,
                      backgroundImage: selectedImageBase64 != null
                          ? MemoryImage(base64Decode(selectedImageBase64!))
                          : const AssetImage("assets/images/film1.png") as ImageProvider,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: _pickImage,
                        child: Container(
                          height: 30.h,
                          width: 30.w,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.camera_alt,
                            size: 20.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(ThemeData theme, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Text(
        text,
        style: theme.textTheme.labelLarge!.copyWith(fontSize: 16.sp),
      ),
    );
  }

  Widget _buildDropdown<T>(String hintText, T? selectedValue, List<T> items, ValueChanged<T?> onChanged) {
    return BirthDateDropdown<T>(
      hintText: hintText,
      selectedValue: selectedValue,
      itemsList: items,
      onChanged: onChanged,
    );
  }

  Widget _buildButton(String imagePath, VoidCallback onTap) {
    return ButtonBuilder(
      text: "",
      height: 49,
      width: 167,
      image: imagePath,
      onTap: onTap,
    );
  }
}
