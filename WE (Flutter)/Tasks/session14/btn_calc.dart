import 'package:flutter/material.dart';

Widget btn1({
  required String btnNameText,
  required Function() action,
}) {
  return Expanded(
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: MaterialButton(
        color: const Color(0xfff8bbd0),
        height: 60,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        onPressed: action,
        child: Text(
          btnNameText,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
    ),
  );
}