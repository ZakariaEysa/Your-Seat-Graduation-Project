import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedNetworkImageF extends StatelessWidget {
  const CachedNetworkImageF({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.fill,
    this.placeholder,
    this.errorWidget,
    this.placeholderUrl,
  });

  final String imageUrl;
  final String? placeholderUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final Widget? placeholder;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      placeholder: (context, _) {
        return Image.asset(
          "assets/images/loading1.gif",
          fit: fit ?? BoxFit.cover,
        );
      },
      errorWidget: (context, e, _) {
        return Image.asset(
          placeholderUrl ?? "assets/images/loading1.gif",
          fit: fit ?? BoxFit.cover,
        );
      },
      fit: fit,
    );
  }
}



//ImageReplacer

