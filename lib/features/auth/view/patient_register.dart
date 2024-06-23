
import 'package:flutter/material.dart';


import '../../../core/const.dart';
import '../../home.dart';
import '../widgets/custom_button_signin.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_text_style.dart';
import '../widgets/input_with_label.dart';
import 'patient_login.dart';

class AuthenticatePatient extends StatefulWidget {

  const AuthenticatePatient({super.key});

  @override
  State<AuthenticatePatient> createState() => _AuthenticatePatientState();
}

class _AuthenticatePatientState extends State<AuthenticatePatient> {
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
                            Text(
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
            Column(crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [   Text(
                                'المريض :',
                                style: txtDes()!.copyWith(fontSize: 22),
                              ),
                              SizedBox(height: 17,),
                              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InputFieldWithLabel(hint: "اسم المستخدم",height: 60,width: 218, label: 'الاسم',),
                                    InputFieldWithLabel(hint: "عمر المستخدم",height: 60,width: 125, label: 'العمر',),
                                ],
                              ),
                               SizedBox(height: 17,),
                                Row(
                                children: [
                                  InputFieldWithLabel(hint: "عنوان المستخدم",height: 60,width: 210, label: 'العنوان',),
                                  SizedBox(width: 20,),
                                    InputFieldWithLabel(hint: "كود الكاميرا",height: 60,width: 132, label: 'الكود',),
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
                      txt:"انشاء حساب",
                      onPressed: () {
                  
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPatient()));
                     
        
                                
                                
                      },
                    ),
                    SizedBox(height: 17,),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      
                      children: [Text(
                              'تمتلك حساب بالفعل؟',
                              style: txtDes()!.copyWith(fontSize: 18),
                            ), SizedBox(width: 4,),GestureDetector(
                              onTap: () {
                                     Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const LoginPatient()));
                              },
                              child: Text(
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
      ),
    );
  }
}