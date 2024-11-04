import 'package:animate_do/animate_do.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:yourseatgraduationproject/data/hive_stroage.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/data/remote_data_source/remote_data_source/auth_remote_data_source.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/domain/repos_impl/auth_repo_impl.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/cubit/auth_cubit.dart';
import 'package:yourseatgraduationproject/features/user_flow/auth/presentation/views/sign_in.dart';
import 'package:yourseatgraduationproject/utils/navigation.dart';
import '../../../data/hive_keys.dart';
import '../../../widgets/button/button_builder.dart';
import '../../../widgets/scaffold/scaffold_f.dart';
import 'content.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ScaffoldF(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 30,top:10),

              child: SizedBox(
                height: 130.h,
                width: 250.w,
                child: Image.asset('assets/images/yourseat.png', fit: BoxFit.cover),
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemBuilder: (_, index) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.all(30.sp),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          contents[index].image,
                          height: 300.h,
                        ),
                        SizedBox(height: 15.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(contents.length, (dotIndex) {
                            return buildDot(dotIndex);
                          }),
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          contents[index].title,
                          style: theme.textTheme.labelLarge!
                              .copyWith(fontSize: 35.sp),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 15.h),
                        Text(
                          contents[index].description,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyMedium!
                              .copyWith(fontSize: 16.sp),
                        ),
                        SizedBox(height: 40.h),
                        currentPage == contents.length - 1
                            ? ButtonBuilder(
                                text: 'Start Using the App->',
                                ontap: () {
                                  // Navigate to the SignIn screen
                                  HiveStorage.set(
                                    HiveKeys.passUserOnboarding,
                                    true,
                                  );

                                  navigateAndRemoveUntil(
                                    context: context,
                                    screen: BlocProvider(
                                      create: (context) => AuthCubit(
                                          AuthRepoImpl(AuthRemoteDataSourceImpl(
                                              FirebaseAuth.instance,
                                              GoogleSignIn()))),
                                      child: SignIn(),
                                    ),
                                  );
                                },
                                width: 300.w,
                                height: 55.h,
                              )
                            : Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: ButtonBuilder(
                                      text: 'Skip',
                                      ontap: () {
                                        HiveStorage.set(
                                          HiveKeys.passUserOnboarding,
                                          true,
                                        );

                                        navigateAndRemoveUntil(
                                          context: context,
                                          screen: BlocProvider(
                                            create: (context) => AuthCubit(
                                                AuthRepoImpl(
                                                    AuthRemoteDataSourceImpl(
                                                        FirebaseAuth.instance,
                                                        GoogleSignIn()))),
                                            child: SignIn(),
                                          ),
                                        );
                                      },
                                      height: 55.h,
                                    ),
                                  ),
                                  SizedBox(width: 20.w),
                                  Expanded(
                                    child: ButtonBuilder(
                                      text: 'Next',
                                      ontap: () {
                                        if (currentPage < contents.length - 1) {
                                          _pageController.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.easeInOut,
                                          );
                                        }
                                      },
                                      height: 55.h,
                                    ),
                                  ),
                                ],
                              ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return Container(
      height: 10.h,
      width: currentPage == index ? 20.w : 10.w,
      margin: EdgeInsets.only(right: 5.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.sp),
        color: currentPage == index ? Colors.deepPurple : Colors.white,
      ),
    );
  }
}
