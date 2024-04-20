import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart'; // Import PrettyQrCode
import '../../data/local/local_database.dart';
import 'dialog.dart';

class QRCodeScreen extends StatefulWidget {
  const QRCodeScreen({super.key});

  @override
  QRCodeScreenState createState() => QRCodeScreenState();
}

class QRCodeScreenState extends State<QRCodeScreen> {
  List<Map<String, dynamic>> _qrCodes = [];
  final TextEditingController _textController = TextEditingController(); // Text field controller

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
        title: Text('Scanned QR Codes'),
      ),
      body: ListView.builder(
        itemCount: _qrCodes.length,
        itemBuilder: (context, index) {
          final qrCode = _qrCodes[index];
          return ListTile(
            title: Text(qrCode[DatabaseHelper.columnQRCode]),
            subtitle: Text(qrCode[DatabaseHelper.columnScanTime]),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => _deleteQRCode(qrCode[DatabaseHelper.columnId]),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showQRCodeDialog(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> _showQRCodeDialog(BuildContext context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Generate QR Code'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _textController, // Use the controller
                decoration: InputDecoration(labelText: 'Enter text'),
              ),
              SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _generateQRCode(_textController.text); // Use controller text
                  },
                  child: Text('Generate'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  void _generateQRCode(String text) async {
    final qrCodeImage = await PrettyQr(
      data: text,
      size: 200,
      color: Colors.black,
      errorCorrectLevel: QrErrorCorrectLevel.H,
    ).toImage(color: Colors.white); // Convert QR code to image

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Generated QR Code'), // Dialog title
          content: Container(
            child: Image.memory(
              qrCodeImage.bytes, // Display the generated image
              width: 200,
              height: 200,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                final bytes = await qrCodeImage.toByteData(format: ImageByteFormat.png);
                if (bytes != null) {
                  await Share.share(
                    Uint8List.fromList(bytes.buffer.asUint8List()),
                    mimeTypes: ['image/png'],
                    subject: 'Generated QR Code', // Optional share subject
                  );
                }
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Share'),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }


}
