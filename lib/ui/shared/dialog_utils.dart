import 'package:flutter/material.dart';

Future<bool?> showConfirmDialog(BuildContext context, String message) { 
  return showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      title: const Text('Bạn có chắc chắn?'),
      content: Text(message),
      actions: <Widget>[
        TextButton(
          child: const Text('Không đồng ý'),
          onPressed: () {
            Navigator.of(ctx).pop(false);
          },
        ),
        TextButton(
          child: const Text('Đồng ý'),
          onPressed: () {
            Navigator.of(ctx).pop(true);
          },
        ),
      ],
    ),
  );
}
