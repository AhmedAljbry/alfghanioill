import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = MediaQuery.of(context).size.width > 600;

    return Directionality(
      textDirection: TextDirection.rtl, // جعل النص من اليمين إلى اليسار
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end, // محاذاة النص لليمين
          children: [
            // العنوان
            Text(
              "غير مقتنعة؟",
              style: TextStyle(
                fontSize: isLargeScreen ? 32 : 28, // حجم العنوان بناءً على حجم الشاشة
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 8), // مسافة بين العنوان والنص الفرعي
            // النص الفرعي
            Text(
              "خلينا نجاوب على أسئلتك",
              style: TextStyle(
                fontSize: isLargeScreen ? 20 : 16, // حجم النص الفرعي بناءً على حجم الشاشة
                color: Colors.black87,
              ),
              textAlign: TextAlign.right,
            ),
          ],
        ),
      ),
    );
  }
}