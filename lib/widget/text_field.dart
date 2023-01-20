import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EditText extends StatelessWidget {
  const EditText({Key? key, required this.message, required this.controller})
      : super(key: key);

  final String message;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      child: TextFormField(
        controller: controller,
        inputFormatters: [
          FilteringTextInputFormatter.allow(RegExp("[0-9.-]")),
        ],
        maxLength: 10,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          labelText: message,
        ),
      ),
    );
  }
}
