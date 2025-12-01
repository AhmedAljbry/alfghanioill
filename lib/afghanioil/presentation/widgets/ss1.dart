import 'package:afghanioil/afghanioil/presentation/widgets/Text_Widget.dart';
import 'package:afghanioil/uitl/AppImage.dart';
import 'package:afghanioil/uitl/AppString.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ss1 extends StatefulWidget {
  const ss1({super.key});

  @override
  State<ss1> createState() => _ss1State();
}

class _ss1State extends State<ss1> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  List<String> imagelist = [
    "https://afghanioil.com/cdn/shop/files/01_e3d15043-6144-4406-b96c-25ccee569eca.jpg?v=1712953485&width=800",
    "https://afghanioil.com/cdn/shop/files/02_e7d33c4b-9a6e-48df-8233-bcececb9a13e.jpg?v=1712953492&width=800",
    "https://afghanioil.com/cdn/shop/files/03_d123686a-b8a4-499e-9788-39e5103ffeac.jpg?v=1712953495&width=800",
    "https://afghanioil.com/cdn/shop/files/04_a48927ae-f78d-4b91-9047-b17a6521af38.jpg?v=1712953498&width=800"
  ];
  List<String> title = [
    "1- حطي الزيت على راسك",
    "2- اتركيه لساعة او ساعتين",
    "3- اغسلي شعرك بالشامبو",
    "4- كرري نفس العملية يوميا"
  ];
  List<String> dic = [
    "حطي الزيت على راسك واعملي مساج لفروة شعرك من دقيقة لدقيقتين.",
    "اتركي شعرك مكشوف وخلي الزيت ياخذ مفعوله لمدة ساعة أو ساعتين.",
    "اغسلي شعرك جيدا بالشامبو و نعيما مقدما.",
    "كرري نفس العمليه يوميا للحصول على نتائج أفضل وتأثير طويل الأمد."
  ];

  void _openFullScreenImage(BuildContext context, String imageUrl) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text("صورة كاملة")),
          body: Center(
            child: PhotoView(
              imageProvider: NetworkImage(imageUrl),
              minScale: PhotoViewComputedScale.contained,
              maxScale: PhotoViewComputedScale.covered * 2,
            ),
          ),
        ),
      ),
    );
  }

  double getResponsiveTextSize(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth < 400) {
      return 14; // حجم نص صغير للشاشات الصغيرة
    } else if (screenWidth < 600) {
      return 16; // حجم نص متوسط للشاشات المتوسطة
    } else {
      return 18; // حجم نص كبير للشاشات الكبيرة
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = MediaQuery.of(context).size.width > 600;

    return Directionality(
      textDirection: TextDirection.rtl, // جعل النص من اليمين إلى اليسار
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (isLargeScreen)
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: CarouselSlider(
                    items: imagelist.map((item) {
                      return GestureDetector(
                        onTap: () => _openFullScreenImage(context, item),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            item,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 300,
                          ),
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      height: 320,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      enlargeFactor: 0.3,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      defaultLargText(
                        txt: title[_currentIndex],
                        color: Colors.black,
                        size: getResponsiveTextSize(context),
                      ),
                      const SizedBox(height: 10),
                      defaultSmailText(
                        txt: dic[_currentIndex],
                        color: Colors.black,
                        size: getResponsiveTextSize(context) - 2,
                      ),
                    ],
                  ),
                ),
              ],
            )
          else
            Column(
              children: [
                CarouselSlider(
                  items: imagelist.map((item) {
                    return GestureDetector(
                      onTap: () => _openFullScreenImage(context, item),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          item,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: 200, // ارتفاع أقل للهواتف
                        ),
                      ),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    height: 220, // ارتفاع أقل للهواتف
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.9,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration: const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    onPageChanged: (index, reason) {
                      setState(() {
                        _currentIndex = index;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      defaultLargText(
                        txt: title[_currentIndex],
                        color: Colors.black,
                        size: getResponsiveTextSize(context),
                      ),
                      const SizedBox(height: 8),
                      defaultSmailText(
                        txt: dic[_currentIndex],
                        color: Colors.black,
                        size: getResponsiveTextSize(context) - 2,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SmoothPageIndicator(
                  controller: _pageController,
                  count: imagelist.length,
                  effect: const ExpandingDotsEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    spacing: 6,
                    expansionFactor: 3,
                    activeDotColor: Colors.indigo,
                    dotColor: Colors.grey,
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}