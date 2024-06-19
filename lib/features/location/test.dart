// import 'package:flutter/material.dart';
// import 'package:speech_to_text/speech_to_text.dart' as stt;
// import 'package:flutter_tts/flutter_tts.dart';
// class SpeechToTextExample extends StatefulWidget {
//   @override
//   _SpeechToTextExampleState createState() => _SpeechToTextExampleState();
// }

// class _SpeechToTextExampleState extends State<SpeechToTextExample> {
//   late stt.SpeechToText _speech;
//   late FlutterTts _flutterTts;
//   bool _isListening = false;
//   String _detectedWord = '';
//   final List<String> _keywords = [
//     'address', 'position', 'location', 'عنوان', 'الموقع', 'المكان'
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _speech = stt.SpeechToText();
//     _flutterTts = FlutterTts();
//     _initSpeech();
//   }

//   Future<void> _initSpeech() async {
//     bool available = await _speech.initialize(
//       onStatus: (status) {
//         if (status == 'notListening') {
//           _startListening();
//         }
//       },
//       onError: (error) => print('Error: $error'),
//     );
//     if (available) {
//       _startListening();
//     } else {
//       print('The user has denied the use of speech recognition.');
//     }
//   }

//   void _startListening() {
//     if (!_isListening) {
//       _speech.listen(
//         onResult: (result) {
//           _processResult(result.recognizedWords);
//         },
//       );
//       setState(() {
//         _isListening = true;
//       });
//     }
//   }

//   void _processResult(String recognizedWords) {
//     for (String keyword in _keywords) {
//       if (recognizedWords.contains(keyword)) {
//         _detectedWord = keyword;
//         _speak(keyword);
//         break;
//       }
//     }
//   }

//   Future<void> _speak(String word) async {
//     await _flutterTts.speak(word);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Speech to Text Example')),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Text('Listening...'),
//             if (_detectedWord.isNotEmpty)
//               Text('Detected Word: $_detectedWord',
//                   style: TextStyle(fontSize: 24)),
//           ],
//         ),
//       ),
//     );
//   }
// }