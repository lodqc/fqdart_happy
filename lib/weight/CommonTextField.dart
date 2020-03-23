import 'package:flutter/material.dart';

TextField UnderlineTextField(String hint, TextEditingController cntroller,
    ValueChanged<String> onChanged,
    {Widget prefixIcon,Widget suffixIcon}) {
  return TextField(
    autofocus: true,
    controller: cntroller,
    onChanged: onChanged,
    keyboardType: TextInputType.phone,
    maxLength: 11,
    decoration: InputDecoration(
        counterText: "",
        hintText: hint,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        enabledBorder: UnderlineInputBorder(
          //未选中时候的颜色
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: Color(0xffe5e5e5),
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          //选中时外边框颜色
          borderRadius: BorderRadius.circular(5.0),
          borderSide: BorderSide(
            color: Color(0xffe5e5e5),
          ),
        ),
        hintStyle: TextStyle(color: Color(0xffcccccc), fontSize: 16)),
  );
}
