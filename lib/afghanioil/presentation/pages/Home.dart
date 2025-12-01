import 'dart:developer';
import 'package:afghanioil/afghanioil/presentation/pages/plan.dart';
import 'package:afghanioil/afghanioil/presentation/widgets/Button_Widget.dart';
import 'package:afghanioil/afghanioil/presentation/widgets/CarouselSlider.dart';
import 'package:afghanioil/afghanioil/presentation/widgets/Home_Image_Widget/AnimatedImagesRow.dart';
import 'package:afghanioil/afghanioil/presentation/widgets/Home_Image_Widget/Home_Image_Widget.dart';
import 'package:afghanioil/afghanioil/presentation/widgets/Home_Image_Widget/Home_dic.dart';
import 'package:afghanioil/afghanioil/presentation/widgets/Home_Image_Widget/s.dart';
import 'package:afghanioil/afghanioil/presentation/widgets/Slider.dart';
import 'package:afghanioil/afghanioil/presentation/widgets/Slider_Text.dart';
import 'package:afghanioil/afghanioil/presentation/widgets/Text_Widget.dart';
import 'package:afghanioil/afghanioil/presentation/widgets/ask_Widget.dart';
import 'package:afghanioil/afghanioil/presentation/widgets/check.dart';
import 'package:afghanioil/afghanioil/presentation/widgets/footr.dart';
import 'package:afghanioil/uitl/AppColor.dart';
import 'package:afghanioil/uitl/AppImage.dart';
import 'package:afghanioil/uitl/AppString.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:photo_view/photo_view.dart';
import 'package:jovial_svg/jovial_svg.dart';// استيراد حزمة photo_view

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // استخدام PageController بدلاً من CarouselController
  final PageController _pageController = PageController();
  int _currentIndex = 0;
  bool isExpanded = false; // حالة النص (موسع أم لا)

  final List<String> imgList = [
    "https://afghanioil.com/cdn/shop/files/DSC06407-5.jpg?v=1713418481&width=800",
    "https://afghanioil.com/cdn/shop/files/DSC06404_e43c41ae-780e-4823-9b92-68508233784f.jpg?v=1713418482&width=800",
    'https://afghanioil.com/cdn/shop/files/DSC06403_a14d121b-b626-45ab-af87-98519fa342b3.jpg?v=1724514992&width=800',
    'https://afghanioil.com/cdn/shop/files/DSC06412_9016ec48-87ed-44b3-afe7-fa6e408c89ef.jpg?v=1713418474&width=800',
    "https://afghanioil.com/cdn/shop/files/2_1246ed5e-72f2-444b-b56f-2a92b75b38cb.jpg?v=1724515004&width=800",
    "https://afghanioil.com/cdn/shop/files/11_9268881a-b75a-4fa0-8a15-25579326ed33.jpg?v=1713418511&width=800",
    "https://afghanioil.com/cdn/shop/files/20_1b00a636-5f80-4d64-be2a-1219528c1675.jpg?v=1713419049&width=800",
    "https://afghanioil.com/cdn/shop/files/6_821127e7-a8f3-4ef5-bd2b-f622e90a9806.jpg?v=1713418461&width=800",
  ];
var titletextlist=
[
  "لية الزيت الافغان؟",
  "كيف ممكن ستعملة؟"
  "هل يصلح لجميع انواع الشعر ؟",
  "متى استلم المنتج؟",
  "ماحصلت على نتائج",
];
var textlist=
[
  "يقدم الزيت الأفغاني حل لمعظم مشاكل الشعر، وبالأخص مشكلات الشعر التي لم تستطع منتجات العناية بالشعر الأخرى حلها. الزيت الأفغاني غني عن التعريف، ونحن فخورون بتجارب عملائنا وآرائهم",
  "ننصح باستخدام الزيت الافغاني مرتين إلى ثلاثة مرات لمدة ساعة الى ساعتين مع تدليك فروة الرأس لمده دقيقة واحدة ويفضل ان يكون الشعر مكشوف غير مغطى ويتم غسل الشعر بعد الاستخدام بالشامبو المناسب.",
  "ما يميز تركيبة الزيت الأفغاني انها تعطي النتائج مهما كان نوع شعرك وصعوبة تسريحه ونسبة جفافه ومدى تقصفه والمشاكل التي يعانيها شعرك .",
  "غالبا يتم تسليم المنتج خلال مدة 2 - 4 أيام داخل السعودية، و 3 - 7 أيام خارج السعودية.",
  "لاتقلقي وفر لك الزيت الافغاني " "الضمان الذهبي ""وذلك خصيصاً حتى نضمن لك تجربة مثالية ومرضية بشكل كامل ."
];

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    log(height.toString());

    return Scaffold(
      appBar: AppBar(
        title: ScalableImageWidget.fromSISource(
            si: ScalableImageSource.fromSvgHttpUrl(
                Uri.parse('https://afghanioil.com/cdn/shop/files/afghanioil_logo.svg?v=1702750858&width=143'))),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            HomeImageWidget(),
            SizedBox(height: 20,),
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
            SizedBox(height: 20,),
            // CSizedBoxarouselSlider with SmoothPageIndicator
            SliderImage(imgList: AppImage.imageSlider,),

            SizedBox(height: 30,),
            AnimatedImagesRow(),
            SizedBox(height: 30,),
            SliderImageText(imgList: AppImage.imageSlider3),
            SizedBox(height: 20,),
            VerificationCard(),
            SizedBox(height: 20,),
            HomeDic(image: AppImage.home2DicImage1,namedic: Appstring.Hometext6,titledic: Appstring.titletext1,color:  Color(0xFFA09632),),
            SizedBox(height: 20,),
            defaultLargText(txt: "غيّرنا حياة الكثير❤️", color: Colors.black),
            SizedBox(height: 20,),
            defaultLargText(txt: "عندك أسئلة؟", color: Colors.black),

            // زر التوسيع والطي مع الأنيميشن
            SizedBox(height: 20,),
            FAQList(),
            SizedBox(height: 20,),
            HomeDic(image: AppImage.home2DicImage2,namedic: Appstring.Hometext7,titledic: Appstring.titletext2,color: Colors.red),
            SizedBox(height: 20,),
            defaultLargText(txt: "تابعونا على الانستغرام",color: Colors.black,textalign: TextAlign.start,size: 30),
            SizedBox(height: 20,),
            SliderImage(imgList:AppImage.imageSlider2),
            SizedBox(height: 20,),
            Check(),
            SizedBox(height: 20,),
            CustomFooter()

          ],
        ),

        ),

    );
  }
}