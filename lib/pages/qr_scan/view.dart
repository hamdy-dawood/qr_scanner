import 'dart:io';

import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import '../../widgets/flash_camera.dart';
import '../../widgets/result.dart';

class QrScanView extends StatefulWidget {
  const QrScanView({Key? key}) : super(key: key);

  @override
  State<QrScanView> createState() => _QrScanViewState();
}

class _QrScanViewState extends State<QrScanView> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 2.0,
        title: const Text('QR Code Scanner'),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          buildQrView(context),
          Positioned(
            bottom: 50,
            child: Row(
              children: [
                result != null
                    ? Container(
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                          onPressed: () {
                            setState(() {
                              FlutterClipboard.copy('${result!.code}').then(
                                (value) =>
                                    ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Center(
                                      child: Text('Copied'),
                                    ),
                                  ),
                                ),
                              );
                            });
                          },
                          icon: const Icon(
                            Icons.copy,
                            size: 22,
                          ),
                        ))
                    : const SizedBox(),
                BuildResult(
                  color: result != null ? Colors.white : Colors.white30,
                  text: result != null ? '${result!.code}' : 'Scan a code!',
                ),
              ],
            ),
          ),
          Positioned(
            top: 20,
            child: BuildControlButtons(
              flashPressed: () async {
                await controller?.toggleFlash();
                setState(() {});
              },
              cameraPressed: () async {
                await controller?.flipCamera();
                setState(() {});
              },
              flashIcon: FutureBuilder<bool?>(
                future: controller?.getFlashStatus(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return Icon(
                      snapshot.data! ? Icons.flash_on : Icons.flash_off,
                      size: 30,
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              cameraIcon: FutureBuilder(
                future: controller?.getCameraInfo(),
                builder: (context, snapshot) {
                  if (snapshot.data != null) {
                    return const Icon(
                      Icons.switch_camera,
                      size: 30,
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  QRView buildQrView(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          cutOutSize: MediaQuery.of(context).size.width * 0.7,
          borderRadius: 10.0,
          borderColor: const Color(0xff005Bc1),
          borderWidth: 10.0,
          borderLength: 20.0,
        ),
      );

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((barcode) {
      setState(() {
        result = barcode;
      });
    });
  }
}
