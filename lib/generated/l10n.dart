// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `zakaria`
  String get zakaria {
    return Intl.message(
      'zakaria',
      name: 'zakaria',
      desc: '',
      args: [],
    );
  }

  /// `Hello`
  String get hello {
    return Intl.message(
      'Hello',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get signin {
    return Intl.message(
      'Sign In',
      name: 'signin',
      desc: '',
      args: [],
    );
  }

  /// `At YourSeat, we are committed to protecting your privacy. This privacy policy explains how we collect, use, and safeguard your personal data when you use the YourSeat mobile application. By using the app, you agree to the collection and use of your information in accordance with this policy.\n\n1. How We Use Your Information: The information we collect from you is used for the following purposes:\n   To provide and maintain the app: Ensuring the app functions properly and improving its performance.\n   To process transactions: Managing payments for movie tickets and related services.\n   To offer personalized recommendations: Suggesting movies and cinemas based on your preferences and location.\n   To communicate with you: Sending notifications about your bookings, promotions, or updates to our services.\n   To improve our services: Analyzing app usage data to enhance features and resolve issues.\n\n2. How We Protect Your Data: YourSeat employs standard security measures to protect your personal information, including:\n   Encryption: Securing your payment data and personal information using encryption protocols like SSL.\n   Access restrictions: Ensuring only authorized personnel can access your personal data.\n   Continuous audits: Regularly reviewing our security practices to ensure your data’s safety.\n   While we take all precautions, no security measures are completely foolproof, and we cannot guarantee the absolute security of your data.\n\n3. Data Sharing and Disclosure: YourSeat does not sell or share your personal information with third parties, except:\n   Service Providers: We work with trusted third-party partners (e.g., payment processors, cloud storage providers) to help deliver our services.\n   Legal Obligations: We may disclose your information if required by law or in response to a valid legal request (e.g., a court order).\n\n4. Your Rights: You have the following rights regarding your personal data:\n   Access: You can request a copy of the personal data we hold about you.\n   Correction: You can request corrections or updates to your data.\n   Deletion: You can request deletion of your data, subject to legal requirements.\n   Opt-out of marketing: You can opt-out of promotional communications by following the unsubscribe link in our emails or adjusting app settings.`
  String get privacyPolicyContent {
    return Intl.message(
      'At YourSeat, we are committed to protecting your privacy. This privacy policy explains how we collect, use, and safeguard your personal data when you use the YourSeat mobile application. By using the app, you agree to the collection and use of your information in accordance with this policy.\n\n1. How We Use Your Information: The information we collect from you is used for the following purposes:\n   To provide and maintain the app: Ensuring the app functions properly and improving its performance.\n   To process transactions: Managing payments for movie tickets and related services.\n   To offer personalized recommendations: Suggesting movies and cinemas based on your preferences and location.\n   To communicate with you: Sending notifications about your bookings, promotions, or updates to our services.\n   To improve our services: Analyzing app usage data to enhance features and resolve issues.\n\n2. How We Protect Your Data: YourSeat employs standard security measures to protect your personal information, including:\n   Encryption: Securing your payment data and personal information using encryption protocols like SSL.\n   Access restrictions: Ensuring only authorized personnel can access your personal data.\n   Continuous audits: Regularly reviewing our security practices to ensure your data’s safety.\n   While we take all precautions, no security measures are completely foolproof, and we cannot guarantee the absolute security of your data.\n\n3. Data Sharing and Disclosure: YourSeat does not sell or share your personal information with third parties, except:\n   Service Providers: We work with trusted third-party partners (e.g., payment processors, cloud storage providers) to help deliver our services.\n   Legal Obligations: We may disclose your information if required by law or in response to a valid legal request (e.g., a court order).\n\n4. Your Rights: You have the following rights regarding your personal data:\n   Access: You can request a copy of the personal data we hold about you.\n   Correction: You can request corrections or updates to your data.\n   Deletion: You can request deletion of your data, subject to legal requirements.\n   Opt-out of marketing: You can opt-out of promotional communications by following the unsubscribe link in our emails or adjusting app settings.',
      name: 'privacyPolicyContent',
      desc: '',
      args: [],
    );
  }

  /// `1. User Responsibilities: By using this app, you agree to comply with our terms of service and act respectfully. Please refrain from any behavior that disrupts the movie-watching experience for others, such as loud talking, using your phone, or purchasing tickets for unauthorized use. We reserve the right to revoke access to the app if these terms are violated.\n\n2. Creating a User Account: To create an account, you’ll need to provide a valid email address and a strong password. Choose a password that’s hard to guess and avoid using easily identifiable information. Your account data is stored securely and is accessible only to authorized personnel. Security: Choose a strong password combining letters, numbers, and symbols. Avoid using the same password for multiple accounts. Enable two-factor authentication (if available) for added security. Do not share your login information with anyone.\n\n3. Transaction Processing: All transactions are processed securely using [specify payment gateway]. We accept [list accepted payment methods, such as credit cards, debit cards, PayPal]. Additional Information: Ensure your payment information is accurate and up-to-date. We reserve the right to cancel orders in cases of fraudulent activity or incorrect payment information. For any questions or concerns regarding payments, please contact our customer support team.\n\n4. Content Ownership: All content within the app, including images, text, videos, and other materials, is owned by [Your Seat] or its licensors. Unless otherwise indicated, you are not permitted to use, reproduce, modify, distribute, or display any content from the app without prior written permission.`
  String get termsAndConditionsContent {
    return Intl.message(
      '1. User Responsibilities: By using this app, you agree to comply with our terms of service and act respectfully. Please refrain from any behavior that disrupts the movie-watching experience for others, such as loud talking, using your phone, or purchasing tickets for unauthorized use. We reserve the right to revoke access to the app if these terms are violated.\n\n2. Creating a User Account: To create an account, you’ll need to provide a valid email address and a strong password. Choose a password that’s hard to guess and avoid using easily identifiable information. Your account data is stored securely and is accessible only to authorized personnel. Security: Choose a strong password combining letters, numbers, and symbols. Avoid using the same password for multiple accounts. Enable two-factor authentication (if available) for added security. Do not share your login information with anyone.\n\n3. Transaction Processing: All transactions are processed securely using [specify payment gateway]. We accept [list accepted payment methods, such as credit cards, debit cards, PayPal]. Additional Information: Ensure your payment information is accurate and up-to-date. We reserve the right to cancel orders in cases of fraudulent activity or incorrect payment information. For any questions or concerns regarding payments, please contact our customer support team.\n\n4. Content Ownership: All content within the app, including images, text, videos, and other materials, is owned by [Your Seat] or its licensors. Unless otherwise indicated, you are not permitted to use, reproduce, modify, distribute, or display any content from the app without prior written permission.',
      name: 'termsAndConditionsContent',
      desc: '',
      args: [],
    );
  }

  /// `We would love to hear from you! Whether you have inquiries, need support, want to share feedback, or simply have suggestions, our team is here to help. Please do not hesitate to reach out to us using the form below or through the contact details provided.\nContact Information:\nCustomer Support Email: [support@yourseatapp.com]\nPhone Number: [+123-456-7890]\n\nFeedback and Suggestions:\nWe greatly value your input! If you have any suggestions on how to improve your experience with YourSeat, please share them in the message field of the contact form or send them directly to our email.\n\nConnect with us on our social media channels for the latest updates, promotions, and more:`
  String get contactUsContent {
    return Intl.message(
      'We would love to hear from you! Whether you have inquiries, need support, want to share feedback, or simply have suggestions, our team is here to help. Please do not hesitate to reach out to us using the form below or through the contact details provided.\nContact Information:\nCustomer Support Email: [support@yourseatapp.com]\nPhone Number: [+123-456-7890]\n\nFeedback and Suggestions:\nWe greatly value your input! If you have any suggestions on how to improve your experience with YourSeat, please share them in the message field of the contact form or send them directly to our email.\n\nConnect with us on our social media channels for the latest updates, promotions, and more:',
      name: 'contactUsContent',
      desc: '',
      args: [],
    );
  }

  /// `contact Us`
  String get contactUs {
    return Intl.message(
      'contact Us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in the credentials.`
  String get pleaseFillTheCredentials {
    return Intl.message(
      'Please fill in the credentials.',
      name: 'pleaseFillTheCredentials',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Facebook`
  String get continueWithFacebook {
    return Intl.message(
      'Continue with Facebook',
      name: 'continueWithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Google`
  String get continueWithGoogle {
    return Intl.message(
      'Continue with Google',
      name: 'continueWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Continue as Guest`
  String get continueAsGuest {
    return Intl.message(
      'Continue as Guest',
      name: 'continueAsGuest',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account yet?`
  String get dontHaveAnyAccountYet {
    return Intl.message(
      'Don’t have an account yet?',
      name: 'dontHaveAnyAccountYet',
      desc: '',
      args: [],
    );
  }

  /// `Confirm OTP Code`
  String get confirmOtpCode {
    return Intl.message(
      'Confirm OTP Code',
      name: 'confirmOtpCode',
      desc: '',
      args: [],
    );
  }

  /// `You just need to enter the OTP sent to the registered phone number.`
  String get youJustNeedToEnterTheOtpSentToTheRegisteredPhoneNumber {
    return Intl.message(
      'You just need to enter the OTP sent to the registered phone number.',
      name: 'youJustNeedToEnterTheOtpSentToTheRegisteredPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continuee {
    return Intl.message(
      'Continue',
      name: 'continuee',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get confirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Birth Date`
  String get birthDate {
    return Intl.message(
      'Birth Date',
      name: 'birthDate',
      desc: '',
      args: [],
    );
  }

  /// `Month`
  String get month {
    return Intl.message(
      'Month',
      name: 'month',
      desc: '',
      args: [],
    );
  }

  /// `Day`
  String get day {
    return Intl.message(
      'Day',
      name: 'day',
      desc: '',
      args: [],
    );
  }

  /// `Year`
  String get year {
    return Intl.message(
      'Year',
      name: 'year',
      desc: '',
      args: [],
    );
  }

  /// `I agree with the`
  String get iAgreeWith {
    return Intl.message(
      'I agree with the',
      name: 'iAgreeWith',
      desc: '',
      args: [],
    );
  }

  /// `PrivacyPolicy`
  String get privacyPolicy {
    return Intl.message(
      'PrivacyPolicy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get signUp {
    return Intl.message(
      'Sign Up',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Now Playing`
  String get nowPlaying {
    return Intl.message(
      'Now Playing',
      name: 'nowPlaying',
      desc: '',
      args: [],
    );
  }

  /// `Coming Soon`
  String get comingSoon {
    return Intl.message(
      'Coming Soon',
      name: 'comingSoon',
      desc: '',
      args: [],
    );
  }

  /// `Promotions & Discounts`
  String get promoDiscount {
    return Intl.message(
      'Promotions & Discounts',
      name: 'promoDiscount',
      desc: '',
      args: [],
    );
  }

  /// `Cinema`
  String get cinema {
    return Intl.message(
      'Cinema',
      name: 'cinema',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Please fill all fields`
  String get fill_all_fields {
    return Intl.message(
      'Please fill all fields',
      name: 'fill_all_fields',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number`
  String get please_enter_phone_number {
    return Intl.message(
      'Please enter your phone number',
      name: 'please_enter_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Wrong phone format`
  String get wrong_phone_format {
    return Intl.message(
      'Wrong phone format',
      name: 'wrong_phone_format',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get please_enter_password {
    return Intl.message(
      'Please enter your password',
      name: 'please_enter_password',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 8 characters long, contain at least one uppercase letter, one number, and one special character.`
  String get password_requirements {
    return Intl.message(
      'Password must be at least 8 characters long, contain at least one uppercase letter, one number, and one special character.',
      name: 'password_requirements',
      desc: '',
      args: [],
    );
  }

  /// `Password must be at least 6 characters.`
  String get password_min_length {
    return Intl.message(
      'Password must be at least 6 characters.',
      name: 'password_min_length',
      desc: '',
      args: [],
    );
  }

  /// `Password is wrong`
  String get wrong_password {
    return Intl.message(
      'Password is wrong',
      name: 'wrong_password',
      desc: '',
      args: [],
    );
  }

  /// `Phone number does not exist`
  String get phone_does_not_exist {
    return Intl.message(
      'Phone number does not exist',
      name: 'phone_does_not_exist',
      desc: '',
      args: [],
    );
  }

  /// `Failed to log in with Facebook`
  String get facebook_login_failed {
    return Intl.message(
      'Failed to log in with Facebook',
      name: 'facebook_login_failed',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred during login`
  String get login_error {
    return Intl.message(
      'An error occurred during login',
      name: 'login_error',
      desc: '',
      args: [],
    );
  }

  /// `Login successful`
  String get login_successful {
    return Intl.message(
      'Login successful',
      name: 'login_successful',
      desc: '',
      args: [],
    );
  }

  /// `An error occurred during login`
  String get error_during_login {
    return Intl.message(
      'An error occurred during login',
      name: 'error_during_login',
      desc: '',
      args: [],
    );
  }

  /// `Registration successful!`
  String get registerSuccess {
    return Intl.message(
      'Registration successful!',
      name: 'registerSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Error saving user data.`
  String get errorSavingUser {
    return Intl.message(
      'Error saving user data.',
      name: 'errorSavingUser',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? Sign In`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account? Sign In',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `January`
  String get january {
    return Intl.message(
      'January',
      name: 'january',
      desc: '',
      args: [],
    );
  }

  /// `February`
  String get february {
    return Intl.message(
      'February',
      name: 'february',
      desc: '',
      args: [],
    );
  }

  /// `March`
  String get march {
    return Intl.message(
      'March',
      name: 'march',
      desc: '',
      args: [],
    );
  }

  /// `April`
  String get april {
    return Intl.message(
      'April',
      name: 'april',
      desc: '',
      args: [],
    );
  }

  /// `May`
  String get may {
    return Intl.message(
      'May',
      name: 'may',
      desc: '',
      args: [],
    );
  }

  /// `June`
  String get june {
    return Intl.message(
      'June',
      name: 'june',
      desc: '',
      args: [],
    );
  }

  /// `July`
  String get july {
    return Intl.message(
      'July',
      name: 'july',
      desc: '',
      args: [],
    );
  }

  /// `August`
  String get august {
    return Intl.message(
      'August',
      name: 'august',
      desc: '',
      args: [],
    );
  }

  /// `September`
  String get september {
    return Intl.message(
      'September',
      name: 'september',
      desc: '',
      args: [],
    );
  }

  /// `October`
  String get october {
    return Intl.message(
      'October',
      name: 'october',
      desc: '',
      args: [],
    );
  }

  /// `November`
  String get november {
    return Intl.message(
      'November',
      name: 'november',
      desc: '',
      args: [],
    );
  }

  /// `December`
  String get december {
    return Intl.message(
      'December',
      name: 'december',
      desc: '',
      args: [],
    );
  }

  /// `Invalid username`
  String get invalidUsername {
    return Intl.message(
      'Invalid username',
      name: 'invalidUsername',
      desc: '',
      args: [],
    );
  }

  /// `You must accept the terms and conditions.`
  String get pleaseAcceptPrivacyAndPolicy {
    return Intl.message(
      'You must accept the terms and conditions.',
      name: 'pleaseAcceptPrivacyAndPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Sign In`
  String get sign_in {
    return Intl.message(
      'Sign In',
      name: 'sign_in',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get enter_phone_number {
    return Intl.message(
      'Enter your phone number',
      name: 'enter_phone_number',
      desc: '',
      args: [],
    );
  }

  /// `Invalid phone format`
  String get invalid_phone_format {
    return Intl.message(
      'Invalid phone format',
      name: 'invalid_phone_format',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enter_password {
    return Intl.message(
      'Enter your password',
      name: 'enter_password',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number`
  String get enter_valid_phone {
    return Intl.message(
      'Please enter a valid phone number',
      name: 'enter_valid_phone',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get or {
    return Intl.message(
      'or',
      name: 'or',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Facebook`
  String get continue_with_facebook {
    return Intl.message(
      'Continue with Facebook',
      name: 'continue_with_facebook',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Google`
  String get continue_with_google {
    return Intl.message(
      'Continue with Google',
      name: 'continue_with_google',
      desc: '',
      args: [],
    );
  }

  /// `Don’t have an account?`
  String get no_account {
    return Intl.message(
      'Don’t have an account?',
      name: 'no_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up`
  String get sign_up {
    return Intl.message(
      'Sign Up',
      name: 'sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Enter your username`
  String get enterUsername {
    return Intl.message(
      'Enter your username',
      name: 'enterUsername',
      desc: '',
      args: [],
    );
  }

  /// `Enter phone number`
  String get enterPhoneNumber {
    return Intl.message(
      'Enter phone number',
      name: 'enterPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Wrong phone format`
  String get wrongPhoneFormat {
    return Intl.message(
      'Wrong phone format',
      name: 'wrongPhoneFormat',
      desc: '',
      args: [],
    );
  }

  /// `Enter password`
  String get enterPassword {
    return Intl.message(
      'Enter password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password must meet the requirements`
  String get password_validation {
    return Intl.message(
      'Password must meet the requirements',
      name: 'password_validation',
      desc: '',
      args: [],
    );
  }

  /// `Enter confirm password`
  String get enterConfirmPassword {
    return Intl.message(
      'Enter confirm password',
      name: 'enterConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password does not match`
  String get wrongConfirmPassword {
    return Intl.message(
      'Confirm password does not match',
      name: 'wrongConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get seeAll {
    return Intl.message(
      'See All',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `Privacy Policy`
  String get PrivacyPolicy {
    return Intl.message(
      'Privacy Policy',
      name: 'PrivacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Terms and Conditions`
  String get TermsAndConditions {
    return Intl.message(
      'Terms and Conditions',
      name: 'TermsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get AboutUs {
    return Intl.message(
      'About Us',
      name: 'AboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Login Successful`
  String get LoginSuccessful {
    return Intl.message(
      'Login Successful',
      name: 'LoginSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `User does not exist or password is incorrect`
  String get UserDoesNotExistOrPasswordIsIncorrect {
    return Intl.message(
      'User does not exist or password is incorrect',
      name: 'UserDoesNotExistOrPasswordIsIncorrect',
      desc: '',
      args: [],
    );
  }

  /// `Continue as Guest`
  String get continue_as_guest {
    return Intl.message(
      'Continue as Guest',
      name: 'continue_as_guest',
      desc: '',
      args: [],
    );
  }

  /// `IMAX Cinema`
  String get IMAX_Cinema {
    return Intl.message(
      'IMAX Cinema',
      name: 'IMAX_Cinema',
      desc: '',
      args: [],
    );
  }

  /// `Review`
  String get review {
    return Intl.message(
      'Review',
      name: 'review',
      desc: '',
      args: [],
    );
  }

  /// `Movies`
  String get movies {
    return Intl.message(
      'Movies',
      name: 'movies',
      desc: '',
      args: [],
    );
  }

  /// `Comments`
  String get comments {
    return Intl.message(
      'Comments',
      name: 'comments',
      desc: '',
      args: [],
    );
  }

  /// ` Add Comment`
  String get addComment {
    return Intl.message(
      ' Add Comment',
      name: 'addComment',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `Dark`
  String get dark {
    return Intl.message(
      'Dark',
      name: 'dark',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message(
      'Light',
      name: 'light',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Theme`
  String get theme {
    return Intl.message(
      'Theme',
      name: 'theme',
      desc: '',
      args: [],
    );
  }

  /// `LogOut`
  String get logOut {
    return Intl.message(
      'LogOut',
      name: 'logOut',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message(
      'Gender',
      name: 'gender',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Personal Info`
  String get personalInfo {
    return Intl.message(
      'Personal Info',
      name: 'personalInfo',
      desc: '',
      args: [],
    );
  }

  /// `Email Address`
  String get emailAddress {
    return Intl.message(
      'Email Address',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message(
      'Setting',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `The luxurious seats and immersive sound system make for a truly unforgettable`
  String
      get theLuxuriousSeatsAndImmersiveSoundSystemMakeForATrulyUnforgettable {
    return Intl.message(
      'The luxurious seats and immersive sound system make for a truly unforgettable',
      name:
          'theLuxuriousSeatsAndImmersiveSoundSystemMakeForATrulyUnforgettable',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, there was an error. Please try again later.`
  String get SorryThereWasAnErrorPleaseTryAgainLater {
    return Intl.message(
      'Sorry, there was an error. Please try again later.',
      name: 'SorryThereWasAnErrorPleaseTryAgainLater',
      desc: '',
      args: [],
    );
  }

  /// `StatUp is planned for 2025, a type of theater known for its large screen size and high-quality sound system. It offers an immersive viewing experience for movies, documentaries, and other content.`
  String
      get StatUpIsPlannedFor2025TypeOfTheaterKnownForItsLargeScreenSizeAndHighQualitySoundSystemItOffersAnImmersiveViewingExperienceForMoviesDocumentariesAndOtherContent {
    return Intl.message(
      'StatUp is planned for 2025, a type of theater known for its large screen size and high-quality sound system. It offers an immersive viewing experience for movies, documentaries, and other content.',
      name:
          'StatUpIsPlannedFor2025TypeOfTheaterKnownForItsLargeScreenSizeAndHighQualitySoundSystemItOffersAnImmersiveViewingExperienceForMoviesDocumentariesAndOtherContent',
      desc: '',
      args: [],
    );
  }

  /// `Shazam: Fury of the Gods`
  String get ShazamFuryOfTheGods {
    return Intl.message(
      'Shazam: Fury of the Gods',
      name: 'ShazamFuryOfTheGods',
      desc: '',
      args: [],
    );
  }

  /// `Avengers: Infinity War`
  String get AvengersInfinityWar {
    return Intl.message(
      'Avengers: Infinity War',
      name: 'AvengersInfinityWar',
      desc: '',
      args: [],
    );
  }

  /// `2 hours 5 minutes`
  String get TwoHoursFiveMinutes {
    return Intl.message(
      '2 hours 5 minutes',
      name: 'TwoHoursFiveMinutes',
      desc: '',
      args: [],
    );
  }

  /// `Action, Sci-Fi`
  String get ActionSciFi {
    return Intl.message(
      'Action, Sci-Fi',
      name: 'ActionSciFi',
      desc: '',
      args: [],
    );
  }

  /// `Great selection of movies. Highly recommended!`
  String get GreatSelectionOfMoviesHighlyRecommended {
    return Intl.message(
      'Great selection of movies. Highly recommended!',
      name: 'GreatSelectionOfMoviesHighlyRecommended',
      desc: '',
      args: [],
    );
  }

  /// `The luxurious seats and immersive sound system make for a truly unforgettable experience.`
  String
      get TheLuxuriousSeatsAndImmersiveSoundSystemMakeForATrulyUnforgettable {
    return Intl.message(
      'The luxurious seats and immersive sound system make for a truly unforgettable experience.',
      name:
          'TheLuxuriousSeatsAndImmersiveSoundSystemMakeForATrulyUnforgettable',
      desc: '',
      args: [],
    );
  }

  /// `The cinema's modern design and aesthetically pleasing decor create a welcoming atmosphere.`
  String
      get TheCinemasModernDesignAndAestheticallyPleasingDecorCreateAWelcomingAtmosphere {
    return Intl.message(
      'The cinema\'s modern design and aesthetically pleasing decor create a welcoming atmosphere.',
      name:
          'TheCinemasModernDesignAndAestheticallyPleasingDecorCreateAWelcomingAtmosphere',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notifications {
    return Intl.message(
      'Notification',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get general {
    return Intl.message(
      'General',
      name: 'general',
      desc: '',
      args: [],
    );
  }

  /// `zakaria1`
  String get zakaria1 {
    return Intl.message(
      'zakaria1',
      name: 'zakaria1',
      desc: '',
      args: [],
    );
  }

  /// `Ahmed Sayed`
  String get ahmedSayed {
    return Intl.message(
      'Ahmed Sayed',
      name: 'ahmedSayed',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to log out ?`
  String get areYouSureYouWantToLogOut {
    return Intl.message(
      'Are you sure you want to log out ?',
      name: 'areYouSureYouWantToLogOut',
      desc: '',
      args: [],
    );
  }

  /// `Enter e-mail address`
  String get enterEmailAddress {
    return Intl.message(
      'Enter e-mail address',
      name: 'enterEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Invalid e-mail format`
  String get invalidEmailFormat {
    return Intl.message(
      'Invalid e-mail format',
      name: 'invalidEmailFormat',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy easy ticket booking and personalized recommendations`
  String get enjoyEasyTicketBookingAndPersonalizedRecommendations {
    return Intl.message(
      'Enjoy easy ticket booking and personalized recommendations',
      name: 'enjoyEasyTicketBookingAndPersonalizedRecommendations',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to YourSeat !`
  String get welcomeToYourSeat {
    return Intl.message(
      'Welcome to YourSeat !',
      name: 'welcomeToYourSeat',
      desc: '',
      args: [],
    );
  }

  /// `Start Using the App ->`
  String get startUsingTheApp {
    return Intl.message(
      'Start Using the App ->',
      name: 'startUsingTheApp',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message(
      'Skip',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `New movies ! Easy booking`
  String get newMoviesEasyBooking {
    return Intl.message(
      'New movies ! Easy booking',
      name: 'newMoviesEasyBooking',
      desc: '',
      args: [],
    );
  }

  /// `Book tickets for the latest movies at the cinema nearest to you.`
  String get bookTicketsForTheLatestMoviesAtTheCinemaNearestToYou {
    return Intl.message(
      'Book tickets for the latest movies at the cinema nearest to you.',
      name: 'bookTicketsForTheLatestMoviesAtTheCinemaNearestToYou',
      desc: '',
      args: [],
    );
  }

  /// `Favorite it!\n Add watchlist`
  String get favoriteItAddWatchlist {
    return Intl.message(
      'Favorite it!\n Add watchlist',
      name: 'favoriteItAddWatchlist',
      desc: '',
      args: [],
    );
  }

  /// `Favorites or watchlist for quick access to your beloved movies.`
  String get favoritesOrWatchlistForQuickAccessToYourBelovedMovies {
    return Intl.message(
      'Favorites or watchlist for quick access to your beloved movies.',
      name: 'favoritesOrWatchlistForQuickAccessToYourBelovedMovies',
      desc: '',
      args: [],
    );
  }

  /// `Ahmed Sayed`
  String get ahmedSayed1 {
    return Intl.message(
      'Ahmed Sayed',
      name: 'ahmedSayed1',
      desc: '',
      args: [],
    );
  }

  /// `Esam`
  String get Esam {
    return Intl.message(
      'Esam',
      name: 'Esam',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Watch List`
  String get watchlist {
    return Intl.message(
      'Watch List',
      name: 'watchlist',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Tickets`
  String get tickets {
    return Intl.message(
      'Tickets',
      name: 'tickets',
      desc: '',
      args: [],
    );
  }

  /// `ask me here...`
  String get askmehere {
    return Intl.message(
      'ask me here...',
      name: 'askmehere',
      desc: '',
      args: [],
    );
  }

  /// `Hello , I’m your AI\nAssistant !`
  String get HelloIamyourAIAssistant {
    return Intl.message(
      'Hello , I’m your AI\nAssistant !',
      name: 'HelloIamyourAIAssistant',
      desc: '',
      args: [],
    );
  }

  /// `typing...`
  String get typing {
    return Intl.message(
      'typing...',
      name: 'typing',
      desc: '',
      args: [],
    );
  }

  /// `can i help you?`
  String get canyouhelp {
    return Intl.message(
      'can i help you?',
      name: 'canyouhelp',
      desc: '',
      args: [],
    );
  }

  /// ` Yes`
  String get yes {
    return Intl.message(
      ' Yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `Esam`
  String get Esam1 {
    return Intl.message(
      'Esam',
      name: 'Esam1',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
