import 'package:afghanioil/afghanioil/presentation/pages/Home.dart';
import 'package:afghanioil/uitl/AppColor.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); // تأكد من تهيئة Flutter
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyBiJ5Ggmjr85uYs8pQ_8uGNkAYKmjUjF3A",
        projectId: "afghanioil",
        storageBucket: "afghanioil.appspot.com",
        messagingSenderId: "1066242960238",
        appId: "1:1066242960238:web:5a6fa9d6a99f046a236f7f",

    ),
  );
  runApp(const MyApp());
  print('==================================================');
  FirebaseFirestore.instance.collection('afghanioilds').get();
  print('==================================================');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'زبت الافغاني',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Appcolor.colorwhite,
          
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FlutterSplashScreen(
        useImmersiveMode: true,
        duration: const Duration(milliseconds: 3000),
        nextScreen: Home(),
        backgroundColor: Colors.white,
        splashScreenBody: Center(
          child: Lottie.asset(
            "image/LottieLogo2.json",
            repeat: true,
          ),
        ),
      ),
    );
  }
}


