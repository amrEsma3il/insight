// import 'dart:developer';

// // ignore: library_prefixes
// import 'package:socket_io_client/socket_io_client.dart' as IO;

// class SocketService {
//   IO.Socket? socket;

//   void initializeSocket() {
//     socket = IO.io('http://192.168.1.3:5000', <String, dynamic>{
//       'transports': ['websocket'],
//        'autoConnect': true,
//     });

//     socket!.on('connect', (_) {
//       log('connected to server');
//     });

//     socket!.on('disconnect', (_) {
//       log('disconnected from server');
//     });
//   }

//   void sendFrame(String type,String? lang) {
//     if (type=="ocr")
// {    socket!.emit('frame_info', {"info":{"type":type,"lang":lang}});
// }else{socket!.emit('frame_info', {"info":{"type":type}});} 


//  }

//   void receiveData(Function(String) onFrameReceived) {
//     socket!.on('receive_data', (data) {
//       onFrameReceived(data['result']);
//     });
//   }
// }
