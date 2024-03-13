import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_default_project/screens/animation_screens/screen_six.dart';
import 'package:my_default_project/utils/images/app_images.dart';

import '../../utils/colors/app_colors.dart';
import '../../utils/styles/app_text_style.dart';

class FifthScreen extends StatefulWidget {
  @override
  _FifthScreenState createState() =>
      new _FifthScreenState();
}

class _FifthScreenState extends State<FifthScreen>
    with TickerProviderStateMixin {

  double _size = 150;

  Widget _buildChild() {
    return Container(
      width: _size,
      height: _size,
      // color: Colors.teal,
      decoration: BoxDecoration(
      ),
      child: Image.asset(AppImages.sprite_can),
    );
  }

  Widget _buildAnimatedSize() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: AnimatedSize(
        duration: const Duration(seconds: 2),
        // alignment: Alignment(-0.75, -0.75),
        // curve: Curves.easeInCubic,
        child: _buildChild(),
      ),
    );
  }

  Widget _buildSizeAnimationWithAnimatedContainer() {
    return AnimatedContainer(
      width: _size,
      height: _size,
      color: Colors.teal,
      duration: const Duration(seconds: 2),
      child: _buildChild(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Size changer'),
        actions: [ TextButton(onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ColorChangeScreen()),
          );
        },
            child: Text("Next",style: AppTextStyle.GilroyThin.copyWith(color:AppColors.c_1A72DD ),))],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildAnimatedSize(),
            // _buildSizeAnimationWithAnimatedContainer(),
            ElevatedButton(
              child: Text('Change Size'),
              onPressed: () {
                setState(() {
                  _size = _size == 150 ? 250 : 150;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}