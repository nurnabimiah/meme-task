import 'package:flutter/material.dart';

InputDecoration search_textformfiled_inputdec() {
  return InputDecoration(
    contentPadding: EdgeInsets.only(top: 0, bottom: 0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(15),
      ),
      borderSide: BorderSide.none,
    ),
    suffixIcon: Align(
      widthFactor: 0.5,
      //heightFactor: 5.0,
      child: Icon(
        Icons.search,
      ),
    ),
    filled: true,
    fillColor: Colors.white,
    hintText: "  Find Mems",
    hintStyle: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
  );
}