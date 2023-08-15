import 'package:flutter/material.dart';

PopupMenuItem<String> buildPopupMenuItem(
    String text, IconData icon, VoidCallback onTap) {
  return PopupMenuItem<String>(
    value: text,
    onTap: onTap,
    child: ListTile(
      title: Text(text),
      leading: Icon(icon),
      horizontalTitleGap: -5,
      contentPadding: EdgeInsets.zero,
    ),
  );
}
