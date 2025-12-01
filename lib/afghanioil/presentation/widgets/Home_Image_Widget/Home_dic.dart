import 'package:afghanioil/afghanioil/presentation/widgets/Button_Widget.dart';
import 'package:afghanioil/afghanioil/presentation/widgets/Text_Widget.dart';
import 'package:afghanioil/uitl/AppImage.dart';
import 'package:afghanioil/uitl/AppString.dart';
import 'package:flutter/material.dart';

class HomeDic extends StatelessWidget {
  String namedic;
  String titledic;
  String image;
  Color? color = Colors.green[700];
  MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment crossAxisAlignment = CrossAxisAlignment.end;

  HomeDic({
    required this.namedic,
    required this.image,
    required this.titledic,
    this.color,
    this.crossAxisAlignment = CrossAxisAlignment.end,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    // تحديد إذا كان العرض كبيرًا (حاسوب أو تابلت)
    bool isDesktopOrTablet = width > 600;

    return Container(
      height: height * .70,
      child: isDesktopOrTablet
          ? Row(
        children: [
          // الصورة
          Expanded(
            flex: 1,
            child: Image(
              image: NetworkImage(image),
              fit: BoxFit.cover,
              height: height * .70, // ارتفاع الصورة يساوي ارتفاع الـ Container
            ),
          ),
          // الخلفية (النص والأزرار)
          Expanded(
            flex: 1,
            child: Container(
              color: color,
              height: height * .70, // ارتفاع الخلفية يساوي ارتفاع الصورة
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: mainAxisAlignment,
                  crossAxisAlignment: crossAxisAlignment,
                  children: [
                    defaultLargText(txt: titledic, size: 30),
                    SizedBox(height: 10),
                    defaultSmailText(txt: namedic),
                    SizedBox(height: 10),
                    defaultEventButton(txt: 'معرفة المزيد', onPressed: () {})
                  ],
                ),
              ),
            ),
          ),
        ],
      )
          : Column(
        children: [
          // الصورة
          Image(
            image: NetworkImage(image),
            fit: BoxFit.cover,
            height: height * 0.35, // ارتفاع الصورة في حالة الهاتف
          ),
          // الخلفية (النص والأزرار)
          Expanded(
            child: Container(
              color: color,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: mainAxisAlignment,
                  crossAxisAlignment: crossAxisAlignment,
                  children: [
                    defaultLargText(txt: titledic, size: 30),
                    SizedBox(height: 10),
                    defaultSmailText(txt: namedic),
                    SizedBox(height: 10),
                    defaultEventButton(txt: 'معرفة المزيد', onPressed: () {})
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}