import 'package:flutter/material.dart';

class AnswerIcon extends StatelessWidget {
  const AnswerIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'lib/data/dataresources/local/gpt.png',
      height: 30,
      color: Theme.of(context).brightness == Brightness.dark
          ? Colors.white
          : Colors.black,
    );
  }
}

Icon sendMessageIcon = Icon(Icons.send_rounded);

Icon questionIcon = Icon(Icons.account_circle, size: 32);

Icon deleteChatIcon = Icon(Icons.delete_outline_rounded, size: 25);

Icon clearChatIcon = Icon(Icons.cleaning_services_outlined, size: 25);

Icon chatListIcon = Icon(Icons.chat_outlined, size: 30);
