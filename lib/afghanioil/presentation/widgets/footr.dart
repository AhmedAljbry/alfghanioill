import 'package:afghanioil/afghanioil/presentation/pages/Return%20Policy.dart';
import 'package:afghanioil/afghanioil/presentation/pages/develober.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:afghanioil/afghanioil/presentation/pages/Home.dart';
import 'package:afghanioil/afghanioil/presentation/pages/PrivacyPolicy.dart';

import 'package:afghanioil/afghanioil/presentation/pages/TermsAndConditionsPage.dart';


class CustomFooter extends StatelessWidget {
  const CustomFooter({super.key});

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    bool isTabletOrPC = screenSize.width > 600;

    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.green[900],
      child: isTabletOrPC
          ? _buildDesktopFooter(context)
          : _buildMobileFooter(context),
    );
  }

  Widget _buildMobileFooter(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle("روابط رئيسية"),
        _buildLinkRow(
            ["الرئيسية", "من نحن", "الموزعون المعتمدون", "خدمة العملاء"],
            [const Home(), const Home(), const Home(), const Home()],
            context),

        const SizedBox(height: 20),

        _buildSectionTitle("روابط قانونية"),
        _buildLinkRow(
            ["سياسة الاسترجاع", "سياسة الخصوصية", "الشروط والأحكام"],
            [const ReturnPolicy(), const PrivacyPolicy(), const TermsAndConditionsPage()],
            context),

        const SizedBox(height: 20),

        _buildSectionTitle("خدمة العملاء"),
        Row(
          children: [
            _buildIconText(FontAwesomeIcons.whatsapp, "واتساب"),
            const SizedBox(width: 20),
            _buildIconText(Icons.email, "بريد إلكتروني"),
          ],
        ),

        const SizedBox(height: 20),

        _buildSectionTitle("المطورون"),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  DeveloperInfoPage()));
          },
          child: _buildIconText(FontAwesomeIcons.code, "المطورون"),
        ),

        const SizedBox(height: 20),

        _buildSectionTitle("تابعونا على مواقع التواصل"),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildSocialIcon(FontAwesomeIcons.facebook, "فيسبوك"),
            _buildSocialIcon(FontAwesomeIcons.snapchat, "سناب شات"),
            _buildSocialIcon(FontAwesomeIcons.instagram, "إنستغرام"),
            _buildSocialIcon(FontAwesomeIcons.youtube, "يوتيوب"),
            _buildSocialIcon(FontAwesomeIcons.tiktok, "تيك توك"),
          ],
        ),

        const Divider(color: Colors.white24, height: 30),

        Center(
          child: Text(
            "© 2025, متجر الزيت الأفغاني. إحدى المتاجر التابعة لشركة التركيبة الطبيعية.",
            style: TextStyle(color: Colors.white60, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopFooter(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle("روابط رئيسية"),
                _buildLinkRow(
                    ["الرئيسية", "من نحن", "الموزعون المعتمدون", "خدمة العملاء"],
                    [const Home(), const Home(), const Home(), const Home()],
                    context),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle("روابط قانونية"),
                _buildLinkRow(
                    ["سياسة الاسترجاع", "سياسة الخصوصية", "الشروط والأحكام"],
                    [const ReturnPolicy(), const PrivacyPolicy(), const TermsAndConditionsPage()],
                    context),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle("خدمة العملاء"),
                _buildIconText(FontAwesomeIcons.whatsapp, "واتساب"),
                const SizedBox(height: 10),
                _buildIconText(Icons.email, "بريد إلكتروني"),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle("المطورون"),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) =>  DeveloperInfoPage()));
                  },
                  child: _buildIconText(FontAwesomeIcons.code, "المطورون"),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 20),

        _buildSectionTitle("تابعونا على مواقع التواصل"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSocialIcon(FontAwesomeIcons.facebook, "فيسبوك"),
            _buildSocialIcon(FontAwesomeIcons.snapchat, "سناب شات"),
            _buildSocialIcon(FontAwesomeIcons.instagram, "إنستغرام"),
            _buildSocialIcon(FontAwesomeIcons.youtube, "يوتيوب"),
            _buildSocialIcon(FontAwesomeIcons.tiktok, "تيك توك"),
          ],
        ),

        const Divider(color: Colors.white24, height: 30),

        Center(
          child: Text(
            "© 2025, متجر الزيت الأفغاني. إحدى المتاجر التابعة لشركة التركيبة الطبيعية.",
            style: TextStyle(color: Colors.white60, fontSize: 14),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildLinkRow(List<String> links, List<Widget> pages, BuildContext context) {
    return Wrap(
      spacing: 15,
      children: List.generate(links.length, (index) {
        return TextButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => pages[index]));
          },
          child: Text(
            links[index],
            style: const TextStyle(color: Colors.white70, fontSize: 14),
          ),
        );
      }),
    );
  }

  Widget _buildIconText(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, color: Colors.amber, size: 24),
        const SizedBox(width: 8),
        Text(text, style: const TextStyle(color: Colors.white70, fontSize: 14)),
      ],
    );
  }

  Widget _buildSocialIcon(IconData icon, String tooltip) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: IconButton(
        icon: Icon(icon, color: Colors.white, size: 28),
        tooltip: tooltip,
        onPressed: () {},
      ),
    );
  }
}
