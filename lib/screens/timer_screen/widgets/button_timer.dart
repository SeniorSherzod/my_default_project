import 'package:flutter/material.dart';

Widget button({required String title, VoidCallback? onPressed}) {
  return Expanded(
      child: ElevatedButton(
      style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.amber),
  ),
  onPressed: onPressed,
  child: Text(
  title,
  style: const TextStyle(color: Colors.white),
  ),
  )

  );}