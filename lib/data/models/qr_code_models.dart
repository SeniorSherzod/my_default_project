class QRCodeModel {
  int? id;
  String qrCode;
  DateTime scanTime;

  QRCodeModel({this.id, required this.qrCode, required this.scanTime});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'qr_code': qrCode,
      'scan_time': scanTime.toIso8601String(),
    };
  }

  factory QRCodeModel.fromMap(Map<String, dynamic> map) {
    return QRCodeModel(
      id: map['id'],
      qrCode: map['qr_code'],
      scanTime: DateTime.parse(map['scan_time']),
    );
  }
}
