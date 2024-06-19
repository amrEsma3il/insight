import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

import '../../core/const.dart';


class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
    late FlutterTts flutterTts=FlutterTts() ;
  // Uint8List? imageBytes;
  late Timer timer;
  late Timer speakTimer;
  String type = "face", result = "no result";
  String lang = "en";
  CameraController? controller;
  List<CameraDescription>? cameras;

  @override
  void initState() {
      timer=  Timer.periodic(const Duration(seconds: 11), (timer) async { 
     //
try{     var response =await http.get( Uri.parse('http://192.168.1.3:5000/predict?type=$type&lang=$lang'));





if (response.statusCode == 200) {
  Map<String,dynamic> body=jsonDecode(response.body);
  log("api result=============");
  log(body.toString());
 result=body['result']??"No Result";
// await speak(result);
  setState(() {
    // result=body['result']??"No Result";
  });
}else{

  log("=========error");
}
}catch(e){
  log(e.toString());


}

});

speakTimer=Timer.periodic(Duration(seconds: 5), (timer) async {

await  speak(result);
 });


    super.initState();
    initializeCamera();
  
  }


Future<void> speak(String text)async{


 await flutterTts.setLanguage('en-Us');
 await flutterTts.setPitch(1.0);
  await flutterTts.setSpeechRate(0.5);
 await flutterTts.speak(text);
}

  Future<void> initializeCamera() async {
    cameras = await availableCameras();
    controller = CameraController(cameras![0], ResolutionPreset.high);
    await controller!.initialize();
    // if (mounted) {
    //   setState(() {});
    //   startImageStream();
    // }
  }

//   void startImageStream() {
//     controller!.startImageStream((CameraImage image) async {

      
//       // Convert image to Uint8List and send to server
//       Uint8List frame = await convertYUV420toImage(image);


//       socketService.sendFrame(frame, type, type == "ocr" ? lang : null);
//       setState(() {
//         imageBytes=frame;
//       });
//     });
//   }

//   Future<Uint8List> convertYUV420toImage(CameraImage image) async {
//     // Conversion logic here
//     img.Image newImg=img.Image.fromBytes(
//  image.width,
//    image.height,
//     image.planes[0].bytes,
//     format: img.Format.bgra
   
//   );
//     return Uint8List.fromList(img.encodeJpg(newImg)); // Placeholder
//   }



// img.Image _convertBGRA8888(CameraImage image) {
//   return img.Image.fromBytes(
//   width:   image.width,
//  height:    image.height,
//    bytes:  image.planes[0].bytes.buffer,
//     format: img.Format.uint8,
//   );
// }




  @override
  void dispose() {
    controller?.dispose();
    timer.cancel();
    
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
              children: [


          controller==null?Center(child: CircularProgressIndicator(color: Colors.blue,),):      Positioned(top: 0,
                bottom: 0,
                  child: CameraPreview(controller!)),
                Positioned(
                    right: 15,
                    top: 20,
                    child: SizedBox(
                      width: 100,
                      child: Wrap(
                        children: [Text(
                          result,
                          
                          style: TextStyle(
                            
                            
                            overflow:TextOverflow.ellipsis ,
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Color.fromARGB(255, 6, 119, 194)),
                        ),]
                      ),
                    )),
                Positioned(
                    bottom: 30,
                    left: 7,
                    right: 7,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                          4,
                          (index) => GestureDetector(
                                onTap: () {
                                  switch (index) {
                                    case 0:
                                      type = "face";
                                      // socketService.sendFrame(type,null);
                                      break;
                                    case 1:
                                      type = "ocr";
                                      //  socketService.sendFrame(type,"en");
                                      break;
                                    case 2:
                                      type = "object";
                                      //  socketService.sendFrame(type,null);
                                      break;
                                    case 3:
                                      type = "currency";
                                      //  socketService.sendFrame(type,null);
                                      break;
                                    default:
                                      type = "face";
                                      //  socketService.sendFrame(type,null);
                                      break;
                                  }
                                  setState(() {
                                    
                                  });
                                  log(type);
                                
                                },
                                child: Container(
      height: 100,
      width: MediaQuery.of(context).size.width / 4 - 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), // Customize radius as needed
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20), // Same radius as BoxDecoration
        child: Image.asset(
         imgFeatures[index],
          fit: BoxFit.cover, // Ensure the image covers the entire container
        ),
      ),
    )
                              )),
                    ))
              ],
            ),
    );
  }
}



