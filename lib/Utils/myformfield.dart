import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class MyFormField extends StatelessWidget {
  final String hintText;
  final String LabelText;
  final bool obscure;
  final Widget prefixIcon;
  final Widget suffixIcon;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  MyFormField({
    Key? key,
    required this.hintText,
    required this.LabelText,
    required this.obscure,
    required this.prefixIcon,
    required this.suffixIcon,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        obscureText: obscure,
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            gapPadding: 10,
          ),
          hintText: hintText,
          labelText: LabelText,
          suffix: suffixIcon,
          prefix: prefixIcon,
          fillColor: Colors.grey.shade700,
        ),
      ),
    );
  }
}
