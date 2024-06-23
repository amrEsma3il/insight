import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../core/const.dart';

class SoundHelper extends StatelessWidget {
  const SoundHelper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
      foregroundColor: Colors.white,
      backgroundColor: Palette.skyBlue,
      title: const Text("المساعد الصوتي"),
      centerTitle: true,
    ),
      body: Center(
      child: Lottie.asset(
  'assets/animations/sound_animation.json',
  width: MediaQuery.of(context).size.width,
  height: 200,
  fit: BoxFit.fill,
)
    ),);
  }
}