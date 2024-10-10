import 'package:flutter/material.dart';

import 'movie_card.dart';



class MovieCarouselWidget extends StatefulWidget {
  @override
  _MovieCarouselWidgetState createState() => _MovieCarouselWidgetState();
}

class _MovieCarouselWidgetState extends State<MovieCarouselWidget> {
  // Set initialPage to 1 to make the second item the default one.
  final PageController _pageController = PageController(viewportFraction: 0.7, initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: _pageController,
      itemCount: 3,
      itemBuilder: (context, index) {
        return AnimatedBuilder(
          animation: _pageController,
          builder: (context, child) {
            double value = 1.0;
            if (_pageController.position.haveDimensions) {
              value = _pageController.page! - index;
              value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
            }
            return Center(
              child: Transform.scale(
                scale: Curves.easeOut.transform(value),
                child: child,
              ),
            );
          },
          child: MovieCard(index: index),
        );
      },
    );
  }
}

