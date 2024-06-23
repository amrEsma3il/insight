import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:insight/core/const.dart';

class ShowCamera extends StatefulWidget {
  @override _ShowCameraState createState() => _ShowCameraState(); }
class _ShowCameraState extends State<ShowCamera> {
  late VlcPlayerController _videoPlayerController;
  @override
  void initState() {
    super.initState();
    _videoPlayerController = VlcPlayerController.network(
      'http://192.168.1.3:5000/video_stream',
      hwAcc: HwAcc.full,
      autoPlay: true,
      options: VlcPlayerOptions(),
    );
  }
  @override
  void dispose() async {
    super.dispose();
    await _videoPlayerController.stopRendererScanning();
    await _videoPlayerController.dispose(); }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: Palette.skyBlue,
        title: const Text("الكاميرا"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
             width: MediaQuery.of(context).size.width,
        height:MediaQuery.of(context).size.height ,
        color: Colors.black,
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 195,
            child: VlcPlayer( controller: _videoPlayerController,
              aspectRatio: 6/5,
              placeholder: Center(child: CircularProgressIndicator()),
            ),
          ),
        ],
      ),
    );
  }
}