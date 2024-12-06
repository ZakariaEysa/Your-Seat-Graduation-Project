// import 'package:flutter/cupertino.dart';
//
// import '../../../generated/l10n.dart';
//
// class OnBoardingContent {
//   String image;
//   String title;
//   String description;
//
//   OnBoardingContent({required this.image, required this.title, required this.description});
// }
//
// List<OnBoardingContent> contents = [
//   OnBoardingContent(
//       title: "Welcome to YourSeat !",
//       image: "assets/images/image 5.png",
//       description: "Enjoy easy ticket booking and personalized recommendations"
//   ),
//   OnBoardingContent(
//       title: "New movies ! Easy booking",
//       image: "assets/images/image 6.png",
//       description: "Book tickets for the latest movies at the cinema nearest to you."
//   ),
//   OnBoardingContent(
//       title: "Favorite it!\n Add watchlist",
//       image: "assets/images/image 7.png",
//       description: "Favorites or watchlist for quick access to your beloved movies. "
//   ),
// ];

import 'package:flutter/cupertino.dart';
import '../../../generated/l10n.dart';

class OnBoardingContent {
  String image;
  String title;
  String description;

  OnBoardingContent({required this.image, required this.title, required this.description});
}

List<OnBoardingContent> getOnBoardingContents(BuildContext context) {
  // Access the localized strings here
  var lang = S.of(context); // Now you can use 'lang' with BuildContext

  return [
    OnBoardingContent(
      title: lang.welcomeToYourSeat, // Use localized string here
      image: "assets/images/image 5.png",
      description: lang.enjoyEasyTicketBookingAndPersonalizedRecommendations,
    ),
    OnBoardingContent(
      title: lang.newMoviesEasyBooking, // Use localized string here
      image: "assets/images/image 6.png",
      description: lang.bookTicketsForTheLatestMoviesAtTheCinemaNearestToYou,
    ),
    OnBoardingContent(
      title: lang.favoriteItAddWatchlist, // Use localized string here
      image: "assets/images/image 7.png",
      description: lang.favoritesOrWatchlistForQuickAccessToYourBelovedMovies,
    ),
  ];
}
