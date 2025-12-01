import 'package:flutter/material.dart';

class CustomLayout extends StatelessWidget {
  const CustomLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = MediaQuery.of(context).size.width > 600;

    return Directionality(
      textDirection: TextDirection.rtl, // جعل النص من اليمين إلى اليسار
      child: isLargeScreen
          ? _buildHorizontalLayout(context) // تصميم أفقي للحاسوب والتابلت
          : _buildVerticalLayout(context), // تصميم عمودي للهاتف
    );
  }

  // تصميم عمودي للهاتف
  Widget _buildVerticalLayout(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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
                "https://afghanioil.com/cdn/shop/files/5_1_b7455f1c-2982-4368-a43d-def6552de209.jpg?v=1712776704&width=800",
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "زيت 100% طبيعي",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.045, // حجم النص المناسب
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 10),
                Text(
                  "الزيت الأفغاني زيت 100% طبيعي وخالي تماما من المركبات الكيميائية، غني بالأحماض الدهنية ومضادات الأكسدة اللي تساعد في ترطيب شعرك، وتزيد من كثافته وحيويته.",
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
      ),
    );
  }

  // تصميم أفقي للحاسوب والتابلت
  Widget _buildHorizontalLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          flex: 2,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              height: MediaQuery.of(context).size.height * 0.4,
              child: Image.network(
                "https://afghanioil.com/cdn/shop/files/5_1_b7455f1c-2982-4368-a43d-def6552de209.jpg?v=1712776704&width=800",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Flexible(
          flex: 2,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: const Color(0xFFA09632), // لون الخلفية
              borderRadius: BorderRadius.circular(10),
            ),
            height: MediaQuery.of(context).size.height * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "زيت 100% طبيعي",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.025, // حجم النص المناسب
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.right,
                ),
                const SizedBox(height: 10),
                Text(
                  "الزيت الأفغاني زيت 100% طبيعي وخالي تماما من المركبات الكيميائية، غني بالأحماض الدهنية ومضادات الأكسدة اللي تساعد في ترطيب شعرك، وتزيد من كثافته وحيويته.",
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.015, // حجم النص المناسب
                    color: Colors.white70,
                  ),
                  textAlign: TextAlign.right,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}