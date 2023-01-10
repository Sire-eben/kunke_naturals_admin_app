import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kunke_naturals_admin_app/config/theme.dart';
import 'package:kunke_naturals_admin_app/core/utils/extensions/extensions.dart';
import 'package:kunke_naturals_admin_app/generated/assets.gen.dart';
import 'package:kunke_naturals_admin_app/presentation/auth/login.dart';
import 'package:kunke_naturals_admin_app/presentation/navigation/bottom_navigation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _auth = FirebaseAuth.instance;

  startTimer() {
    Timer(const Duration(seconds: 4), () async {
      if (_auth.currentUser != null) {
        context.replace(const BottomNavigationScreen());
      } else {
        context.replace(const LoginPage());
      }
    });
  }

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Padding(
          padding: const EdgeInsets.all(Insets.xl * 2),
          child: Image.asset(
            Assets.icons.logo.path,
            width: 100,
          ),
        ),
      ),
    );
  }
}
