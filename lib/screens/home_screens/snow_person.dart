import 'dart:math';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:my_default_project/screens/home_screens/smiles_type.dart';

class SnowManScreen extends StatefulWidget {
  const SnowManScreen({Key? key}) : super(key: key);

  @override
  State<SnowManScreen> createState() => _SnowManScreenState();
}

class _SnowManScreenState extends State<SnowManScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Custom Painter: Snowman"),
        actions: [
          TextButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EmojiScreen()),
            );
          },
              child: Text("next"))
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: CustomPaint(
                size: const Size(300, 400),
                painter: SnowmanPainter(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SnowmanPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {

    Paint bodyPaint = Paint()..color = Colors.white;
    canvas.drawCircle(Offset(size.width / 2, size.height * 0.70), size.width * 0.15, bodyPaint);
    canvas.drawCircle(Offset(size.width / 2, size.height * 0.50), size.width * 0.20, bodyPaint);
    canvas.drawCircle(Offset(size.width / 2, size.height * 0.30), size.width * 0.25, bodyPaint);
    canvas.drawCircle(Offset(size.width / 2, size.height * 0.15), size.width * 0.10, bodyPaint);

    Paint headPaint = Paint()..color = Colors.white;
    canvas.drawCircle(Offset(size.width / 2, size.height * 0.15), size.width * 0.10, headPaint);

    Paint circlePaint = Paint()..color = Colors.black..style = PaintingStyle.stroke..strokeWidth = 2.0;
    canvas.drawCircle(Offset(size.width / 2, size.height * 0.15), size.width * 0.25, circlePaint);

    canvas.drawCircle(Offset(size.width / 2, size.height * 0.65), size.width * 0.4, circlePaint);


    Paint eyePaint = Paint()..color = Colors.black;
    canvas.drawCircle(Offset(size.width * 0.35, size.height * 0.10), size.width * 0.02, eyePaint);
    canvas.drawCircle(Offset(size.width * 0.65, size.height * 0.10), size.width * 0.02, eyePaint);

    Paint mouthPaint = Paint()..color = Colors.black..strokeWidth = 2.0..style = PaintingStyle.stroke;
    canvas.drawArc(Rect.fromCenter(center: Offset(150 , 90) , width : 70,height: 50), 0, pi, false, mouthPaint);


    Path nosePath = Path();
    nosePath.moveTo(size.width * 0.48, size.height * 0.15);
    nosePath.lineTo(size.width * 0.9, size.height * 0.20);
    nosePath.lineTo(size.width * 0.45, size.height * 0.20);
    nosePath.close();
    Paint nosePaint = Paint()..color = Colors.orange;
    canvas.drawPath(nosePath, nosePaint);

    Paint buttonPaint = Paint()..color = Colors.black;
    canvas.drawCircle(Offset(size.width * 0.50, size.height * 0.40), size.width * 0.04, buttonPaint);
    canvas.drawCircle(Offset(size.width * 0.50, size.height * 0.60), size.width * 0.04, buttonPaint);
    canvas.drawCircle(Offset(size.width * 0.50, size.height * 0.80), size.width * 0.04, buttonPaint);


    Paint armPaint = Paint()..color = Colors.brown..strokeWidth = 8.0;
    canvas.drawLine(Offset(size.width * 0.1, size.height * 0.18), Offset(size.width * 0.25, size.height * 0.50), armPaint);
    canvas.drawLine(Offset(size.width * 0.9, size.height * 0.18), Offset(size.width * 0.75, size.height * 0.50), armPaint);

    Paint fingerPaint = Paint()..color = Colors.black..strokeWidth = 5;
    canvas.drawLine(Offset(size.width * 0.15, size.height * 0.18), Offset(size.width * 0.1, size.height * 0.27), fingerPaint);
    canvas.drawLine(Offset(size.width * 0.25, size.height * 0.50), Offset(size.width * 0.22, size.height * 0.53), fingerPaint);
    canvas.drawLine(Offset(size.width * 0.85, size.height * 0.2), Offset(size.width * 0.9, size.height * 0.27), fingerPaint);
    canvas.drawLine(Offset(size.width * 0.75, size.height * 0.50), Offset(size.width * 0.78, size.height * 0.53), fingerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

void main() {
  runApp(MaterialApp(
    home: SnowManScreen(),
  ));
}
