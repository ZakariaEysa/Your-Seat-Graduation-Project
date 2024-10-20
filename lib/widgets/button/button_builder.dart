import 'package:flutter/material.dart';
import 'package:yourseatgraduationproject/resources/color_manager.dart';

import '../../resources/app_styles_manager.dart';

class ButtonBuilder extends StatelessWidget {
  const ButtonBuilder({
    super.key,
    required this.text,
    required this.ontap,
    this.width,
    this.height,
    this.style,
    this.buttonColor,
    this.isLoading,
    this.frameColor,
    this.isActivated = true,
  });

  final String text;
  final VoidCallback ontap;
  final double? width;
  final double? height;
  final TextStyle? style;
  final bool? isLoading;

  final Color? buttonColor;
  final Color? frameColor;
  final bool isActivated;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return isActivated
        ? GestureDetector(
            onTap: ontap,
            child: isLoading == null || isLoading == false
                ? Center(
                    child: Container(
                      width: width ?? screenWidth * 0.50,
                      height: height ?? screenHeight * 0.07,
                      decoration: ShapeDecoration(
                          color: buttonColor ?? ColorManager.primaryW,
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                width: 1,
                                color: frameColor ?? ColorManager.primaryW),
                            borderRadius: BorderRadius.circular(50),
                          )),
                      child: Center(
                        child: Text(
                          text,
                          style:theme.textTheme.labelLarge!.copyWith(
                            shadows: [
                              BoxShadow(
                                color: Colors.purple.withOpacity(0.2), // Adjust the color and opacity
                                offset: Offset(0, 3), // Adjust the offset
                                blurRadius: 5, // Adjust the blur radius
                              ),
                            ],
                          ),

                      ))
                      ),

                  )
                : Center(
                    child: Container(
                      width: width ?? screenWidth * 0.70,
                      height: height ?? 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: ColorManager.primaryW,
                      ),
                      child: const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                  ),
          )
        : Center(
            child: Container(
              width: width ?? screenWidth * 0.95,
              height: height ?? screenHeight * 0.07,
              decoration: BoxDecoration(
                border: Border.all(
                    color: frameColor != null
                        ? frameColor!.withOpacity(0)
                        : buttonColor != null
                            ? buttonColor!.withOpacity(0)
                            : ColorManager.primaryW.withOpacity(0)),
                borderRadius: BorderRadius.circular(10),
                color: buttonColor ?? ColorManager.primaryW.withOpacity(0.5),
              ),
              child: Center(
                child: Text(
                  text,
                  style: style ?? AppStylesManager.customTextStyleBl,
                ),
              ),
            ),
          );
  }
}
