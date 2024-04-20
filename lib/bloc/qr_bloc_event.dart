abstract class QRScannerEvent {}

class ScanQRCodeEvent extends QRScannerEvent {}

class ManualInputQRCodeEvent extends QRScannerEvent {
  final String qrCode;

  ManualInputQRCodeEvent(this.qrCode);
}