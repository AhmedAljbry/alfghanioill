import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class RechargeScreen extends StatefulWidget {
  @override
  _RechargeScreenState createState() => _RechargeScreenState();
}

class _RechargeScreenState extends State<RechargeScreen> with SingleTickerProviderStateMixin {
  TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _message = "";
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  bool _isLoading = true;


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 2));
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeIn),
    );
    _animationController.forward();

    // Simulate a delay for loading the page
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Card for product verification
        Card(
          color: Colors.white,
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                Image.network(
                  "https://afghanioil.com/cdn/shop/files/325168988_547710190630949_2238189094490287597_n__1_-removebg-preview.png?v=1712944413&width=300",
                  height: 120,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 16),
                Text(
                  "العطار",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.green[900]),
                ),
                SizedBox(height: 8),
                Text(
                  "استمتع بحركة مرنة وخالية من الألم! الحل الأمثل لتخفيف آلام المفاصل والتهابات العظام ,وللعصاب.\n\nتحقّق من أصالة المنتج بإدخال الكود أدناه.",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                Form(
                  key: _formKey,
                  child: TextFormField(
                    controller: _controller,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: "أدخل الكود للتحقق من المنتج",
                      hintText: "يرجى إدخال الرقم المكون من 12 خانة",
                      prefixIcon: Icon(Icons.verified, color: Colors.amber),
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: validateCard,
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _checkAndUseCard(_controller.text.trim());
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.symmetric(vertical: 12),
                    backgroundColor: Colors.green[900],
                  ),
                  child: Text("تحقق", style: TextStyle(fontSize: 18,color: Colors.white),),
                ),
                SizedBox(height: 16),
                Text(
                  _message,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: _message.startsWith("✅") ? Colors.green : Colors.red,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),











        // Grid for pro
      ],
    );













  }

  Future<void> _checkAndUseCard(String number) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> doc = await FirebaseFirestore.instance.collection('aleataarids').doc(number).get();

      if (doc.exists && doc.data() != null) {
        var data = doc.data();
        DateTime usageDate = DateTime.now();

        setState(() {
          _message = "✅ المنتج أصلي 100% من مصدر موثوق. تاريخ الإدخال: '${DateFormat('yyyy-MM-dd – HH:mm').format(usageDate)}'\nتاريخ الاستخدام: ${DateFormat('yyyy-MM-dd – HH:mm').format(usageDate)}\n\nنحن ممتنون لاهتمامكم وحرصكم على التأكد من جودة منتجاتنا.\nنحن دائمًا هنا لخدمتكم، ونتطلع إلى تقديم أفضل تجربة لكم.\nشكرًا لثقتكم بنا!";
        });

        await FirebaseFirestore.instance.collection('aleataar_used_codes').doc(number).set({
          'id': data?['id'] ?? 'غير محدد',
          'timestamp': data?['timestamp'] ?? 'غير محدد',
          'usage_date': usageDate.toString(),
        });

        await FirebaseFirestore.instance.collection('aleataarids').doc(number).delete();
      } else {
        DocumentSnapshot<Map<String, dynamic>> usedDoc = await FirebaseFirestore.instance.collection('aleataar_used_codes').doc(number).get();

        setState(() {
          _message = usedDoc.exists ? "❌ الكود قد تم استخدامه من قبل!" : "❌ الكود غير موجود!";
        });
      }
    } catch (e) {
      setState(() {
        _message = "❌ حدث خطأ أثناء البحث عن الكود!";
      });
    }
  }

  String? validateCard(String? value) {
    if (value == null || value.isEmpty) {
      return "يرجى إدخال الرقم";
    } else if (value.length != 12) {
      return "الرقم يجب أن يكون 12 خانة";
    }
    return null;
  }

}
