import 'package:flutter/material.dart';

class CustomLayout1 extends StatelessWidget {
  const CustomLayout1({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = MediaQuery.of(context).size.width > 600;

    return Directionality(
      textDirection: TextDirection.rtl, // جعل النص من اليمين إلى اليسار
      child: Center(
        child: isLargeScreen
            ? _buildHorizontalLayout(context) // تصميم أفقي للحاسوب والتابلت
            : _buildVerticalLayout(context), // تصميم عمودي للهاتف
      ),
    );
  }

  // تصميم عمودي للهاتف
  Widget _buildVerticalLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            height: MediaQuery.of(context).size.height * 0.3,
            width: MediaQuery.of(context).size.width * 0.8,
            child: Image.network(
              "https://afghanioil.com/cdn/shop/files/9_0f3b4b91-55c7-452b-8032-ac0dbf218b2b.jpg?v=1712776778&width=1000",
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFFA09632), // لون الخلفية
            borderRadius: BorderRadius.circular(10),
          ),
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "مصرح رسميا",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.045, // حجم النص المناسب
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 10),
              Text(
                "مصرح رسميا من الهيئة العامة للغذاء والدواء حاصل على شهادات مختبرات بالجودة والمقاييس الأمنية.",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.035, // حجم النص المناسب
                  color: Colors.white70,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
      ],
    );
  }

  // تصميم أفقي للحاسوب والتابلت
  Widget _buildHorizontalLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            height: MediaQuery.of(context).size.height * 0.4,
            width: MediaQuery.of(context).size.width * 0.4,
            child: Image.network(
              "https://afghanioil.com/cdn/shop/files/9_0f3b4b91-55c7-452b-8032-ac0dbf218b2b.jpg?v=1712776778&width=1000",
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 20),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color(0xFFA09632), // لون الخلفية
            borderRadius: BorderRadius.circular(10),
          ),
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height * 0.4,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "مصرح رسميا",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.025, // حجم النص المناسب
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.right,
              ),
              const SizedBox(height: 10),
              Text(
                "مصرح رسميا من الهيئة العامة للغذاء والدواء حاصل على شهادات مختبرات بالجودة والمقاييس الأمنية.",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width * 0.01, // حجم النص المناسب
                  color: Colors.white70,
                ),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
      ],
    );
  }
}