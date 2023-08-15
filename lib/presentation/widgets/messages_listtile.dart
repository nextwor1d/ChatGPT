import 'popupmenu.dart';
import '../../config/theme/fonts.dart';
import 'package:flutter/material.dart';

class MessagesListTile extends StatelessWidget {
  final Widget icon;
  final Widget messageText;
  final String messageTime;
  final VoidCallback copy;
  final VoidCallback remove;
  final Color color;

  const MessagesListTile({
    Key? key,
    required this.icon,
    required this.messageText,
    required this.messageTime,
    required this.copy,
    required this.remove,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListTile(
          horizontalTitleGap: 0,
          tileColor: color,
          leading: icon,
          title: Padding(
            padding: EdgeInsets.only(right: 18, top: 5),
            child: messageText,
          ),
          subtitle: Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(
              messageTime,
              textAlign: TextAlign.end,
              style: messagesTime(context),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: PopupMenuButton<String>(
            padding: EdgeInsets.zero,
            shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25))),
            itemBuilder: (context) => [
              buildPopupMenuItem('Copy', Icons.copy, copy),
              buildPopupMenuItem(
                  'Delete', Icons.delete_outline_rounded, remove),
            ],
          ),
        ),
      ],
    );
  }
}
