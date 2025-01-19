import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController textController;
  final String? Function(String?) validateFunction;
  final String label;
  final IconButton? suffixIcon;
  final bool isObscure;
  const InputField(
      {super.key,
      required this.textController,
      required this.label,
      required this.validateFunction,
      this.isObscure = false,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure,
      validator: validateFunction,
      controller: textController,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        label: Text(label),
      ),
    );
  }
}
