import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';




class DeveloperInfoPage extends StatelessWidget {
  final String whatsappUrl = "https://wa.me/+966561337879";
  final String facebookUrl = "https://www.facebook.com/احمد الجبري";
  final String emailUrl = "mailto:aljbryahmed7@gmail.com";
  final String phoneUrl = "tel:+967773966049";

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.business,
              size: 100,
              color: Colors.blueAccent,
            ),
            SizedBox(height: 20),
            Text(
              'AJ7 - شركاؤك في النجاح الرقمي',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'نحو مستقبل رقمي مبتكر، نقدم حلولاً احترافية لتطوير التطبيقات والمواقع الإلكترونية بلمسة إبداعية.',
              style: TextStyle(fontSize: 16, color: Colors.grey[800]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Text(
              'تم إنشاء هذا الموقع بواسطة فريقنا المتكامل لتقديم أفضل الحلول التقنية لك.',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(

              onPressed: () => _launchURL(whatsappUrl),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'احجز استشارتك المجانية الآن!',
                style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'تواصل معنا:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  icon: Icon(FontAwesomeIcons.envelope, color: Colors.blueAccent),
                  onPressed: () => _launchURL(emailUrl),
                ),
                IconButton(
                  icon: Icon(FontAwesomeIcons.phone, color: Colors.blueAccent),
                  onPressed: () => _launchURL(phoneUrl),
                ),
                IconButton(
                  icon: Icon(FontAwesomeIcons.facebook, color: Colors.blue),
                  onPressed: () => _launchURL(facebookUrl),
                ),
                IconButton(
                  icon: Icon(FontAwesomeIcons.whatsapp, color: Colors.green),
                  onPressed: () => _launchURL(whatsappUrl),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
