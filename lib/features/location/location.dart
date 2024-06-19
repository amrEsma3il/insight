import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
// import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

import '../../core/map_styles.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  //  static const platform = MethodChannel('com.example.speech_to_text');

  late FlutterTts flutterTts = FlutterTts();
  late stt.SpeechToText specch;

  bool isListening = false;

  String locationString = '';
  List<Marker> markers = [];
  Set<Polyline> polylines = {};
  GoogleMapController? gMapCtrl;
  StreamSubscription<Position>? positionStream;
  final List<String> keywords = [
    'address',
    'position',
    'location',
    'عنوان',
    'الموقع',
    'المكان'
  ];

  determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever ||
        permission == LocationPermission.denied) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

//handle stream position
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      sreamPosition();
    }
  }

  sreamPosition() {
    const LocationSettings locationSettings = LocationSettings(
        // accuracy: LocationAccuracy.high,
        // distanceFilter: 100,
        );
    positionStream =
        Geolocator.getPositionStream(locationSettings: locationSettings)
            .listen((Position? position) async {
      markers.add(Marker(
          markerId: const MarkerId('1'),
          position: LatLng(position!.latitude, position.longitude)));

      gMapCtrl!.animateCamera(CameraUpdate.newLatLng(
          LatLng(position.latitude, position.longitude)));

      getPlacemarks(position.latitude, position.longitude);

      setState(() {});
    });
  }

  Future<void> getPlacemarks(double lat, double long) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);

      if (placemarks.isNotEmpty) {
        double distanceInMeters =
            Geolocator.distanceBetween(lat, long, 31.0418471, 31.3802799);
// getRoute(lat1: lat,long1: long,lat2:31.0418471,long2:31.3802799  );
        polylines.add(
          Polyline(
            polylineId: PolylineId('line1'),
            visible: true,
            points: [LatLng(lat, long), LatLng(31.0418471, 31.3802799)],
            width: 5,
            color: Colors.blue,
          ),
        );

        locationString =
            '${placemarks[2].street ?? ''} ،${placemarks[2].street ?? ''}';
        locationString = "انت تبعد عن منزلك ${distanceInMeters ~/ 1000} كيلو" +
            ", مكانك الحالي شارع " +
            removeDuplicates(locationString);
        log(locationString);
      }

      // log("Your locationString for ($lat, $long) is: $locationString");
    } catch (e) {
      print("Error getting placemarks: $e");
    }
  }

  String removeDuplicates(String input) {
    List<String> substrings = input.split(' ،');
    String uniqueSubstrings = substrings.toSet().toList().join(' ،');
    RegExp regex = RegExp(r'\d{5,}');

    // Replace these numbers with an empty string
    return uniqueSubstrings.replaceAll(regex, '');
  }

  Future<void> speak(String text) async {
    await flutterTts.setLanguage('en-Us');
    await flutterTts.setPitch(1.0);
    await flutterTts.setSpeechRate(0.5);
    await flutterTts.speak(text);
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
    specch.listen(
      onResult: (result) {
        processResult(result.recognizedWords);
      },
    );
    setState(() {
      isListening = true;
    });
  }

  void processResult(String recognizedWords) async {
    log("specch: ================================");
    log(recognizedWords);
    // await speak(recognizedWords);
    for (String keyword in keywords) {
      if (recognizedWords.contains(keyword)) {
        // _detectedWord = keyword;
        await speak(locationString);
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

  Future<void> getRoute(
      {required lat1, required long1, required lat2, required long2}) async {
    final response = await http.get(
      Uri.parse(
          'https://maps.googleapis.com/maps/api/directions/json?origin=${lat1},${long1}&destination=${lat2},${long2}&key=AIzaSyBPNCF9Q4ra21ehIfxF8QZhv4ty6QarRYY'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final points = data['routes'][0]['overview_polyline']['points'];
      final decodedPoints = decodePolyline(points);

      polylines.add(Polyline(
        polylineId: PolylineId('route'),
        visible: true,
        points: decodedPoints,
        width: 5,
        color: Colors.blue,
      ));
    } else {
      throw Exception('Failed to load route');
    }
  }

  List<LatLng> decodePolyline(String encoded) {
    List<LatLng> polyline = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      polyline.add(LatLng((lat / 1E5), (lng / 1E5)));
    }

    return polyline;
  }

  @override
  void initState() {
    determinePosition();

    super.initState();
    initSpeech();
  }

  @override
  void dispose() {
    positionStream!.cancel();
    super.dispose();
  }

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(31.053329, 31.410263),
    zoom: 14.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        markers: markers.toSet(),
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
          gMapCtrl = controller;
          // ignore: deprecated_member_use
          gMapCtrl!.setMapStyle(MapStyle.blueComplex);
        },
        polylines: polylines,
      ),
    );
  }
}
