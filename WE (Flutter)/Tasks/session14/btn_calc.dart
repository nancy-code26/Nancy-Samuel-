import 'package:flutter/material.dart';

Widget btn1({
  required String btnNameText,
  required Function() action,
}) {
  return Expanded(
    child: Padding(
      // قللنا الـ padding عشان الأزرار متكنش عملاقة ومتباعدة أوي
      padding: const EdgeInsets.all(5.0),
      child: MaterialButton(
        // لون بينك هادي ولطيف
        color: const Color(0xfff8bbd0),
        height: 60, // صغرنا الارتفاع عشان يبقى حجمه سمارت
        elevation: 2,
        // عملنا زوايا مدورة (Rounded) ومش حادة
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        onPressed: action,
        child: Text(
          btnNameText,
          style: const TextStyle(
            fontSize: 22, // مقاس خط مناسب للحجم الجديد
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ),
    ),
  );
}