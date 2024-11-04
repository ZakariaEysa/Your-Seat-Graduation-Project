class OnBoardingContent {
  String image;
  String title;
  String description;

  OnBoardingContent({required this.image, required this.title, required this.description});
}

List<OnBoardingContent> contents = [
  OnBoardingContent(
      title: "Welcome to YourSeat !",
      image: "assets/images/image 5.png",
      description: "Enjoy easy ticket booking and personalized recommendations"
  ),
  OnBoardingContent(
      title: "New movies ! Easy booking",
      image: "assets/images/image 6.png",
      description: "Book tickets for the latest movies at the cinema nearest to you."
  ),
  OnBoardingContent(
      title: "Favorite it!\n Add watchlist",
      image: "assets/images/image 7.png",
      description: "Favorites or watchlist for quick access to your beloved movies. "
  ),
];