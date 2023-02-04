import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController? controller;
  final String? labelText;
  final String? hintText;
  final String? Function(String?)? validator;

  const InputField({
    this.controller,
    this.labelText,
    this.hintText,
    this.validator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: const EdgeInsets.only(bottom: 8),
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(
            height: 0.01,
          ),
          hintText: hintText,
          alignLabelWithHint: true,
          errorStyle: const TextStyle(
            fontSize: 12,
            height: 0.4,
          ),
        ),
        validator: validator,
      ),
    );
  }
}
