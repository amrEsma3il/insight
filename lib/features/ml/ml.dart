import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../../core/const.dart';
import '../../core/utilits/toast.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late FlutterTts flutterTts = FlutterTts();
  late stt.SpeechToText specch;
  final List<String> keywords = ["ocr","OCR", "face","human" ,"person","scan","object", "currency","عملة","كائن","وجه","ماسح"];
  bool isListening = false;
  // Uint8List? imageBytes;
  late Timer timer;
  // late Timer speakTimer;
  CameraController? controller;
  List<CameraDescription>? cameras;

  @override
  void initState() {
    initSpeech();
    initializeCamera();
    // timer=  Timer.periodic(const Duration(seconds: 11), (timer) async {
    //

// });

// speakTimer=Timer.periodic(Duration(seconds: 5), (timer) async {

//  });

    super.initState();
  }

  Future<void> speakResult(String type) async {
    try {
      var response = await http
          .get(Uri.parse('http://10.0.2.2:5000/predict?type=$type&lang=en'));

      if (response.statusCode == 200) {
        Map<String, dynamic> body = jsonDecode(response.body);
        log("api result=============");
        log(body.toString());
        String resultString = body['result'] ?? "No Result";
     showToast(resultString,Palette.skyBlue);
        await speak(resultString);
      } else {
        log("=========error");
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> speak(String text) async {
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

  Future<void> initSpeech() async {
    specch = stt.SpeechToText();
    bool available = await specch.initialize();
    if (available) {
      setState(() {
        isListening = false;
      });
    } else {
      print('The user has denied the use of speech recognition.');
    }
  }

  void startListening() {
    // if (!isListening) {
    specch.listen(
      // listenFor: Duration(hours: 24),
      // pauseFor: Duration(hours: 6),
      // partialResults: true,
      onResult: (result) {
        processResult(result.recognizedWords);
      },
    );

    setState(() {
      isListening = true;
    });
    // }
  }

  void processResult(String recognizedWords) async {
    log("specch: ================================");
    log(recognizedWords);
    // await speak(recognizedWords);
    for (String keyword in keywords) {
      if (recognizedWords.contains(keyword)||recognizedWords==keyword ) {
        // _detectedWord = keyword;
        log(keyword);
         switch (keyword) { //""   "ماسح"
           case "وجه":
           case "person":
           case "human":
           case "face":
              keyword="face";
             break;
               case "كائن":
               case "object":
              keyword="object";
             break;
               case "ماسح":
               case "scan":
               case "OCR":
               case "ocr":
              keyword="ocr";
             break;
               case "عملة":
               case "currency":
              keyword="currency";
             break;
           default:
         }
        await speakResult(keyword);
        break;
      }
    }
  }

  void stopRecord() {
    if (isListening) {
      specch.stop();
      setState(() {
        isListening = false;
      });
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          controller == null
              ? Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                )
              : Positioned(
                  top: 0, bottom: 0, child: CameraPreview(controller!)),
       
          Positioned(
              bottom: 30,
              left: 7,
              right: 7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                    4,
                    (index) => GestureDetector(
                        onTap: () async {
                          switch (index) {
                            case 0:
                              speakResult("face");

                              // socketService.sendFrame(type,null);
                              break;
                            case 1:
                              speakResult('ocr');
                              //  socketService.sendFrame(type,"en");
                              break;
                            case 2:
                              speakResult("object");
                              //  socketService.sendFrame(type,null);
                              break;
                            case 3:
                              speakResult("currency");
                              ;
                              //  socketService.sendFrame(type,null);
                              break;
                            default:
                              speakResult("face");
                              //  socketService.sendFrame(type,null);
                              break;
                          }

                          // setState(() {

                          // });
                          // log(type);
                        },
                        child: Container(
                          height: 100,
                          width: MediaQuery.of(context).size.width / 4 - 10,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                                20), // Customize radius as needed
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                20), // Same radius as BoxDecoration
                            child: Image.asset(
                              imgFeatures[index],
                              fit: BoxFit
                                  .cover, // Ensure the image covers the entire container
                            ),
                          ),
                        ))),
              )),
          Positioned(
              left: 0,
              top: 0,
              child: GestureDetector(
                onTap: () {
                  isListening ? stopRecord() : startListening();
                },
                child: Container(
                  alignment: Alignment.center,
                  width: 230,
                  height: 210,
                  decoration: BoxDecoration(
                      color: Palette.skyBlue.withOpacity(0.3),
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(200))),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 40.0, bottom: 10),
                    child: Icon(
                      isListening ? Icons.close : Icons.mic,
                      size: 70,
                    ),
                  ),
                ),
              )),
                Positioned(top: 15,
              right: 15,
                
                child: IconButton(
                  onPressed: () {
                Navigator.pop(context);
                
              }, icon: Icon(Icons.arrow_back_sharp,color: Colors.white70,size: 35,)))
        ],
      ),
    );
  }
}
