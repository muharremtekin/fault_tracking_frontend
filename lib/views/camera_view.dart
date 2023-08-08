// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';


// class CameraView extends StatefulWidget {
//   const CameraView({super.key});

//   @override
//   State<CameraView> createState() => _CameraViewState();
// }

// class _CameraViewState extends State<CameraView> {
//   late CameraController _controller;
//   late Future<void> initializeControllerFuture;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     // TODO: Düzelt
//     _controller =
//         CameraController(CameraList.cameras!.first, ResolutionPreset.max);
//     initializeControllerFuture = _controller.initialize();
//   }

//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     _controller.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return _buildCameraView();
//   }

//   Scaffold _buildCameraView() {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Kamera sayfası'),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: FutureBuilder<void>(
//                 future: initializeControllerFuture,
//                 builder: (context, snapshot) {
//                   if (snapshot.connectionState == ConnectionState.done) {
//                     // If the Future is complete, display the preview.
//                     return CameraPreview(
//                       _controller,
//                     );
//                   } else {
//                     // Otherwise, display a loading indicator.
//                     return const Center(child: CircularProgressIndicator());
//                   }
//                 },
//               ),
//             ),
//             _takeAPictureButton(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _takeAPictureButton() {
//     return ElevatedButton(
//       onPressed: () async {
//         await _controller.takePicture();
//       },
//       child: const Text('Fotoğraf çek'),
//     );
//   }
// }
