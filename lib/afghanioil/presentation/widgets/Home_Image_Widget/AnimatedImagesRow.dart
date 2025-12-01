import 'dart:math';
import 'package:flutter/material.dart';
import 'package:afghanioil/afghanioil/presentation/widgets/Text_Widget.dart';
import 'package:afghanioil/uitl/AppColor.dart';
import 'package:afghanioil/uitl/AppString.dart';

class AnimatedImagesRow extends StatefulWidget {
  @override
  _AnimatedImagesRowState createState() => _AnimatedImagesRowState();
}

class _AnimatedImagesRowState extends State<AnimatedImagesRow> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 🔹 تحديد حجم الشاشة لمعرفة نوع الجهاز
    bool isWideScreen = MediaQuery.of(context).size.width > 600; // أجهزة التابلت والكمبيوتر

    return LayoutBuilder(
      builder: (context, constraints) {
        return isWideScreen
            ? Row( // 📌 عرض أفقي للتابلت والكمبيوتر
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedImageCard(controller: _controller, angleOffset: -0.08, translation: -10, sizeFactor: 1.2),
                  SizedBox(width: 20),
                  AnimatedImageCard(controller: _controller, angleOffset: 0.08, translation: 10, sizeFactor: 1.2),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    defaultLargText(txt: Appstring.titletext4, color: Appcolor.colorblack, size: 40),
                    SizedBox(height: 16),
                    defaultMadumeText(txt: Appstring.Hometext7, color: Appcolor.colorblack, textalign: TextAlign.start),
                    SizedBox(height: 8),
                    defaultMadumeText(txt: Appstring.Hometext8, color: Appcolor.colorblack, textalign: TextAlign.start),
                  ],
                ),
              ),
            ),
          ],
        )
            : Column( // 📌 عرض رأسي للهاتف
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedImageCard(controller: _controller, angleOffset: -0.08, translation: -10, sizeFactor: 1.0),
                SizedBox(width: 10),
                AnimatedImageCard(controller: _controller, angleOffset: 0.08, translation: 10, sizeFactor: 1.0),
              ],
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  defaultLargText(txt: Appstring.titletext4, color: Appcolor.colorblack, size: 30),
                  SizedBox(height: 8),
                  defaultMadumeText(txt: Appstring.Hometext7, color: Appcolor.colorblack, textalign: TextAlign.center),
                  SizedBox(height: 8),
                  defaultMadumeText(txt: Appstring.Hometext8, color: Appcolor.colorblack, textalign: TextAlign.center),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class AnimatedImageCard extends StatelessWidget {
  final AnimationController controller;
  final double angleOffset;
  final double translation;
  final double sizeFactor;

  AnimatedImageCard({required this.controller, required this.angleOffset, required this.translation, required this.sizeFactor});

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        double angle = angleOffset * sin(controller.value * pi);
        double moveY = 5 * sin(controller.value * pi);

        return Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()
            ..rotateZ(angle)
            ..translate(translation, moveY),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            shadowColor: Colors.black38,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                translation < 0
                    ? "https://afghanioil.com/cdn/shop/files/DSC06446_141466ac-8f56-4d42-bb20-47ec30485713.jpg?v=1712775232&width=1000"
                    : "https://afghanioil.com/cdn/shop/files/19_7aa7c747-e37e-402f-82e0-28b252ec7c02.jpg?v=1712775243&width=700",
                width: 160 * sizeFactor,
                height: 220 * sizeFactor,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }
}
