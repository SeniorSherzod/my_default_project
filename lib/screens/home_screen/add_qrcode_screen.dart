import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class QrScannerScreen extends StatefulWidget {
  const QrScannerScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QrScannerScreenState();
}

class _QrScannerScreenState extends State<QrScannerScreen> {
  late QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  late String qrData;

  @override
  void initState() {
    super.initState();
    qrData = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scan QR Code")),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
              overlay: QrScannerOverlayShape(
                borderColor: Colors.green,
                borderRadius: 16,
                borderLength: 50,
                borderWidth: 10,
                cutOutSize: MediaQuery.of(context).size.width - 32,
              ),
              onPermissionSet: (ctrl, p) {
                if (!p) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('No Permission')),
                  );
                }
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _saveQRCodeToDatabase(qrData);
          setState(() {
            // Update the UI with the saved QR code data
            showDialog(
              context: context,
              builder: (BuildContext ctx) {
                return AlertDialog(
                  title: Text('QR Code Saved'),
                  content: Text(qrData),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(ctx).pop();
                      },
                      child: Text('Close'),
                    ),
                  ],
                );
              },
            );
          });
        },
        child: Icon(Icons.save),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen(
          (scanData) {
        controller.pauseCamera();
        setState(() {
          qrData = scanData.code!;
        });
      },
    );
  }

  Future<void> _saveQRCodeToDatabase(String qrData) async {
    Database database = await _initDatabase();
    Map<String, dynamic> row = {
      'qr_code': qrData,
      'scan_time': DateTime.now().toIso8601String(),
    };
    await database.insert('scanned_qr_codes', row);
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'qr_codes.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE scanned_qr_codes (
            _id INTEGER PRIMARY KEY,
            qr_code TEXT NOT NULL,
            scan_time TEXT NOT NULL
          )
          ''');
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
