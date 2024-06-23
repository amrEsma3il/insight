import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:insight/core/const.dart';
import 'show_camera.dart';

class CameraOpen extends StatefulWidget {
  const CameraOpen({Key? key}) : super(key: key);
  @override
  State<CameraOpen> createState() => _CameraOpenState();
}
class _CameraOpenState extends State<CameraOpen> {
  TextEditingController passcodeController = TextEditingController();
   TextEditingController FollowerController =TextEditingController();
  String Correctpass ='20122001';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Palette.skyBlue,
        title: const Text("التحقق"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
        child: Center(
          child: Column( 
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
        
        FeatureComponent(img: AppImages.camera,sigmaX: 1.5,sigmaY: 1.5,right: 80,top: 200, text: '',),
        SizedBox(height: 20,),
              Text(
                "أدخل رمز المرور من فضلك !",
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20,),
                Container(
                child: Padding(
                   padding: const EdgeInsets.all(20.0),
                
                  child: TextFormField(
        
                    controller:  FollowerController ,
                    decoration: InputDecoration(
                      labelText: ' ادخل اسمك',
                      prefixIcon: Icon(
                        Icons.person,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            
                    Container(
                child: Padding(
                   padding: const EdgeInsets.fromLTRB(20.0,0,20,20),
                  child: TextFormField(
        
                    controller:  passcodeController ,
                    decoration: InputDecoration(
                      labelText: 'أدخل رمز المرور ',
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            //
              SizedBox(height: 10,),
        
             CustomButton(Correctpass: Correctpass,passcodeController: passcodeController,)
            ],
          ),
        ),
      ),
    );
  }
}
showSnackBar(BuildContext context){
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('This Passcode is incorrect', style: TextStyle(color: Colors.white),),
    backgroundColor: Colors.grey,
    //position : SnackBarPosition.TOP,
  ));
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
              height: MediaQuery.of(context).size.height/3+40,
              child: Opacity(
                opacity: 0.7,
                child: Image.asset(
                  img,
                  fit: BoxFit.cover,
                ),
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







class CustomButton extends StatelessWidget {
  final TextEditingController passcodeController ;
  final String Correctpass ;

  const CustomButton({super.key, required this.passcodeController, required this.Correctpass});

  void showSnackBar(BuildContext context) {
    final snackBar = SnackBar(content: Text('Incorrect passcode'));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: 370,
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0), // Increase the size of the button
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0), // Set the corner radius
      ),
      child: Text(
        'تأكيد',
        style: TextStyle(
          color: Colors.white,
          fontSize: 19.5,
          fontWeight: FontWeight.bold,
        ),
      ),
      color: Palette.skyBlue,
      onPressed: () {
        String passcode = passcodeController.text;
        if (passcode == Correctpass) {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ShowCamera()),
          );
        } else {
          print(passcode);
          showSnackBar(context);
        }
      },
    );
  }
}