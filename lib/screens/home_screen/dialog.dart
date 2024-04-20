import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class PrettyQrCodeDisplay extends StatelessWidget {
  final String data;

  const PrettyQrCodeDisplay({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PrettyQr(
        data: data,
        size: 200, // Color of the QR code
        errorCorrectLevel: QrErrorCorrectLevel.H, // Error correction level
      ),
    );
  }
}



