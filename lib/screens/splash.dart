import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/assets.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _controller.forward().then((_) {
      if (FirebaseAuth.instance.currentUser == null)
        Get.offNamed('/login');
      else
        Get.offNamed('/photo');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: FadeTransition(
        opacity: _controller,
        child: ScaleTransition(
          scale: _controller,
          child: Center(
            child: Image.asset(Assets.astraTechLogoName, width: width * 0.8),
          ),
        ),
      ),
    );
  }
}
