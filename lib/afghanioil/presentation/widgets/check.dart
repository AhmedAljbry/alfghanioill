import 'package:flutter/material.dart';

class Check extends StatelessWidget {
  Check({super.key});

  final List<Map<String, dynamic>> items = [
    {
      "icon": Icons.energy_savings_leaf_outlined,
      "title": "منتج طبيعي",
      "subtitle": "آمن و طبيعي 100% و خالي من المواد الكيميائية",
    },
    {
      "icon": Icons.star_border,
      "title": "جودة عالية",
      "subtitle": "مصنوع من أفضل المواد الطبيعية",
    },
    {
      "icon": Icons.accessibility,
      "title": "تمتع بمضمون موثوق وأداء لا مثيل له",
      "subtitle": "اختبر القوة والمتانة مع منتجاتنا المُجربة التي تضمن لك راحة البال وأداء فائق. استثمر في الجودة، وكن دائمًا على استعداد للتفوق.",
      "slogan": "جودة تُحسن أدائك، ثقة تضمن لك الأمان"
    },
    {
      "icon": Icons.check_circle,
      "title": "موثوق",
      "subtitle": "منتج معتمد وذو تقييمات ممتازة",
    },
  ];

  @override
  Widget build(BuildContext context) {
    // 🔹 الحصول على حجم الشاشة لتحديد الجهاز
    var screenSize = MediaQuery.of(context).size;
    bool isTabletOrPC = screenSize.width > 600; // تحديد إذا كان تابلت أو حاسوب

    return Padding(
      padding: const EdgeInsets.all(16.0), // هامش خارجي لجمالية التصميم
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(), // تعطيل التمرير داخل GridView
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isTabletOrPC ? 4 : 2, // عدد الأعمدة: 4 للحاسوب/تابلت، 2 للهاتف
          crossAxisSpacing: 16, // المسافة بين الأعمدة
          mainAxisSpacing: 16, // المسافة بين الصفوف
          childAspectRatio: 1, // نسبة العرض إلى الارتفاع
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  items[index]["icon"],
                  size: 40,
                  color: Colors.amber, // لون الأيقونة ذهبي
                ),
                const SizedBox(height: 10),
                Text(
                  items[index]["title"],
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                Text(
                  items[index]["subtitle"],
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}