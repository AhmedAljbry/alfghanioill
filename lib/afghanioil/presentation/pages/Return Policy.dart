import 'package:flutter/material.dart';
import 'package:jovial_svg/jovial_svg.dart';
import 'package:afghanioil/afghanioil/presentation/widgets/footr.dart';

class ReturnPolicy extends StatelessWidget {
  const ReturnPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: ScalableImageWidget.fromSISource(
          si: ScalableImageSource.fromSvgHttpUrl(
            Uri.parse('https://afghanioil.com/cdn/shop/files/afghanioil_logo.svg?v=1702750858&width=143'),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _buildSectionTitle('سياسة الاسترجاع (الضمان الذهبي)'),
                        SizedBox(height: 10),
                        _buildDescription('لثقتنا بمنتجنا ورغبتنا في حصولكم على تجربة مميزة، قمنا بعمل سياسة الاسترجاع:'),
                        SizedBox(height: 15),
                        _buildPolicyItem('يحق للعميل تقديم طلب استرجاع نقدي في حال عدم حصوله على أي نتيجة تذكر من المنتج.'),
                        _buildPolicyItem('تقييم الفائدة من عدمها يكون على ذمة العميل ولا يدخل موظف الشركة في أي جدال بهذا الأمر.'),
                        _buildPolicyItem('يتم استقبال طلبات الاسترجاع عبر البريد الإلكتروني الرسمي فقط: info@afghanioil.com، ولا يتم قبول الطلبات عبر وسائل أخرى.'),
                        _buildPolicyItem('قيمة الاسترداد المالي 100% من المبلغ المدفوع (باستثناء رسوم الشحن ورسوم الدفع عند الاستلام إن وجدت).'),
                        _buildPolicyItem('صلاحية الضمان الذهبي هي 30 يومًا من تاريخ الشراء.'),
                        _buildPolicyItem('لا يتحمل العميل أي مبالغ تتعلق بعمليات الاسترجاع أو الرسوم الإدارية.'),
                        SizedBox(height: 20),
                        _buildSectionTitle('عملية الاسترداد'),
                        SizedBox(height: 10),
                        _buildPolicyItem('تستغرق عملية استرداد الأموال ما بين 3-15 يوم عمل.'),
                        SizedBox(height: 30),

                      ],
                    ),
                  ),
                ),
              ),
            ),
            CustomFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String text) {
    return Center(
      child: Text(
        text,
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildDescription(String text) {
    return Center(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildPolicyItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.check_circle, color: Colors.green, size: 24),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }
}
