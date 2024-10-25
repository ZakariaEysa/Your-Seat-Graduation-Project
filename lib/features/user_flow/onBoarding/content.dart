class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent({required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      title: "Welcome to YourSeat !",
      image: "assets/images/image 5.png",
      discription: "Enjoy easy ticket booking and personalized recommendations"
  ),
  UnbordingContent(
      title: "New movies ! Easy booking",
      image: "assets/images/image 6.png",
      discription: "Book tickets for the latest movies at the cinema nearest to you."
  ),
  UnbordingContent(
      title: "Favorite it!\n Add watchlist",
      image: "assets/images/image 7.png",
      discription: "Favorites or watchlist for quick access to your beloved movies. "
  ),
];