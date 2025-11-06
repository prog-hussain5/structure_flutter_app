import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final String? hint;
  final String? label;
  final bool obscure;
  const TextFormFieldWidget({
    super.key,
    this.controller,
    this.hint,
    this.label,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) => TextFormField(
        controller: controller,
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: hint,
          labelText: label,
          border: const OutlineInputBorder(),
        ),
      );
}
