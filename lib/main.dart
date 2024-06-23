import 'package:flutter/material.dart';

import 'config/localization/app_localization.dart';
import 'features/auth/view/user_type.dart';

import 'features/ml/ml.dart';
import 'features/location/location.dart';


void main() {
  runApp(const InSight());
}

class InSight extends StatelessWidget {
  const InSight({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
          locale: const Locale('ar'),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
      title: 'Insight Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  UserType()
    );
  }
}

// class MlFeatures extends StatefulWidget {
//   const MlFeatures({
//     super.key,
//   });

//   @override
//   State<MlFeatures> createState() => _MlFeaturesState();
// }

// class _MlFeaturesState extends State<MlFeatures> {
//   int index=0;
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: Stack(
//         children: [
//           VideoPlayerWidget(index:index,),
//            Positioned(
//             bottom: 25,
//             right: 0,
//             left: 0,
//              child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children:List.generate(4, (i) => GestureDetector(
//                 onTap: () {
//                   setState(() {
//                     index=i;
//                   });
//                 },
//                 child: Container(color: Colors.blueGrey,
//                 height: 120,width: MediaQuery.of(context).size.width/4-10,),
//               )),),
//            )
//         ],
//       ),
//     );
//   }
// }
