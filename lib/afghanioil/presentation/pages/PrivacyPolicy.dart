import 'package:flutter/material.dart';
import 'package:jovial_svg/jovial_svg.dart';
import 'package:afghanioil/afghanioil/presentation/widgets/footr.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

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
                        _buildSectionTitle('سياسة الخصوصية'),
                        SizedBox(height: 10),
                        _buildDescription('آخر تحديث: 23 يناير 2024'),
                        SizedBox(height: 15),
                        _buildPolicyItem('تصف سياسة الخصوصية هذه سياساتنا وإجراءاتنا بشأن جمع معلوماتك واستخدامها والكشف عنها عند استخدام الخدمة.'),
                        _buildPolicyItem('نحن نستخدم بياناتك الشخصية لتوفير الخدمة وتحسينها. باستخدام الخدمة، فإنك توافق على جمع واستخدام المعلومات وفقًا لسياسة الخصوصية هذه.'),
                        _buildPolicyItem('تشير البيانات الشخصية إلى أي معلومات تتعلق بفرد محدد أو يمكن التعرف عليه.'),
                        _buildPolicyItem('نقوم بجمع البيانات الشخصية مثل: الاسم، البريد الإلكتروني، رقم الهاتف، والعنوان.'),
                        _buildPolicyItem('نستخدم ملفات تعريف الارتباط وتقنيات التتبع لتحسين تجربة المستخدم.'),
                        _buildPolicyItem('يتم الاحتفاظ بالبيانات الشخصية طالما كان ذلك ضروريًا للأغراض المنصوص عليها في سياسة الخصوصية هذه.'),
                        _buildPolicyItem('لديك الحق في حذف أو طلب حذف بياناتك الشخصية التي جمعناها عنك.'),
                        SizedBox(height: 20),
                        _buildSectionTitle('مشاركة المعلومات'),
                        SizedBox(height: 10),
                        _buildPolicyItem('قد نشارك بياناتك مع مقدمي الخدمة، أو في حال عمليات نقل الأعمال، أو بموافقتك.'),
                        _buildPolicyItem('نلتزم بحماية بياناتك الشخصية من الوصول غير المصرح به أو التعديل أو الإفصاح غير القانوني.'),
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
          Icon(Icons.privacy_tip, color: Colors.blue, size: 24),
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
