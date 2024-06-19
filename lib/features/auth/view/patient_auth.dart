import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../core/const.dart';
import '../../home.dart';
import '../widgets/custom_button_signin.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_text_style.dart';
import '../widgets/input_with_label.dart';

class AuthenticatePatient extends StatefulWidget {

  const AuthenticatePatient({super.key});

  @override
  State<AuthenticatePatient> createState() => _AuthenticatePatientState();
}

class _AuthenticatePatientState extends State<AuthenticatePatient> {
  bool isRegister = true;
  @override
  Widget build(BuildContext context) {
    double quarterScreenHeight=MediaQuery.of(context).size.height/4;
    return Scaffold(

      body: Stack(
       
children: [
   Positioned(top: 55,right: 24,child:Column(
    
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(!isRegister?"تسجيل الدخول كمريض":
                            "انشاء حساب",
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
     !isRegister?Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [ SizedBox(height: 23,),
        
          CustomTextField(hintText:"اسم المستخدم",height: 60,width: MediaQuery.of(context).size.width,controller: TextEditingController(),),
         SizedBox(height: 17,),
           CustomTextField(hintText: "رقم المستخدم",height: 60,width: MediaQuery.of(context).size.width, controller:TextEditingController(),),
                              
                            
     ],):   Column(crossAxisAlignment: CrossAxisAlignment.start,
      
      children: [   Text(
                              'المريض :',
                              style: txtDes()!.copyWith(fontSize: 22),
                            ),
                            SizedBox(height: 17,),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InputFieldWithLabel(hint: "اسم المستخدم",height: 60,width: 240, label: 'الاسم',),
                                  InputFieldWithLabel(hint: "عمر المستخدم",height: 60,width: 125, label: 'العمر',),
                              ],
                            ),
                             SizedBox(height: 17,),
                              Row(
                              children: [
                                InputFieldWithLabel(hint: "عنوان المستخدم",height: 60,width: 220, label: 'العنوان',),
                                SizedBox(width: 20,),
                                  InputFieldWithLabel(hint: "كود الكاميرا",height: 60,width: 150, label: 'الكود',),
                              ],
                            ),
                                  SizedBox(height: 17,),
                               InputFieldWithLabel(hint: "رقم المستخدم",height: 60,width: MediaQuery.of(context).size.width, label: 'رقم الهاتف',),
                                 SizedBox(height: 17,),
                               InputFieldWithLabel(hint:"الرابط",height: 60,width: MediaQuery.of(context).size.width, label: 'الرابط',),
                                 SizedBox(height: 17,),
                               InputFieldWithLabel(hint: "صف اعاقتك البصرية بالتفصيل",height: 150,width: MediaQuery.of(context).size.width, label: 'وصف الحالة',maxLines: 10,),
                                 SizedBox(height: 20,),
        Text(
                              'المتابع :',
                              style: txtDes()!.copyWith(fontSize: 22),
                            ),
                            SizedBox(height: 17,),
                           InputFieldWithLabel(hint:"اسم المتابع",height: 60,width: MediaQuery.of(context).size.width, label: 'الاسم',),
                           SizedBox(height: 17,),
                               InputFieldWithLabel(hint: "رقم المتابع",height: 60,width: MediaQuery.of(context).size.width, label: 'رقم الهاتف',),
                                 
                            ],),
     
                                 SizedBox(height: 20,),
                                 CustomButtonSignIn(
                                  width: MediaQuery.of(context).size.width,
                    txt: isRegister?"انشاء حساب":"تسجيل دخول",
                    onPressed: () {
                 if (!isRegister) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home()));
                 }     
                   

                              isRegister=!isRegister;
                              print(isRegister.toString());
                              setState(() {
                                
                              });
                    },
                  ),
                  SizedBox(height: 17,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    
                    children: [Text(!isRegister?"لا تمتلك حساب؟":
                            'تمتلك حساب بالفعل؟',
                            style: txtDes()!.copyWith(fontSize: 18),
                          ), SizedBox(width: 4,),GestureDetector(
                            onTap: () {
                             isRegister=!isRegister;
                               setState(() {
                                
                              });
                            },
                            child: Text(!isRegister?"قم بإنشاء حساب":
                              "قم بتسجيل الدخول",
                              style: redirectAuth(),
                            ),
                          )],)
                          ,SizedBox(height: 17,),
    
      ],),
    ),
  ),
  ),
)]
        
      ),
    );
  }
}