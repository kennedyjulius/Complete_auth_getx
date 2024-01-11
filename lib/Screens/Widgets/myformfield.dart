import 'package:flutter/material.dart';

class MyFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final bool obscureText;
  final Widget suffixIcon;
  final Widget prefixIcon;
  final String? Function(String?)? validator;
  const MyFormField({super.key, 
  required this.labelText, 
  required this.hintText, 
  required this.controller, 
  required this.obscureText, 
  required this.suffixIcon, 
  required this.prefixIcon, 
  this.validator
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Container(
        child: TextFormField(
          obscureText: obscureText,
          validator: validator,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            prefixIcon: prefixIcon,
            suffix: suffixIcon,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            )
          ),  
        ),
      ),
    );
  }
}
