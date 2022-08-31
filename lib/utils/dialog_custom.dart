import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

dialogCustom({required BuildContext context, required String title, required String content}) {
  Platform.isIOS
      ? showCupertinoModalPopup<void>(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
            title: Text('$title'),
            content: Text('$content'),
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(
                isDestructiveAction: true,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('close'),
              )
            ],
          ),
        )
      : showCupertinoModalPopup<void>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text('$title'),
            content: Text('$content'),
            actions: [
              MaterialButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'close',
                  style: TextStyle(color: Colors.grey),
                ),
              )
            ],
          ),
        );
}
