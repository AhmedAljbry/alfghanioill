import 'package:flutter/material.dart';

class FAQList extends StatefulWidget {
  @override
  _FAQListState createState() => _FAQListState();
}

class _FAQListState extends State<FAQList> {
  List<String> titletextlist = [
    "لية الزيت الأفغاني؟",
    "كيف ممكن استعماله؟",
    "هل يصلح لجميع أنواع الشعر؟",
    "ما حصلت على نتائج",
  ];

  List<String> textlist = [
    "يقدم الزيت الأفغاني حل لمعظم مشاكل الشعر، وبالأخص مشكلات الشعر التي لم تستطع منتجات العناية بالشعر الأخرى حلها. الزيت الأفغاني غني عن التعريف، ونحن فخورون بتجارب عملائنا وآرائهم.",
    "ننصح باستخدام الزيت الأفغاني مرتين إلى ثلاثة مرات لمدة ساعة إلى ساعتين مع تدليك فروة الرأس لمدة دقيقة واحدة، ويفضل أن يكون الشعر مكشوفًا وغير مغطى، ويتم غسل الشعر بعد الاستخدام بالشامبو المناسب.",
    "ما يميز تركيبة الزيت الأفغاني أنها تعطي النتائج مهما كان نوع شعرك وصعوبة تسريحه ونسبة جفافه ومدى تقصفه والمشاكل التي يعانيها شعرك.",
    "لا تقلقي! وفر لك الزيت الأفغاني الضمان الذهبي، وذلك خصيصًا حتى نضمن لك تجربة مثالية ومرضية بشكل كامل.",
  ];

  List<bool> isExpandedList = List.generate(5, (index) => false);

  void toggleExpansion(int index) {
    setState(() {
      for (int i = 0; i < isExpandedList.length; i++) {
        if (i == index) {
          isExpandedList[i] = !isExpandedList[i]; // فتح أو إغلاق العنصر الحالي
        } else {
          isExpandedList[i] = false; // إغلاق باقي العناصر
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isLargeScreen = MediaQuery.of(context).size.width > 600;

    return Container(
      padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 245, 222, 179), // لون بيج
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: titletextlist.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              GestureDetector(
                onTap: () => toggleExpansion(index),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        isExpandedList[index]
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                        color: Colors.black,
                      ),
                      const Spacer(),
                      Text(
                        titletextlist[index],
                        style: TextStyle(
                          fontSize: isLargeScreen ? 20 : 18, // حجم النص بناءً على حجم الشاشة
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              AnimatedCrossFade(
                duration: const Duration(milliseconds: 300),
                crossFadeState: isExpandedList[index]
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                firstChild: const SizedBox(),
                secondChild: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    textlist[index],
                    style: TextStyle(
                      fontSize: isLargeScreen ? 16 : 14, // حجم النص بناءً على حجم الشاشة
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        separatorBuilder: (context, index) => Container(
          height: 1,
          width: double.infinity,
          color: Colors.grey[400],
        ),
      ),
    );
  }
}