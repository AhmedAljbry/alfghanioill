
import 'package:afghanioil/afghanioil/presentation/widgets/Text_Widget.dart';
import 'package:afghanioil/uitl/AppColor.dart';
import 'package:afghanioil/uitl/AppString.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderImageText extends StatefulWidget {
  final List<String> imgList;

  const SliderImageText({Key? key, required this.imgList}) : super(key: key);

  @override
  State<SliderImageText> createState() => _SliderImageTextState();
}

class _SliderImageTextState extends State<SliderImageText> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();
  List<String> title = [
    "نتائج تبدأ من أسبوعين فقط",
    "ينفع لجميع أنواع الشعر",
    "سهل في الاستعمال",
    "زيت ٪100 طبيعي",
  ];
  List<String> doc = [
    "لاحظي الفرق في شعرك ابتداء من أسبوعين من الاستعمال.",
    "يعطيك نفس النتائج مهما كان نوع شعرك ونسبة جفافه.",
    "استعمليه على فروة راسك مرّة في اليوم وشوفي النتيجة.",
    "منتج %100 طبيعي وخالي تماما من المركبات الكيميائية."
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

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = MediaQuery.of(context).size.width > 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (isLargeScreen)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: CarouselSlider(
                  items: widget.imgList.map((item) {
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
                    defaultMadumeText(
                      txt: title[_currentIndex],
                      color: Colors.black,
                    ),
                    const SizedBox(height: 10),
                    defaultSmailText(
                      txt: doc[_currentIndex],
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ],
          )
        else
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              CarouselSlider(
                items: widget.imgList.map((item) {
                  return GestureDetector(
                    onTap: () => _openFullScreenImage(context, item),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        children: [
                          Image.network(
                            item,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: 300,
                          ),
                          Positioned(
                            bottom: 10,
                            left: 10,
                            child: Card(
                              color: Colors.black54,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    defaultMadumeText(
                                      txt: title[_currentIndex],
                                      color: Colors.white,
                                    ),
                                    const SizedBox(height: 4),
                                    defaultSmailText(
                                      txt: doc[_currentIndex],
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
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
              Positioned(
                bottom: 10,
                child: SmoothPageIndicator(
                  controller: _pageController,
                  count: widget.imgList.length,
                  effect: const ExpandingDotsEffect(
                    dotHeight: 8,
                    dotWidth: 8,
                    spacing: 6,
                    expansionFactor: 3,
                    activeDotColor: Colors.indigo,
                    dotColor: Colors.grey,
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }
}
