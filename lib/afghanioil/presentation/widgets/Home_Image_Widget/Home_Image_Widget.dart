import 'package:flutter/material.dart';
import 'package:afghanioil/afghanioil/presentation/pages/Home%202.dart';
import 'package:afghanioil/afghanioil/presentation/pages/Plans1.dart';
import 'package:afghanioil/afghanioil/presentation/widgets/Button_Widget.dart';
import 'package:afghanioil/afghanioil/presentation/widgets/Text_Widget.dart';
import 'package:afghanioil/uitl/AppColor.dart';
import 'package:afghanioil/uitl/AppImage.dart';
import 'package:afghanioil/uitl/AppString.dart';
import 'package:flutter/material.dart';

class HomeImageWidget extends StatelessWidget {
  const HomeImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool isMobile = screenSize.width < 600; // تحديد إذا كان الجهاز موبايل أو لا

    return SizedBox(
      height: screenSize.height, // اجعل الصورة تمتد لكامل الشاشة
      width: double.infinity,
      child: Stack(
        children: [
          /// الخلفية - صورة رئيسية تغطي كامل الشاشة
          Positioned.fill(
            child: Image.network(
              AppImage.homeImage,
              fit: BoxFit.cover, // يجعل الصورة تمتد لكامل الشاشة دون تشويه
            ),
          ),

          /// طبقة التعتيم والمحتوى
          Container(
            height: screenSize.height,
            width: double.infinity,
            color: Colors.black.withOpacity(0.2),
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                defaultSmailText(txt: Appstring.Hometext1),
                SizedBox(height: isMobile ? 30 : 40),
                defaultLargText(txt: Appstring.Hometext2),
                SizedBox(height: isMobile ? 30 : 40),
                defaultMadumeText(txt: Appstring.Hometext3),
                SizedBox(height: isMobile ? 30 : 40),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    defaultEventButton(
                      txt: "تحقق من اصالة المنتج",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RechargeScreen1(),
                          ),
                        );
                      },
                    ),
                    SizedBox(width: 10),
                    defaultEventButton(
                      txt: "اكتشف المنتج",
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Home2()),
                        );
                      },
                    ),
                  ],
                ),
                SizedBox(height: isMobile ? 20 : 30),
                defaultSmailText(txt: Appstring.Hometext4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


