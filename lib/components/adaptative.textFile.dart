import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AdaptativeTextField extends StatelessWidget {
  final String label;
  final TextEditingController textEditingControler;
  final Function(String) onSubmit;
  final TextInputType inputType;

  AdaptativeTextField({
    required this.label,
    required this.textEditingControler,
    required this.onSubmit,
    this.inputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: CupertinoTextField(
              placeholder: label,
              controller: textEditingControler,
              onSubmitted: onSubmit,
              keyboardType: inputType,
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 6),
            ),
          )
        : TextField(
            decoration: InputDecoration(labelText: label),
            controller: textEditingControler,
            onSubmitted: onSubmit,
            keyboardType: inputType,
          );
  }
}
