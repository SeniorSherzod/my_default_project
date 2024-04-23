import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_default_project/utils/images/app_images.dart';
import 'package:sqflite/sqflite.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher package
import 'package:pretty_qr_code/pretty_qr_code.dart';
import '../../data/local/local_database.dart';
import '../../utils/styles/app_text_style.dart';
import '../services/widgets.dart';

class QRCodeScreen extends StatefulWidget {
  const QRCodeScreen({Key? key}) : super(key: key);

  @override
  _QRCodeScreenState createState() => _QRCodeScreenState();
}

class _QRCodeScreenState extends State<QRCodeScreen> {
  List<Map<String, dynamic>> _qrCodes = [];
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _urlController = TextEditingController(); // Add URL controller

  @override
  void initState() {
    super.initState();
    _loadQRCodes();
  }

  Future<void> _loadQRCodes() async {
    final Database db = await DatabaseHelper.instance.database;
    final List<Map<String, dynamic>> qrCodes = await db.query(DatabaseHelper.table);
    setState(() {
      _qrCodes = qrCodes;
    });
  }

  Future<void> _deleteQRCode(int id) async {
    final Database db = await DatabaseHelper.instance.database;
    await db.delete(DatabaseHelper.table, where: '${DatabaseHelper.columnId} = ?', whereArgs: [id]);
    _loadQRCodes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scanned QR Codes', style: AppTextStyle.GilroyMedium.copyWith(color: Colors.white, fontSize: 25)),
      ),
      body: ListView.builder(
        itemCount: _qrCodes.length,
        itemBuilder: (context, index) {
          final qrCode = _qrCodes[index];
          return ListTile(
            leading: SvgPicture.asset(AppImages.qrcode),
            title: Text(qrCode[DatabaseHelper.columnQRCode], style: AppTextStyle.GilroyMedium.copyWith(color: Colors.white, fontSize: 20)),
            subtitle: Text(qrCode[DatabaseHelper.columnScanTime], style: AppTextStyle.GilroyMedium.copyWith(color: Colors.white, fontSize: 20)),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.white),
              onPressed: () => _deleteQRCode(qrCode[DatabaseHelper.columnId]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showQRCodeDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future<void> _showQRCodeDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Generate QR Code'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _textController,
                decoration: const InputDecoration(labelText: 'Enter text'),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _urlController, // Add URL text field
                decoration: const InputDecoration(labelText: 'Enter URL'),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _generateQRCode(_textController.text, _urlController.text); // Pass URL to generate QR code
                  },
                  child: const Text('Generate'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _generateQRCode(String text, String url) async {
    try {
      final qrCodeImage = await PrettyQr(
        data: text,
        size: 200,
        errorCorrectLevel: QrErrorCorrectLevel.H,
      );

      await WidgetSaverService.saveWidgetToGallery(
        context: context,
        widgetKey: GlobalKey(),
        fileId: text,
        bytes: qrCodeImage,
        url: url, // Pass URL when saving QR code
      );

      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Generated QR Code'),
            content: Container(
              child: Image.memory(
                qrCodeImage as Uint8List,
                width: 200,
                height: 200,
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () async {
                  await WidgetSaverService.saveWidgetToGallery(
                    context: context,
                    widgetKey: GlobalKey(),
                    fileId: text,
                    bytes: qrCodeImage,
                    url: url, // Pass URL when saving QR code
                  );
                  Navigator.of(context).pop();
                },
                child: const Text('Save to Gallery'),
              ),
              TextButton(
                onPressed: () async {
                  await WidgetSaverService.openWidgetAsImage(
                    context: context,
                    widgetKey: GlobalKey(),
                    fileId: text,
                    bytes: qrCodeImage,
                  );
                  Navigator.of(context).pop();
                },
                child: const Text('Share'),
              ),
              TextButton(
                onPressed: () async {
                  // Launch URL
                  // Make sure to handle if the URL is empty or null
                  if (url.isNotEmpty) {
                    await launch(url);
                  }
                },
                child: const Text('Launch URL'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('Close'),
              ),
            ],
          );
        },
      );
        } catch (e) {
      print('Error generating QR code: $e');
    }
  }
}
