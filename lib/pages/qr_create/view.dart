import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../widgets/text_form_field.dart';

class QrCreateView extends StatefulWidget {
  const QrCreateView({Key? key}) : super(key: key);

  @override
  State<QrCreateView> createState() => _QrCreateViewState();
}

class _QrCreateViewState extends State<QrCreateView> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 2.0,
        title: const Text('QR Code Generator'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                QrImage(
                  data: controller.text,
                  size: 200,
                  foregroundColor: Colors.white,
                ),
                const SizedBox(
                  height: 100,
                ),
                CustomTextFormField(
                  label: 'Make your Qr',
                  controller: controller,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.done,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
