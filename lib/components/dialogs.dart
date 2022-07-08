import 'package:flutter/material.dart';

class Dialogs {
  const Dialogs(this.context);
  final BuildContext context;
  
  Future<void> showSimpleDialog(String message) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
