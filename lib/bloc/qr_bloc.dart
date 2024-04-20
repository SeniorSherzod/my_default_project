import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_default_project/bloc/qr_bloc_event.dart';
import 'package:my_default_project/bloc/qr_bloc_state.dart';

import '../data/local/local_database.dart';

class QRScannerBloc extends Bloc<QRScannerEvent, QRScannerState> {
  QRScannerBloc() : super(InitialState());

  @override
  Stream<QRScannerState> mapEventToState(QRScannerEvent event) async* {
    if (event is ScanQRCodeEvent) {
      // Implement code scanning logic here
      String scannedCode = "Scanned QR code";
      await _saveScannedQRCode(scannedCode);
      yield ScannedQRCodeState(scannedCode, DateTime.now());
    } else if (event is ManualInputQRCodeEvent) {
      // Implement manual input logic here
      String qrCode = event.qrCode;
      await _saveScannedQRCode(qrCode);
      yield ScannedQRCodeState(qrCode, DateTime.now());
    }
  }

  Future<void> _saveScannedQRCode(String qrCode) async {
    Map<String, dynamic> row = {
      DatabaseHelper.columnQRCode: qrCode,
      DatabaseHelper.columnScanTime: DateTime.now().toString(),
    };
    await DatabaseHelper.instance.insertQRCode(row);
  }
}
