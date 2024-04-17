// import 'package:flutter/animation.dart';
// import 'package:flutter/cupertino.dart';
//
// class AnimatedDialog extends StatefulWidget {
//   final Widget child;
//
//   const AnimatedDialog({Key? key, required this.child}) : super(key: key);
//
//   @override
//   _AnimatedDialogState createState() => _AnimatedDialogState();
// }
//
// class _AnimatedDialogState extends State<AnimatedDialog> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _scaleAnimation; // Or other animation
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 400)); // Adjust duration
//     _scaleAnimation = CurvedAnimation(parent: _controller!, curve: Curves.easeInOut);
//     _controller.forward();
//   }
//
//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: AnimatedTransition( // Choose animation widget (ScaleTransition, SlideTransition, etc.)
//         animation: _scaleAnimation, // Or corresponding animation
//         child: widget.child,
//       ),
//     );
//   }
// }
