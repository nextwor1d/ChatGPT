import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// messages
TextStyle messagesText(context) {
  return GoogleFonts.lato(textStyle: Theme.of(context).textTheme.titleMedium);
}

// times
TextStyle messagesTime(context) {
  return GoogleFonts.lato(textStyle: Theme.of(context).textTheme.bodySmall);
}

// title page / New Chat
TextStyle pageTitle(context) {
  return GoogleFonts.lato(textStyle: Theme.of(context).textTheme.titleLarge);
}

// chat lists
TextStyle chatsListTile(context) {
  return GoogleFonts.lato(textStyle: Theme.of(context).textTheme.titleMedium);
}

// change api
TextStyle changeAPI(context) {
  return GoogleFonts.lato(
      textStyle:
          Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.blue));
}
