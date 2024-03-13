import 'package:flutter/material.dart';
import 'package:my_default_project/screens/animation_screens/fontsize_screen.dart';
import 'package:my_default_project/utils/colors/app_colors.dart';

import '../../utils/styles/app_text_style.dart';


class AlignmetChangeScreen extends StatefulWidget {
  const AlignmetChangeScreen({Key? key}) : super(key: key);

  @override
  _AlignmetChangeScreenState createState() => _AlignmetChangeScreenState();
}

class _AlignmetChangeScreenState extends State<AlignmetChangeScreen> {
  bool _isInitialValue = true;
  Alignment _alignment = Alignment(-1.0, -1.0);

  void _toggleValues() {
    setState(() {
      _isInitialValue = !_isInitialValue;
      _alignment = _isInitialValue ? Alignment(-1.0, -1.0) : Alignment(1.0, 1.0);
    });
  }

  void _changeAlignment() {
    setState(() {
      _alignment = _alignment == Alignment(-1.0, -1.0) ? Alignment(1.0, -1.0) : Alignment(-1.0, -1.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alignment Change Animation'),
        actions: [
          TextButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FontSizeChangeScreen()),
            );
          },
              child: Text("Next",style: AppTextStyle.GilroyThin.copyWith(color:AppColors.c_1A72DD ),))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _toggleValues,
              child: AnimatedContainer(
                duration: const Duration(seconds: 2),
                color: AppColors.c_53b175,
                width: 300,
                height: 300,
                alignment: _alignment,
                child: const Text(
                  'Alignment',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: _toggleValues,
              child: Text(
                'Change Alignment',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
