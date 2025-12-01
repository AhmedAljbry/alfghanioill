import 'package:flutter/material.dart';
import 'package:jovial_svg/jovial_svg.dart';
import 'package:afghanioil/afghanioil/presentation/widgets/footr.dart';

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('الشروط والأحكام'),
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
                        _buildSectionTitle('الشروط والأحكام'),
                        SizedBox(height: 10),
                        _buildDescription('مرحبًا بكم في موقعنا. يسعدنا أن نقدم لكم الشروط والأحكام التي تحكم استخدام الموقع والخدمات المقدمة:'),
                        SizedBox(height: 15),
                        _buildPolicyItem('يجب على المستخدمين الالتزام بالشروط والأحكام المحددة عند استخدام الموقع.'),
                        _buildPolicyItem('نحتفظ بالحق في تعديل أو تغيير هذه الشروط في أي وقت.'),
                        _buildPolicyItem('يجب على العميل التأكد من دقة المعلومات المقدمة أثناء التسجيل أو إجراء عملية الشراء.'),
                        _buildPolicyItem('يتحمل العميل المسؤولية الكاملة عن حماية كلمة المرور الخاصة به.'),
                        _buildPolicyItem('يحق للموقع تعليق أو إنهاء حساب أي مستخدم يخالف الشروط والأحكام.'),
                        _buildPolicyItem('جميع الحقوق محفوظة للموقع ولا يجوز استخدام محتوياته بأي طريقة غير مصرح بها.'),
                        SizedBox(height: 20),
                        _buildSectionTitle('الخصوصية وحماية البيانات'),
                        SizedBox(height: 10),
                        _buildPolicyItem('نحن نلتزم بحماية معلومات المستخدمين ونتعامل مع بياناتهم وفقًا لسياسة الخصوصية الخاصة بنا.'),
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
