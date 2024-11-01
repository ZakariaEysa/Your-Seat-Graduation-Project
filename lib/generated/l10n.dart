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
    assert(_current != null, 'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate =
    AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false) ? locale.languageCode : locale.toString();
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
    assert(instance != null, 'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
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

  /// `At YourSeat, we are committed to protecting your privacy. This Privacy Policy outlines how we collect, use, and safeguard your personal data when you use the YourSeat mobile app. By using the app, you agree to the collection and use of your information in accordance with this policy.\n\n1. How We Use Your Information: The information we collect from you is used for the following purposes:\n   To provide and maintain the app: Ensuring the app functions properly and improving its performance.\n   To process transactions: Handling payments for movie tickets and related services.\n   To offer personalized recommendations: Suggesting movies and cinemas based on your preferences and location.\n   To communicate with you: Sending notifications about your bookings, promotions, or updates to our services.\n   To improve our services: Analyzing app usage data to enhance features and troubleshoot issues.\n\n2. How We Protect Your Data: Your Seat uses a combination of industry-standard security measures to protect your personal information, including:\n   Encryption: We secure your payment data and personal information with encryption protocols such as SSL.\n   Access Restrictions: Only authorized personnel can access your personal data.\n   Ongoing Audits: We regularly review our security practices to ensure your data is safe.\n   While we take every precaution, no security measure is completely foolproof, and we cannot guarantee the total security of your data.\n\n3. Data Sharing and Disclosure: Your Seat does not sell or share your personal information with third parties, except:\n   Service Providers: We work with trusted third-party partners (e.g., payment processors, cloud storage providers) to help deliver our services.\n   Legal Obligations: We may disclose your information if required to do so by law or in response to a valid legal request (e.g., a court order).\n\n4. Your Rights: You have the following rights regarding your personal data:\n   Access: You may request a copy of the personal data we hold about you.\n   Correction: You can request corrections or updates to your data.\n   Deletion: You may request the deletion of your data, subject to legal requirements.\n   Opt-out of Marketing: You can unsubscribe from promotional communications by following the unsubscribe link in our emails or adjusting your app settings.`
  String get privacyPolicyContent {
    return Intl.message(
      'At YourSeat, we are committed to protecting your privacy. This Privacy Policy outlines how we collect, use, and safeguard your personal data when you use the YourSeat mobile app. By using the app, you agree to the collection and use of your information in accordance with this policy.\n\n1. How We Use Your Information: The information we collect from you is used for the following purposes:\n   To provide and maintain the app: Ensuring the app functions properly and improving its performance.\n   To process transactions: Handling payments for movie tickets and related services.\n   To offer personalized recommendations: Suggesting movies and cinemas based on your preferences and location.\n   To communicate with you: Sending notifications about your bookings, promotions, or updates to our services.\n   To improve our services: Analyzing app usage data to enhance features and troubleshoot issues.\n\n2. How We Protect Your Data: Your Seat uses a combination of industry-standard security measures to protect your personal information, including:\n   Encryption: We secure your payment data and personal information with encryption protocols such as SSL.\n   Access Restrictions: Only authorized personnel can access your personal data.\n   Ongoing Audits: We regularly review our security practices to ensure your data is safe.\n   While we take every precaution, no security measure is completely foolproof, and we cannot guarantee the total security of your data.\n\n3. Data Sharing and Disclosure: Your Seat does not sell or share your personal information with third parties, except:\n   Service Providers: We work with trusted third-party partners (e.g., payment processors, cloud storage providers) to help deliver our services.\n   Legal Obligations: We may disclose your information if required to do so by law or in response to a valid legal request (e.g., a court order).\n\n4. Your Rights: You have the following rights regarding your personal data:\n   Access: You may request a copy of the personal data we hold about you.\n   Correction: You can request corrections or updates to your data.\n   Deletion: You may request the deletion of your data, subject to legal requirements.\n   Opt-out of Marketing: You can unsubscribe from promotional communications by following the unsubscribe link in our emails or adjusting your app settings.',
      name: 'privacyPolicyContent',
      desc: '',
      args: [],
    );
  }

  /// `1. User Responsibilities: By using this app, you agree to abide by our terms of service and to conduct yourself in a respectful manner. Please refrain from any behavior that disrupts the movie-going experience of others, such as talking loudly, using your phone, or purchasing tickets for unauthorized use. We reserve the right to revoke your access to the app if these terms are violated.\n\n2. User Account Creation: To create an account, you'll need to provide a valid email address and a strong password. Please choose a password that is difficult to guess and avoid using easily identifiable information. Your account data is stored securely and is only accessible by authorized personnel. Security: Choose a strong password that combines letters, numbers, and symbols. Avoid using the same password for multiple accounts. Enable two-factor authentication (if available) for added security. Never share your login information with anyone.\n\n3. Transaction Processing: All transactions are processed securely using [mention payment gateway]. We accept [list of accepted payment methods, e.g., credit cards, debit cards, PayPal]. Additional Information: Please ensure that your payment information is accurate and up-to-date. We reserve the right to cancel orders in case of fraudulent activity or incorrect payment information. For any questions or concerns regarding payments, please contact our customer support team.\n\n4. Ownership of Content: All content within the app, including images, text, videos, and other materials, is the property of [Your Seat] or its licensors. Unless otherwise indicated, you are not permitted to use, reproduce, modify, distribute, or display any content from the app without prior written permission.`
  String get termsAndConditionsContent {
    return Intl.message(
      '1. User Responsibilities: By using this app, you agree to abide by our terms of service and to conduct yourself in a respectful manner. Please refrain from any behavior that disrupts the movie-going experience of others, such as talking loudly, using your phone, or purchasing tickets for unauthorized use. We reserve the right to revoke your access to the app if these terms are violated.\n\n2. User Account Creation: To create an account, you\'ll need to provide a valid email address and a strong password. Please choose a password that is difficult to guess and avoid using easily identifiable information. Your account data is stored securely and is only accessible by authorized personnel. Security: Choose a strong password that combines letters, numbers, and symbols. Avoid using the same password for multiple accounts. Enable two-factor authentication (if available) for added security. Never share your login information with anyone.\n\n3. Transaction Processing: All transactions are processed securely using [mention payment gateway]. We accept [list of accepted payment methods, e.g., credit cards, debit cards, PayPal]. Additional Information: Please ensure that your payment information is accurate and up-to-date. We reserve the right to cancel orders in case of fraudulent activity or incorrect payment information. For any questions or concerns regarding payments, please contact our customer support team.\n\n4. Ownership of Content: All content within the app, including images, text, videos, and other materials, is the property of [Your Seat] or its licensors. Unless otherwise indicated, you are not permitted to use, reproduce, modify, distribute, or display any content from the app without prior written permission.',
      name: 'termsAndConditionsContent',
      desc: '',
      args: [],
    );
  }

  /// `We’d love to hear from you! Whether you have inquiries, need support, want to share feedback, or simply have suggestions, our team is here to assist you. Please feel free to reach out to us using the form below or via the provided contact details.\nContact Information:\nCustomer Support Email: [support@yourseatapp.com]\nPhone Number: [+123-456-7890]\n\nFeedback and Suggestions:\nWe highly value your input! If you have any suggestions on how we can improve your experience with YourSeat, please share them in the message field of the contact form or send them directly to our email.\n\nConnect with us on our social media channels for the latest updates, promotions, and more:`
  String get contactUsContent {
    return Intl.message(
      'We’d love to hear from you! Whether you have inquiries, need support, want to share feedback, or simply have suggestions, our team is here to assist you. Please feel free to reach out to us using the form below or via the provided contact details.\nContact Information:\nCustomer Support Email: [support@yourseatapp.com]\nPhone Number: [+123-456-7890]\n\nFeedback and Suggestions:\nWe highly value your input! If you have any suggestions on how we can improve your experience with YourSeat, please share them in the message field of the contact form or send them directly to our email.\n\nConnect with us on our social media channels for the latest updates, promotions, and more:',
      name: 'contactUsContent',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get aboutUs {
    return Intl.message(
      'About Us',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Please fill the credentials.`
  String get pleaseFillTheCredentials {
    return Intl.message(
      'Please fill the credentials.',
      name: 'pleaseFillTheCredentials',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phonenumber {
    return Intl.message(
      'Phone Number',
      name: 'phonenumber',
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

  /// `Forgot Password`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Continue With Facebook`
  String get continueWithFacebook {
    return Intl.message(
      'Continue With Facebook',
      name: 'continueWithFacebook',
      desc: '',
      args: [],
    );
  }

  /// `Continue With Google`
  String get continueWithGoogle {
    return Intl.message(
      'Continue With Google',
      name: 'continueWithGoogle',
      desc: '',
      args: [],
    );
  }

  /// `Continue As Guest`
  String get continueAsGuest {
    return Intl.message(
      'Continue As Guest',
      name: 'continueAsGuest',
      desc: '',
      args: [],
    );
  }

  /// `Don't have any account yet?`
  String get dontHaveAnyAccountYet {
    return Intl.message(
      'Don\'t have any account yet?',
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

  /// `I agree with privacy policy`
  String get iAgreeWithPrivacyPolicy {
    return Intl.message(
      'I agree with privacy policy',
      name: 'iAgreeWithPrivacyPolicy',
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