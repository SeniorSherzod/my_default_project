// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_default_project/data/local/local_database.dart';
import 'package:my_default_project/utils/styles/app_text_style.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../data/models/qr_code_models.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  _HistoryScreenState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  late List<QRCodeModel> _historyData;

  @override
  void initState() {
    super.initState();
    _loadHistoryData();
  }

  Future<void> _loadHistoryData() async {
    final databaseHelper = DatabaseHelper.instance;
    final List<Map<String, dynamic>> rawData = await databaseHelper.queryAllRows();
    _historyData = rawData.map((map) => QRCodeModel.fromMap(map)).toList();
    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
      ),
      body: _historyData.isEmpty
          ? Center(
        child: Text('No history data available'),
      )
          : ListView.builder(
        itemCount: _historyData.length,
        itemBuilder: (context, index) {
          final historyItem = _historyData[index];
          return ListTile(
            // leading: Column(
            //   QrImage(
            //     data: historyItem.qrCode,
            //     version: QrVersions.auto,
            //     size: 48.0,
            //   ),
            // ),
            title: Text(historyItem.qrCode,style: AppTextStyle.GilroyMedium.copyWith(color: Colors.white,fontSize: 20),),
            subtitle: Text(historyItem.scanTime.toIso8601String(),style: AppTextStyle.GilroyMedium.copyWith(color: Colors.white,fontSize: 20),),
            onTap: () {
              // Implement navigation to details screen or any other action
            },
          );
        },
      ),
    );
  }
}

