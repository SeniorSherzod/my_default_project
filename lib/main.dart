import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_default_project/screens/tab_box/tab_box.dart';

import 'bloc/qr_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QRScannerBloc(), // Provide the QRScannerBloc
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My App',
        theme: ThemeData(
          appBarTheme: AppBarTheme(backgroundColor: Colors.black12),
          scaffoldBackgroundColor: Colors.black12,
          primarySwatch: Colors.blue,
        ),
      home: BottomNavigatorScreen(),
      ),
    );
  }
}
