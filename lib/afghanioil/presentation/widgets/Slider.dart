import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderImage extends StatefulWidget {
  final List<String> imgList;

  const SliderImage({Key? key, required this.imgList}) : super(key: key);

  @override
  State<SliderImage> createState() => _SliderImageState();
}

class _SliderImageState extends State<SliderImage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

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

  @override
  Widget build(BuildContext context) {
    // 🔹 الحصول على حجم الشاشة لتحديد الجهاز
    var screenSize = MediaQuery.of(context).size;
    bool isTabletOrPC = screenSize.width > 600; // تحديد إذا كان تابلت أو حاسوب

    return Column(
      children: [
        CarouselSlider(
          items: widget.imgList.map((item) {
            return GestureDetector(
              onTap: () => _openFullScreenImage(context, item),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16), // 🔹 إضافة زوايا دائرية
                child: Image.network(
                  item,
                  fit: BoxFit.cover,
                  width: isTabletOrPC ? screenSize.width * 0.6 : screenSize.width * 0.9,
                ),
              ),
            );
          }).toList(),
          options: CarouselOptions(
            height: isTabletOrPC ? 500 : 300, // 🔹 تكبير الصور على الأجهزة الكبيرة
            aspectRatio: isTabletOrPC ? 16 / 9 : 16 / 9,
            viewportFraction: isTabletOrPC ? 0.5 : 0.9, // 🔹 جعل الصورة تأخذ نسبة أكبر في الحاسوب
            initialPage: 0,
            enableInfiniteScroll: true,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: isTabletOrPC ? 0.2 : 0.3, // 🔹 تقليل تأثير التكبير قليلاً للحواسيب
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              });
            },
          ),
        ),

        const SizedBox(height: 20),

        // 🔹 مؤشر الصفحات باستخدام SmoothPageIndicator
        SmoothPageIndicator(
          controller: _pageController,
          count: widget.imgList.length,
          effect: const SlideEffect(
            spacing: 8.0,
            radius: 4.0,
            dotWidth: 24.0,
            dotHeight: 3.0,
            paintStyle: PaintingStyle.stroke,
            strokeWidth: 1.5,
            dotColor: Colors.grey,
            activeDotColor: Colors.indigo,
          ),
        ),
      ],
    );
  }
}