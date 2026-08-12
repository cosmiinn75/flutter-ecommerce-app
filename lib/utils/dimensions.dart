import 'package:get/get.dart';
class Dimensions {
    static double screenHeight = Get.context!.height;
    static double screenWidth = Get.context!.width;

    static double design_width = 390;
    static double design_height = 880;
    static double font20 = screenHeight/42.2;

    static double calculateHeight(double pixelDimension){
     return pixelDimension * screenHeight/design_height;
    }

    static double calculateWidth(double pixelDimension){
      return pixelDimension*screenWidth/design_width;
    }
}