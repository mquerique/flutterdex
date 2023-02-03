import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final TextEditingController? controller;

  const InputField({
    this.controller,
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
      ),
    );
  }
}
