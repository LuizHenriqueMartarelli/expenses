import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final Function onPressed;

  AdaptativeButton({required this.label, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(child: Text(label), onPressed: () => onPressed)
        : ElevatedButton(
            child: Text(
              label,
              style:
                  TextStyle(color: Theme.of(context).textTheme.button?.color),
            ),
            onPressed: () => onPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith(
                (states) => Theme.of(context).primaryColor,
              ),
            ),
          );
  }
}
