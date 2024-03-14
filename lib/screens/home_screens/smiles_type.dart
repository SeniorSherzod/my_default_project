import 'dart:math';
import 'dart:ui';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:my_default_project/screens/home_screens/wave_effect.dart';
import 'package:my_default_project/utils/colors/app_colors.dart';

class EmojiScreen extends StatefulWidget {
  const EmojiScreen({Key? key}) : super(key: key);

  @override
  State<EmojiScreen> createState() => _EmojiScreenState();
}

class _EmojiScreenState extends State<EmojiScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Emoji Painter: "),
        actions: [
          TextButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WaveEffect()),
            );
          },
              child: Text("next"))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 50,),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.transparent
              ),
              child: CustomPaint(
                size: const Size(300, 400),
                painter: EmojiPainter1(),
              ),
            ),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.transparent
              ),
              child: CustomPaint(
                size: const Size(300, 400),
                painter: EmojiPainter2(),
              ),
            ),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.transparent
              ),
              child: CustomPaint(
                size: const Size(300, 400),
                painter: EmojiPainter3(),
              ),
            ),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.transparent
              ),
              child: CustomPaint(
                size: const Size(300, 400),
                painter: EmojiPainter4(),
              ),
            ),
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.transparent
              ),
              child: CustomPaint(
                size: const Size(300, 400),
                painter: EmojiPainter5(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmojiPainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Draw black circle around head
    Paint circlePaint = Paint()..color = Colors.red..style = PaintingStyle.stroke..strokeWidth = 2.0;
    canvas.drawCircle(Offset(size.width / 2, size.height * 0.15), size.width * 0.25, circlePaint);
    // Draw eyes
    Paint eyePaint = Paint()..color = Colors.red..strokeWidth = 2.0;
    canvas.drawLine(Offset(size.width * 0.35, size.height * 0.10), Offset(size.width * 0.45, size.height * 0.15), eyePaint);
    canvas.drawLine(Offset(size.width * 0.65, size.height * 0.10), Offset(size.width * 0.55, size.height * 0.15), eyePaint);


    // Draw mouth
    Paint mouthPaint = Paint()..color = Colors.red..strokeWidth = 2.0..style = PaintingStyle.fill;
    canvas.drawArc(Rect.fromCenter(center: Offset(100 , 60) , width : 40,height: 30), pi, pi, false, mouthPaint);



  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
class EmojiPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Draw black circle around head
    Paint circlePaint = Paint()..color = Colors.yellow..style = PaintingStyle.stroke..strokeWidth = 2.0;
    canvas.drawCircle(Offset(size.width / 2, size.height * 0.15), size.width * 0.25, circlePaint);
    Paint eyePaint = Paint()
      ..color = Colors.yellow
      ..strokeWidth = 2.0;
    canvas.drawLine(Offset(size.width * 0.35, size.height * 0.10), Offset(size.width * 0.40, size.height * 0.15), eyePaint);
    canvas.drawLine(Offset(size.width * 0.65, size.height * 0.10), Offset(size.width * 0.60, size.height * 0.15), eyePaint);

    Paint mouthPaint = Paint()..color = Colors.yellow..strokeWidth = 2.0..style = PaintingStyle.stroke;
    canvas.drawArc(Rect.fromCenter(center: Offset(100 , 40) , width : 40,height: 30), 0, pi, false, mouthPaint);





  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
class EmojiPainter3 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Draw black circle around head
    Paint circlePaint = Paint()..color = Colors.orange..style = PaintingStyle.stroke..strokeWidth = 2.0;
    canvas.drawCircle(Offset(size.width / 2, size.height * 0.15), size.width * 0.25, circlePaint);
    // Draw eyes
    Paint eyePaint = Paint()..color = Colors.orange;
    canvas.drawCircle(Offset(size.width * 0.35, size.height * 0.10), size.width * 0.02, eyePaint);
    canvas.drawCircle(Offset(size.width * 0.65, size.height * 0.10), size.width * 0.02, eyePaint);

    Paint mouthPaint = Paint()..color = Colors.orange..strokeWidth = 2.0..style = PaintingStyle.stroke;
    canvas.drawArc(Rect.fromCenter(center: Offset(100 , 60) , width : 40,height: 10), pi, pi, false, mouthPaint);




  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
class EmojiPainter4 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Draw black circle around head
    Paint circlePaint = Paint()..color = Colors.green..style = PaintingStyle.stroke..strokeWidth = 5.0;
    canvas.drawCircle(Offset(size.width / 2, size.height * 0.15), size.width * 0.25, circlePaint);
    // Draw eyes
    Paint eyePaint = Paint()..color = Colors.green..strokeWidth=5;
    canvas.drawCircle(Offset(size.width * 0.35, size.height * 0.10), size.width * 0.02, eyePaint);
    canvas.drawCircle(Offset(size.width * 0.65, size.height * 0.10), size.width * 0.02, eyePaint);

    Paint mouthPaint = Paint()..color = Colors.green..strokeWidth = 5.0..style = PaintingStyle.stroke;
    canvas.drawArc(Rect.fromCenter(center: Offset(100 , 50) , width : 50,height: 30), 0, pi, false, mouthPaint);




  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
class EmojiPainter5 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Draw black circle around head
    Paint circlePaint = Paint()..color = Colors.blue..style = PaintingStyle.stroke..strokeWidth = 5.0;
    canvas.drawCircle(Offset(size.width / 2, size.height * 0.15), size.width * 0.25, circlePaint);
    // Draw eyes
    Paint eyePaint = Paint()..color = Colors.blue..strokeWidth=5;
    canvas.drawCircle(Offset(size.width * 0.35, size.height * 0.10), size.width * 0.02, eyePaint);
    canvas.drawCircle(Offset(size.width * 0.65, size.height * 0.10), size.width * 0.02, eyePaint);

    Paint mouthPaint = Paint()..color = Colors.blue..strokeWidth = 5.0..style = PaintingStyle.stroke;
    canvas.drawArc(Rect.fromCenter(center: Offset(100 , 60) , width : 40,height: 5), pi, pi, false, mouthPaint);




  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}


