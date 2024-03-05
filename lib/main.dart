import 'package:flutter/material.dart';
import 'package:my_default_project/screens/demo_screens/goods_screens.dart';

import 'data/local/storage_repository.dart';

// class MyHttpOverrides extends HttpOverrides {
//   @override
//   HttpClient createHttpClient(SecurityContext? context) {
//     return super.createHttpClient(context)
//       ..badCertificateCallback = (X509Certificate cert, String host,
//           int port) => true;
//   }

 void main(){
    // WidgetsFlutterBinding.ensureInitialized();
    // StorageRepository();
    // HttpOverrides.global = new MyHttpOverrides();
    runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: false),
        home: GoodsScreens(),
      ),
    );
  }

