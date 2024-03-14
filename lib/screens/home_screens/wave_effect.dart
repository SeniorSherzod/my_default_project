import 'dart:ui';

import 'package:flutter/material.dart';

class WaveEffect extends StatefulWidget {
  const WaveEffect({Key? key}) : super(key: key);

  @override
  State<WaveEffect> createState() => _WaveEffectState();
}

class _WaveEffectState extends State<WaveEffect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("drawPath quadraticBezierTo"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.zero,
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey, // Shadow color
                      blurRadius: 10, // Spread Radius
                      offset: Offset(0, 0), // Offset from the top-left corner
                    ),
                  ],
                ),
                child: CustomPaint(
                  size: const Size(300, 300),
                  painter: MyPainter(),
                ),
              ),

              const SizedBox(
                height: 50,
              ),

            ],
          ),
        ));
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.red;
    paint.strokeWidth = 2.0;

    var path = Path();

    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.134, size.height * 0.9,
        size.width * 0.334, size.height * 0.71);
    path.quadraticBezierTo(
        size.width * 0.42, size.height * 0.985, size.width, size.height * 0.55);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}