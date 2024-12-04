import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yourseatgraduationproject/utils/navigation.dart';
import '../../../../../data/hive_keys.dart';
import '../../../../../data/hive_stroage.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../main.dart';

class LanguageSheet extends StatelessWidget {
  const LanguageSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var lang = S.of(context);

    final List<Map<String, String>> languagesList = [
      {"code": "ar", "name": lang.arabic},
      {"code": "en", "name": lang.english},
    ];

    String currentLang = HiveStorage.get(HiveKeys.isArabic) ? "ar" : "en";

    return SizedBox(
      height: 350.h,
      child: Padding(
        padding: EdgeInsets.all(20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              lang.language,style: theme.textTheme.labelLarge,),


            SizedBox(height: 16.h),
            ListView.builder(
              shrinkWrap: true,
              itemCount: languagesList.length,
              itemBuilder: (context, index) {
                String code = languagesList[index]['code']!;
                String name = languagesList[index]['name']!;
                return GestureDetector(
                  onTap: () {
                    HiveStorage.set(HiveKeys.isArabic, code == "ar");
                    MyApp.restartApp(context);
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
                    margin: EdgeInsets.only(bottom: 8.h),
                    decoration: BoxDecoration(
                     // color: currentLang == code ? theme.primaryColor: Colors.transparent,

                    color: theme.primaryColor,
                      borderRadius: BorderRadius.circular(10.r),
                      // border: Border.all(color: theme.primaryColor),
                      border: Border.all(color:  currentLang == code ?  Colors.white:theme.primaryColor,),


                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          name,
                        style: theme.textTheme.labelLarge?.copyWith(
                            // color: currentLang == code ? Colors.white : theme.primaryColor,
                                     color:Colors.white,

                        ),
                        ),
                        if (currentLang == code)
                          Icon(Icons.check_rounded, color: Colors.white, size: 20.sp),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
