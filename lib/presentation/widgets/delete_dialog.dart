// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/messages_bloc/messages_bloc.dart';

Future<dynamic> DeleteDialog(
    BuildContext context, MessagesLoadedState state, int index) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(25))),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
                onPressed: () {
                  if (index == 0) {
                    context.read<MessagesBloc>().add(ClearChat(index: index));
                    Navigator.of(context).pop();
                  } else {
                    context.read<MessagesBloc>().add(DeleteChat(index: index));
                    Navigator.of(context).pop();
                  }
                },
                child: Text('Delete', style: TextStyle(color: Colors.red)))
          ],
          title: Text('Delete Chat'),
          content: Text('Are you sure you want to delete this chat ?'));
    },
  );
}
