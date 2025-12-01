import 'package:flutter/material.dart';

class ComparisonTable extends StatelessWidget {
  final List<Map<String, dynamic>> data = [
    {'text': 'نفس شكل العبوة', 'status': true},
    {'text': 'آمن على الشعر', 'status': true},
    {'text': 'طبيعي 100%', 'status': true},
    {'text': 'مصرح رسميا', 'status': true},
    {'text': 'ضمان استرجاع', 'status': true},
    {'text': 'نتائج سريعة', 'status': true},
  ];

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isLargeScreen = screenWidth > 600;
    final double fontSizeTitle = isLargeScreen ? 20 : 18;
    final double fontSizeText = isLargeScreen ? 16 : 14;
    final double containerWidth = isLargeScreen ? screenWidth * 0.6 : screenWidth * 0.85;

    return Directionality(
      textDirection: TextDirection.rtl, // جعل النص من اليمين إلى اليسار
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // النص الذي فوق الجدول
            Container(
              padding: const EdgeInsets.all(16),
              width: containerWidth,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "المنتج الأصلي",
                    style: TextStyle(
                      fontSize: fontSizeTitle,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "يتوفر داخل السعودية عبر متجرنا الرسمي فقط."
                        " خارج السعودية يمكن الحصول عليه من متجرنا الرسمي أو عبر وكلائنا المعتمدين.",
                    style: TextStyle(
                      fontSize: fontSizeText,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // مسافة بين النص والجدول
            // الجدول
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 245, 222, 179), // لون الخلفية
              ),
              padding: const EdgeInsets.all(16), // هوامش داخلية
              margin: const EdgeInsets.symmetric(vertical: 20), // هوامش خارجية
              width: isLargeScreen ? screenWidth * 0.8 : screenWidth * 0.95,
              child: Table(
                columnWidths: {
                  0: FixedColumnWidth(isLargeScreen ? 250 : 150),
                  1: FixedColumnWidth(60),
                  2: FixedColumnWidth(60),
                },
                border: TableBorder(
                  horizontalInside: BorderSide(color: Colors.grey.shade400),
                  verticalInside: BorderSide(color: Colors.grey.shade400),
                ),
                children: [
                  TableRow(
                    decoration: BoxDecoration(color: Colors.teal.shade100),
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "المقارنة",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: isLargeScreen ? 22 : 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal.shade900,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "الأصلي",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: isLargeScreen ? 18 : 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal.shade900,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text(
                          "المقلد",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: isLargeScreen ? 18 : 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal.shade900,
                          ),
                        ),
                      ),
                    ],
                  ),
                  ...data.map((item) {
                    return TableRow(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            item['text'],
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: isLargeScreen ? 18 : 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        Icon(
                          item['status'] ? Icons.check_circle : Icons.cancel,
                          color: item['status'] ? Colors.teal : Colors.red,
                          size: isLargeScreen ? 32 : 28,
                        ),
                        Icon(
                          !item['status'] ? Icons.check_circle : Icons.cancel,
                          color: !item['status'] ? Colors.teal : Colors.red,
                          size: isLargeScreen ? 32 : 28,
                        ),
                      ],
                    );
                  }).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
