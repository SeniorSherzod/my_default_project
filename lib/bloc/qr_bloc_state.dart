abstract class QRScannerState {}

class InitialState extends QRScannerState {}

class ScannedQRCodeState extends QRScannerState {
  final String qrCode;
  final DateTime scanTime;

  ScannedQRCodeState(this.qrCode, this.scanTime);
}

class ErrorState extends QRScannerState {
  final String errorMessage;

  ErrorState(this.errorMessage);
}