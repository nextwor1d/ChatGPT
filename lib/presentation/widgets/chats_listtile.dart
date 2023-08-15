import 'package:flutter/material.dart';

import '../../config/theme/fonts.dart';
import '../../config/theme/icons.dart';

class ChatsListTile extends StatelessWidget {
  final int index;
  final VoidCallback onDelete;
  final VoidCallback onTap;
  const ChatsListTile({
    super.key,
    required this.index,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 20, left: 20, bottom: 10),
      child: ListTile(
        dense: true,
        contentPadding: EdgeInsets.only(left: 15, right: 8, bottom: 3),
        horizontalTitleGap: 10,
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: Theme.of(context).brightness == Brightness.dark
                    ? Colors.white10
                    : Colors.black12),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        leading: Padding(padding: EdgeInsets.only(top: 5), child: chatListIcon),
        title: Text('Chat ${index + 1}', style: chatsListTile(context)),
        trailing: IconButton(
          icon: index == 0 ? clearChatIcon : deleteChatIcon,
          onPressed: onDelete,
        ),
        onTap: onTap,
      ),
    );
  }
}
