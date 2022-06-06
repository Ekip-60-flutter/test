import 'package:flutter/material.dart';

const Color cardColor = Color(0xFFfCf4EA);

bottomSheet(BuildContext context, Widget child){
  return showModalBottomSheet(
    backgroundColor: cardColor,
    shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(36.0))),
    isScrollControlled: true,
    isDismissible: false,
    enableDrag: false,
    context: context,
    builder: (context) {
      return Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: child,
      );
    }
  );
}