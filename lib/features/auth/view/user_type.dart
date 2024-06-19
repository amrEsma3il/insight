import 'package:flutter/material.dart';

import '../../../core/const.dart';
import '../widgets/custom_button_signin.dart';
import 'patient_auth.dart';


class UserType extends StatelessWidget {
  const UserType({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Palette.skyBlue,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButtonSignIn(
                    txt: 'مريض',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AuthenticatePatient()));
                    },
                  ),
                  SizedBox(height: 20,),
                  CustomButtonSignIn(
                    txt: 'مرافق',
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => const AuthenticateDoctor()));
                    },
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
