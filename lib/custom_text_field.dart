import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final double height;
  final String text;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final bool? isPassword;

  const CustomTextField({
    super.key,
    required this.height,
    required this.text,
    this.validator,
    required this.controller,
    this.isPassword
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {

  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              widget.text,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),

        TextFormField(
          controller: widget.controller,
          validator: widget.validator,
          obscureText: widget.isPassword??
              _obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(12),
            //border: OutlineInputBorder(borderSide: BorderSide.none),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black45),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color(0xfff94a0c)),
            ),
            suffixIcon: widget.isPassword == true
                ? InkWell(
              onTap: () {
                _obscureText = !_obscureText;
                setState(() {});
              },
              child: Icon(_obscureText
                  ? CupertinoIcons.eye_fill
                  : CupertinoIcons.eye_slash_fill),
            )
                : null,
          ),
        ),
      ],
    );
  }
}