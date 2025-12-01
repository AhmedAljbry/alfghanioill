import 'dart:developer';
import 'package:afghanioil/afghanioil/presentation/widgets/CarouselSlider.dart';
import 'package:afghanioil/afghanioil/presentation/widgets/Home_Image_Widget/Home_Image_Widget.dart';
import 'package:afghanioil/afghanioil/presentation/widgets/Text_Widget.dart';
import 'package:afghanioil/uitl/AppColor.dart';
import 'package:afghanioil/uitl/AppImage.dart';
import 'package:afghanioil/uitl/AppString.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:photo_view/photo_view.dart'; // استيراد حزمة photo_view

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // استخدام PageController بدلاً من CarouselController
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  final List<String> imgList = [
    'https://via.placeholder.com/600x400/ff7f7f/333333?text=Image+1',
    'https://via.placeholder.com/600x400/7f7fff/333333?text=Image+2',
    'https://via.placeholder.com/600x400/7fff7f/333333?text=Image+3',
    'https://via.placeholder.com/600x400/fff77f/333333?text=Image+4',
  ];

  void _openFullScreenImage(BuildContext context, String imageUrl) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text("صورة كاملة"),
          ),
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
    var height = MediaQuery.of(context).size.height;
    log(height.toString());

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            HomeImageWidget(),

            Stack(
              children: [
                Padding(
                  padding: EdgeInsets.all(15),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.7),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(20),
                    child: Text(
                      "الزيت روعه ماشاء الله وقف التساقط الحمد لله، وكمان طول شعري وصار ناعم، شكرا عالزيت و الله يعطيكم العافيه.",
                      style: TextStyle(
                        color: Appcolor.colorblack,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),

            // CarouselSlider with SmoothPageIndicator
            CarouselSlider(
              items: imgList.map((item) {
                return GestureDetector(
                  onTap: () {
                    _openFullScreenImage(context, item); // فتح الصورة بالحجم الكامل
                  },
                  child: Container(
                    child: Center(
                      child: Image.network(item, fit: BoxFit.cover, width: 1000),
                    ),
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 400,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
                initialPage: 0,
                enableInfiniteScroll: true,
                reverse: false,
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 3),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                enlargeFactor: 0.3,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                    _pageController.animateToPage(
                      index,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  });
                },
              ),
            ),

            // SmoothPageIndicator to show current page
            SmoothPageIndicator(
              controller: _pageController, // استخدام PageController هنا
              count: imgList.length,
              effect: SlideEffect(
                spacing: 8.0,
                radius: 4.0,
                dotWidth: 24.0,
                dotHeight: 16.0,
                paintStyle: PaintingStyle.stroke,
                strokeWidth: 1.5,
                dotColor: Colors.grey,
                activeDotColor: Colors.indigo,
              ),
            ),
          ],
        ),
      ),
    );
  }
}