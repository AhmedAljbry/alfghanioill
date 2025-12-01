import 'dart:developer';
import 'package:afghanioil/afghanioil/presentation/pages/plan.dart';
import 'package:afghanioil/afghanioil/presentation/pages/table.dart';
import 'package:afghanioil/afghanioil/presentation/widgets/Button_Widget.dart';
import 'package:afghanioil/afghanioil/presentation/widgets/CarouselSlider.dart';

import 'package:afghanioil/afghanioil/presentation/widgets/Home_Image_Widget/AnimatedImagesRow.dart';
import 'package:afghanioil/afghanioil/presentation/widgets/Home_Image_Widget/Home_dic.dart';
import 'package:afghanioil/afghanioil/presentation/widgets/Home_Image_Widget/s.dart';
import 'package:afghanioil/afghanioil/presentation/widgets/Slider.dart';
import 'package:afghanioil/afghanioil/presentation/widgets/Slider_Text.dart';
import 'package:afghanioil/afghanioil/presentation/widgets/Text_Widget.dart';
import 'package:afghanioil/afghanioil/presentation/widgets/ask_Widget.dart';
import 'package:afghanioil/afghanioil/presentation/widgets/check.dart';
import 'package:afghanioil/afghanioil/presentation/widgets/footr.dart';
import 'package:afghanioil/afghanioil/presentation/widgets/home%202/CustomContent.dart';
import 'package:afghanioil/afghanioil/presentation/widgets/home%202/CustomLayout%201.dart';
import 'package:afghanioil/afghanioil/presentation/widgets/home%202/CustomLayout.dart';
import 'package:afghanioil/afghanioil/presentation/widgets/home%202/CustomText.dart';
import 'package:afghanioil/afghanioil/presentation/widgets/ss.dart';
import 'package:afghanioil/afghanioil/presentation/widgets/ss1.dart';
import 'package:afghanioil/uitl/AppColor.dart';
import 'package:afghanioil/uitl/AppImage.dart';
import 'package:afghanioil/uitl/AppString.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:photo_view/photo_view.dart';
import 'package:jovial_svg/jovial_svg.dart';// استيراد حزمة photo_view

class Home2 extends StatefulWidget {
  const Home2({super.key});

  @override
  State<Home2> createState() => _Home2State();
}

class _Home2State extends State<Home2> {
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
    final bool isLargeScreen = MediaQuery.of(context).size.width > 600;
    log(height.toString());

    return Scaffold(
      appBar: AppBar(
        title: ScalableImageWidget.fromSISource(
          si: ScalableImageSource.fromSvgHttpUrl(
            Uri.parse(
              'https://afghanioil.com/cdn/shop/files/afghanioil_logo.svg?v=1702750858&width=143',
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Slider Image
            SliderImage(imgList: AppImage.imageSlider),
            SizedBox(height: 20),

            // Main Image


            // Title Ton Text
            CustomContent(),
            SizedBox(height: 20),

            // Horizontal ListView
            SS(),
            SizedBox(height: 20),
            // Recharge Screen

            // Home Dic Section 1
            HomeDic(
              image: AppImage.home2DicImage1,
              namedic: "لثقتنا بجودة الزيت الافغاني، نوفر لك الضمان الذهبي، يعني في حال ما لاحظت أي اختلاف في شعرك أو عدم حصولك على أي نتيجة، نضمن لك رد المبلغ المدفوع بالكامل.",
              titledic: "استرجعي نقودك إذا ما حصلتي على نتيجه",
              color: Colors.red,
            ),
            SizedBox(height: 20),
            Padding(padding: EdgeInsets.all(10),
              child:   Text("سهل في الاستعمال",style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.right,
              ),

            ),
            SizedBox(height: 20),
            ss1(),
            SizedBox(height: 20),
            CustomLayout(),

            SizedBox(height: 20,),
            CustomLayout1(),

            SizedBox(height: 20),
            ComparisonTable(),
            SizedBox(height: 20),

            Center(child: CustomText()),
         /*   Padding(padding: EdgeInsets.all(10),
              child:   defaultLargText(
                  txt: "سهل في الاستعمال",
                  color: Colors.black,
                  size: 30,
                  textalign: TextAlign.right
              ),

            ),*/

            FAQList(),
            SizedBox(height: 20),

            // Check Section
            Check(),
            SizedBox(height: 20),

            // Footer Section
            CustomFooter(),
          ],
        ),
      ),
    );


  }
}