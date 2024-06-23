import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:insight/core/extension/color_formatter.dart';

import '../core/const.dart';
import 'location/location.dart';
import 'ml/ml.dart';
import 'video_sound.dart/sound_helper.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
      foregroundColor: Colors.white,
      backgroundColor: Palette.skyBlue,
      title: const Text("الصفحة الرئيسية"),
      centerTitle: true,
    ),
      
      body: Stack(
      children: [
        Column(children: [
        SizedBox(height: 5,),
        FeatureComponent(onTap: () {
           Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  CameraPage()));
        },
          
          text: 'رؤية الحاسب',img: AppImages.face,right: 80,
        top:100 ,
        sigmaX:0.5 ,
        sigmaY: 0.5, ),
        SizedBox(height: 2,),
         FeatureComponent(onTap: () {
           Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  SoundHelper()));
        },
          
          text: 'المساعد الصوتي',img: AppImages.videoHelping,right: 55,
        top:100 ,
        sigmaX:1 ,
        sigmaY:1,),
          SizedBox(height: 2,),
        FeatureComponent(onTap: () {
           Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  MapSample()));
        },
          
          text: 'الموقع',img:AppImages.gps,
        right: 145,
        top:100 ,
        sigmaX:1.8 ,
        sigmaY:1,),
             
             
        // SizedBox(height: 8,)
          
        ],),
    // Positioned(
    // height: 53,
    // left: 0,
    
    //   right: 0,
    //   top: 0,
    //   child: GradientContainerWithText(),), 
       ],
    ),);
  }
}











class GradientContainerWithText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        boxShadow: [  BoxShadow(
            color: Colors.black.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 15,
            offset: Offset(0, 10), // changes position of shadow
          ),],
        gradient: LinearGradient(
          colors: [
           
            "#1c2e4d".toColor,
            "#797769".toColor,
            "#6f5a50".toColor,
            "#797769".toColor,
            
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Text(
        "الصفحة الرئيسية",
        style: TextStyle(
          color: Color.fromARGB(255, 210, 214, 218).withOpacity(0.8),
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}











class FeatureComponent extends StatelessWidget {
final double right,top,sigmaX,sigmaY;
  final String text,img;
  final void Function()? onTap;
  const FeatureComponent({super.key, required this.text, required this.img, required this.right, required this.top, required this.sigmaX, required this.sigmaY, this.onTap});

  @override
  Widget build(BuildContext context) {
    return 
    GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          // Image asset
          Positioned(
            child: Container(
           
              width: double.infinity,
              height: MediaQuery.of(context).size.height/3-35,
              child: Image.asset(
                img,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Blur effect
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX:sigmaX, sigmaY: sigmaY),
              child: Container(
                color: Colors.black.withOpacity(0.5),
              ),
            ),
          ),
          // Text overlay
          Positioned(
            top:top ,
            right: right,
            child: Text(
              text,
              style: TextStyle(
                color: Color.fromARGB(255, 210, 214, 218),
                fontSize: 42,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  
  }
}




