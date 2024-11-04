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

  /// `Welcome to YourSeat!`
  String get welcomeToYourSeat {
    return Intl.message(
      'Welcome to YourSeat!',
      name: 'welcomeToYourSeat',
      desc: '',
      args: [],
    );
  }

  /// `Enjoy easy ticket booking and personalized recommendations.`
  String get enjoyEasyTicketBooking {
    return Intl.message(
      'Enjoy easy ticket booking and personalized recommendations.',
      name: 'enjoyEasyTicketBooking',
      desc: '',
      args: [],
    );
  }

  /// `New movies! Easy booking`
  String get newMoviesEasyBooking {
    return Intl.message(
      'New movies! Easy booking',
      name: 'newMoviesEasyBooking',
      desc: '',
      args: [],
    );
  }

  /// `Book tickets for the latest movies at the cinema nearest to you.`
  String get bookTicketsForLatestMovies {
    return Intl.message(
      'Book tickets for the latest movies at the cinema nearest to you.',
      name: 'bookTicketsForLatestMovies',
      desc: '',
      args: [],
    );
  }

  /// `Favorite it! Add to watchlist`
  String get favoriteItAddWatchlist {
    return Intl.message(
      'Favorite it! Add to watchlist',
      name: 'favoriteItAddWatchlist',
      desc: '',
      args: [],
    );
  }

  /// `Favorites or watchlist for quick access to your beloved movies.`
  String get favoritesOrWatchlistForQuickAccess {
    return Intl.message(
      'Favorites or watchlist for quick access to your beloved movies.',
      name: 'favoritesOrWatchlistForQuickAccess',
      desc: '',
      args: [],
    );
  }

  /// `Notification`
  String get notification {
    return Intl.message(
      'Notification',
      name: 'notification',
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

  /// `SALE IS LIVE`
  String get saleIsLive {
    return Intl.message(
      'SALE IS LIVE',
      name: 'saleIsLive',
      desc: '',
      args: [],
    );
  }

  /// `Lorem ipsum dolor sit amet, consectetur adipiscing elit dolor sit amet, consectetur adipiscing elit`
  String get loremIpsumPlaceholder {
    return Intl.message(
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit dolor sit amet, consectetur adipiscing elit',
      name: 'loremIpsumPlaceholder',
      desc: '',
      args: [],
    );
  }

  /// `1m ago`
  String get timeAgo1Minute {
    return Intl.message(
      '1m ago',
      name: 'timeAgo1Minute',
      desc: '',
      args: [],
    );
  }

  /// `10 Hrs ago`
  String get timeAgo10Hours {
    return Intl.message(
      '10 Hrs ago',
      name: 'timeAgo10Hours',
      desc: '',
      args: [],
    );
  }

  /// `15 Hrs ago`
  String get timeAgo15Hours {
    return Intl.message(
      '15 Hrs ago',
      name: 'timeAgo15Hours',
      desc: '',
      args: [],
    );
  }

  /// `See all`
  String get seeAll {
    return Intl.message(
      'See all',
      name: 'seeAll',
      desc: '',
      args: [],
    );
  }

  /// `Now playing`
  String get nowPlaying {
    return Intl.message(
      'Now playing',
      name: 'nowPlaying',
      desc: '',
      args: [],
    );
  }

  /// `Coming soon`
  String get comingSoon {
    return Intl.message(
      'Coming soon',
      name: 'comingSoon',
      desc: '',
      args: [],
    );
  }

  /// `Promo & Discount`
  String get promoDiscount {
    return Intl.message(
      'Promo & Discount',
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

  /// `Please agree with privacy policy`
  String get PleaseAgreeWithPrivacyPolicy {
    return Intl.message(
      'Please agree with privacy policy',
      name: 'PleaseAgreeWithPrivacyPolicy',
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

  // skipped getter for the 'alreadyHaveAccount?' key

  // skipped getter for the '1' key

  // skipped getter for the '2' key

  // skipped getter for the '3' key

  // skipped getter for the '4' key

  // skipped getter for the '5' key

  // skipped getter for the '6' key

  // skipped getter for the '7' key

  // skipped getter for the '8' key

  // skipped getter for the '9' key

  // skipped getter for the '10' key

  // skipped getter for the '11' key

  // skipped getter for the '12' key

  // skipped getter for the '13' key

  // skipped getter for the '14' key

  // skipped getter for the '15' key

  // skipped getter for the '16' key

  // skipped getter for the '17' key

  // skipped getter for the '18' key

  // skipped getter for the '19' key

  // skipped getter for the '20' key

  // skipped getter for the '21' key

  // skipped getter for the '22' key

  // skipped getter for the '23' key

  // skipped getter for the '24' key

  // skipped getter for the '25' key

  // skipped getter for the '26' key

  // skipped getter for the '27' key

  // skipped getter for the '28' key

  // skipped getter for the '29' key

  // skipped getter for the '30' key

  // skipped getter for the '31' key

  // skipped getter for the '1990' key

  // skipped getter for the '1991' key

  // skipped getter for the '1992' key

  // skipped getter for the '1993' key

  // skipped getter for the '1994' key

  // skipped getter for the '1995' key

  // skipped getter for the '1996' key

  // skipped getter for the '1997' key

  // skipped getter for the '1998' key

  // skipped getter for the '1999' key

  // skipped getter for the '2000' key

  // skipped getter for the '2001' key

  // skipped getter for the '2002' key

  // skipped getter for the '2003' key

  // skipped getter for the '2004' key

  // skipped getter for the '2005' key

  // skipped getter for the '2006' key

  // skipped getter for the '2007' key

  // skipped getter for the '2008' key

  // skipped getter for the '2009' key

  // skipped getter for the '2010' key

  // skipped getter for the '2011' key

  // skipped getter for the '2012' key

  // skipped getter for the '2013' key

  // skipped getter for the '2014' key

  // skipped getter for the '2015' key

  // skipped getter for the '2016' key

  // skipped getter for the '2017' key

  // skipped getter for the '2018' key

  // skipped getter for the '2019' key

  // skipped getter for the '2020' key

  // skipped getter for the '2021' key

  // skipped getter for the '2022' key

  // skipped getter for the '2023' key

  // skipped getter for the '2024' key

  /// `Enter user name`
  String get enterUsername {
    return Intl.message(
      'Enter user name',
      name: 'enterUsername',
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

  /// `Enter Password`
  String get enterPassword {
    return Intl.message(
      'Enter Password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Password should be at least 8 characters with at least one uppercase letter, one number, and one special character`
  String get passwordCriteria {
    return Intl.message(
      'Password should be at least 8 characters with at least one uppercase letter, one number, and one special character',
      name: 'passwordCriteria',
      desc: '',
      args: [],
    );
  }

  /// `Enter confirmation password`
  String get enterConfirmPassword {
    return Intl.message(
      'Enter confirmation password',
      name: 'enterConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Wrong confirmation password`
  String get wrongConfirmPassword {
    return Intl.message(
      'Wrong confirmation password',
      name: 'wrongConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'Already have an account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Registered Successfully`
  String get registerSuccess {
    return Intl.message(
      'Registered Successfully',
      name: 'registerSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, this account exists already`
  String get accountExists {
    return Intl.message(
      'Sorry, this account exists already',
      name: 'accountExists',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Creating Account`
  String get creatingAccount {
    return Intl.message(
      'Creating Account',
      name: 'creatingAccount',
      desc: '',
      args: [],
    );
  }

  /// `Error saving user`
  String get errorSavingUser {
    return Intl.message(
      'Error saving user',
      name: 'errorSavingUser',
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
