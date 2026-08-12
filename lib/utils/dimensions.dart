import 'package:flutter/material.dart';

class Dimensions {
    static double screenHeight = 0;
    static double screenWidth = 0;

    static const double designWidth = 390;
    static const double designHeight = 880;

    static void init(BuildContext context) {
        final size = MediaQuery.sizeOf(context);

        screenHeight = size.height;
        screenWidth = size.width;
    }

    static double get font20 => screenHeight / 42.2;

    static double calculateHeight(double pixelDimension) {
        return pixelDimension * screenHeight / designHeight;
    }

    static double calculateWidth(double pixelDimension) {
        return pixelDimension * screenWidth / designWidth;
    }
}