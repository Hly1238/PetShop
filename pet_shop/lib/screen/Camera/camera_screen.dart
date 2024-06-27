import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late List<CameraDescription> cameras;
  CameraController? cameraController;
  bool isCameraReady = false;

  // ? Switch camera
  int direction = 0;
  bool _isFrontCamera = false;

  // ? Capture
  bool isCapturing = false;

  // ? Flash
  bool isFlashOn = false;

  // ? Focus
  Offset? _focusPoint;

  // ? Zoom
  double _currentZoom = 1.0;

  // ? File
  File? _captureImage;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  void initializeCamera() async {
    cameras = await availableCameras();
    cameraController = CameraController(
      cameras[direction],
      ResolutionPreset.high,
      enableAudio: false,
    );
    cameraController!.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {
        isCameraReady = true;
      });
    }).catchError((error) {
      print('Failed to initialize camera: &error');
    });
  }

  @override
  void dispose() {
    super.dispose();
    cameraController?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!isCameraReady) {
      return Container();
    }
    return SafeArea(
      child: Scaffold(
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.black,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {
                              _toggleFlashLight();
                            },
                            child: isFlashOn == false
                                ? Icon(
                                    Icons.flash_off_outlined,
                                    color: Colors.white,
                                  )
                                : Icon(
                                    Icons.flash_on,
                                    color: Colors.white,
                                  ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () {},
                            child: Icon(
                              Icons.qr_code_scanner_rounded,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Positioned.fill(
                          top: 50,
                          bottom: _isFrontCamera == false ? 0 : 150,
                          child: AspectRatio(
                            aspectRatio: cameraController!.value.aspectRatio,
                            child: CameraPreview(cameraController!),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                CameraPreview(cameraController!),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        direction = direction == 0 ? 1 : 0;
                        initializeCamera();
                      });
                    },
                    child: button(
                        Icons.flip_camera_ios_outlined, Alignment.bottomLeft)),
                GestureDetector(
                    onTap: () {
                      cameraController!.takePicture().then((XFile file) {
                        if (mounted) {
                          if (file != null) {
                            print('Picture stores to ${file.path}');
                          }
                        }
                      });
                    },
                    child: button(
                        Icons.camera_alt_outlined, Alignment.bottomCenter))
              ],
            );
          },
        ),
      ),
    );
  }

  Widget button(IconData icon, Alignment alignment) {
    return Align(
      alignment: alignment,
      child: Container(
        height: 50,
        width: 50,
        margin: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(2, 2),
              blurRadius: 20,
            )
          ],
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  void _toggleFlashLight() {
    if (isFlashOn) {
      cameraController!.setFlashMode(FlashMode.off);
      setState(() {
        isFlashOn = false;
      });
    } else {
      cameraController!.setFlashMode(FlashMode.torch);
      setState(() {
        isFlashOn = true;
      });
    }
  }
}
