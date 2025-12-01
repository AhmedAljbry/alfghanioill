import 'package:afghanioil/uitl/AppColor.dart';
import 'package:afghanioil/uitl/AppString.dart';
import 'package:flutter/material.dart';

class CustomContent extends StatelessWidget {
  const CustomContent({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool isTabletOrPC = screenSize.width > 600; // تحديد إذا كان تابلت أو حاسوب

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: isTabletOrPC
          ? _buildHorizontalLayout() // تصميم أفقي للحاسوب والتابلت
          : _buildVerticalLayout(), // تصميم عمودي للهاتف
    );
  }

  // تصميم عمودي للهاتف
  Widget _buildVerticalLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.network(
          "https://afghanioil.com/cdn/shop/files/01_1_-removebg-preview_c3786d14-0f6e-417c-a126-d5449f220817.png?v=1712776552&width=500",
        ),
        const SizedBox(height: 10),

        // Title Text
        defaultLargText(
          txt: Appstring.titletext5,
          color: Appcolor.colorblack,
          textalign: TextAlign.center,
        ),
        const SizedBox(height: 10),

        // Description Text
        Padding(
          padding: const EdgeInsets.all(10),
          child: defaultSmailText(
            txt: Appstring.Home2text1,
            color: Appcolor.colorblack,
          ),
        ),
      ],
    );
  }

  // تصميم أفقي للحاسوب والتابلت
  Widget _buildHorizontalLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // الصورة
        Expanded(
          flex: 1,
          child: Image.network(
            "https://afghanioil.com/cdn/shop/files/01_1_-removebg-preview_c3786d14-0f6e-417c-a126-d5449f220817.png?v=1712776552&width=500",
          ),
        ),

        const SizedBox(width: 20),

        // النصوص
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title Text
              defaultLargText(
                txt: Appstring.titletext5,
                color: Appcolor.colorblack,
                textalign: TextAlign.start,
              ),
              const SizedBox(height: 10),

              // Description Text
              defaultSmailText(
                txt: Appstring.Home2text1,
                color: Appcolor.colorblack,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ويدجت للنص الكبير (يمكن استبدالها بالويدجت الفعلية)
Widget defaultLargText({
  required String txt,
  Color? color,
  TextAlign? textalign,
}) {
  return Text(
    txt,
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
      color: color,
    ),
    textAlign: textalign,
  );
}

// ويدجت للنص الصغير (يمكن استبدالها بالويدجت الفعلية)
Widget defaultSmailText({
  required String txt,
  Color? color,
}) {
  return Text(
    txt,
    style: TextStyle(
      fontSize: 16,
      color: color,
    ),
  );
}