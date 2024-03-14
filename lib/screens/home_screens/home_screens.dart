import 'dart:math';

import 'package:flutter/material.dart';
import 'package:my_default_project/screens/home_screens/snow_person.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Flag"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SnowManScreen()),
              );
            },
            child: Text("next"),
          )
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              color: Colors.blue,
              child: CustomPaint(
                size: const Size(300, 200),
                painter: UzbekistanFlagPainter(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UzbekistanFlagPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint bluePaint = Paint()..color = Color(0xFF0072B5);
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height / 3), bluePaint);

    Paint whitePaint = Paint()..color = Colors.white;
    canvas.drawRect(Rect.fromLTWH(0, size.height / 3, size.width, size.height / 3), whitePaint);

    Paint greenPaint = Paint()..color = Color(0xFF00A859);
    canvas.drawRect(Rect.fromLTWH(0, 2 * size.height / 3, size.width, size.height / 3), greenPaint);

    Paint redPaint = Paint()..color = Colors.red.shade800..strokeWidth = 5;
    canvas.drawLine(Offset(0, size.height / 3), Offset(size.width, size.height / 3), redPaint);
    canvas.drawLine(Offset(0, size.height / 1.5), Offset(size.width, size.height / 1.5), redPaint);

    // Draw moon
    drawMoon(canvas, size.width / 3 - 30, size.height / 6, size.height / 15, Colors.white);
  }

  void drawMoon(Canvas canvas, double centerX, double centerY, double radius, Color color) {
    Path path = Path();
    path.addArc(Rect.fromCircle(center: Offset(30 + 10 , 30), radius: radius ), pi /2, pi);
    path.close();

    Paint paint = Paint()..color = color;
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

void main() {
  runApp(MaterialApp(
    home: HomeScreen(),
  ));
}
