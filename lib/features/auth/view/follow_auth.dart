

import 'package:flutter/material.dart';


import '../../../core/const.dart';
import '../../home.dart';
import '../../video_sound.dart/camera_auth.dart';
import '../widgets/custom_button_signin.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_text_style.dart';
import '../widgets/input_with_label.dart';
import 'patient_register.dart';

class LoginFollower extends StatefulWidget {

  const LoginFollower({super.key});

  @override
  State<LoginFollower> createState() => _AuthenticatePatientState();
}

class _AuthenticatePatientState extends State<LoginFollower> {
  @override
  Widget build(BuildContext context) {
    double quarterScreenHeight=MediaQuery.of(context).size.height/4;
    return Scaffold(

      body: SizedBox(height: MediaQuery.of(context).size.height,
        child: Stack(
         
        children: [
           Positioned(top: 55,right: 24,child:Column(
            
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('انشاء حساب',
                             
                              style: title(),
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              'سجل دخولك لو تمتلك حساب بالفعل',
                              style: txtDes(),
                            ),
                          ],
                        ), ),
          Positioned(bottom: 0,
        left: 0,
        right: 0,
          child: Container(
          
            width: MediaQuery.of(context).size.width,
            height: quarterScreenHeight+quarterScreenHeight+quarterScreenHeight,
            decoration: BoxDecoration(color: Palette.skyBlue,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(70))),
          
          child: SingleChildScrollView(
            child: Padding(
             padding: const EdgeInsets.only(right: 10,left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          SizedBox(height: 20,),
            Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ SizedBox(height: 23,),
          
            CustomTextField(hintText:"اسم المتابع",height: 60,width: MediaQuery.of(context).size.width,controller: TextEditingController(),),
           SizedBox(height: 17,),
             CustomTextField(hintText: "رقم المتابع",height: 60,width: MediaQuery.of(context).size.width, controller:TextEditingController(),),
                                
                              
             ],),
             
                                   SizedBox(height: 20,),
                                   CustomButtonSignIn(
                                    width: MediaQuery.of(context).size.width,
                      txt: "انشاء حساب",
                      onPressed: () {
                      
               
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CameraOpen()));
               
                     
        
                              
                      },
                    ),
                    SizedBox(height: 17,),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      
                      children: [Text(" تمتلك حساب؟",
                              style: txtDes()!.copyWith(fontSize: 18),
                            ), SizedBox(width: 4,),GestureDetector(
                              onTap: () {
                                 Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AuthenticatePatient()));
                              },
                              child: Text("قم بتسجيل الدخول"
,                                style: redirectAuth(),
                              ),
                            )],)
                            ,SizedBox(height: 17,),
            
        ],),
            ),
          ),
          ),
        )]
          
        ),
      ),
    );
  }
}