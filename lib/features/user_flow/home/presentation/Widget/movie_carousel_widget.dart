import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'movie_card.dart';

class MovieCarouselWidget extends StatefulWidget {
  @override
  _MovieCarouselWidgetState createState() => _MovieCarouselWidgetState();
}

class _MovieCarouselWidgetState extends State<MovieCarouselWidget> {
  final PageController _pageController =
  PageController(viewportFraction: 0.7, initialPage: 1);
  int _currentPage = 1; // Track the current page

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: PageView.builder(
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
                          child: Opacity(
                            opacity: _currentPage == index ? 1.0 : 0.5, // Control opacity
                            child: child,
                          ),
                        ),
                      );
                    },
                    child: MovieCard(
                      index: index,
                      currentPage: 1,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 40.h, // Adjust the position of the dots
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(3, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: 5.sp),
                width: _currentPage == index ? 30 : 10,
                height: 8.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: _currentPage == index
                      ? const Color(0xffFCC434)
                      : const Color(0xff2E2E2E),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
