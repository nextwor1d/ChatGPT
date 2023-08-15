import 'package:chatgpt/config/theme/colors.dart';
import 'package:chatgpt/config/theme/icons.dart';
import 'package:flutter/material.dart';

import '../../config/theme/fonts.dart';

class PermanentMessage extends StatelessWidget {
  const PermanentMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 0,
      tileColor: Theme.of(context).brightness == Brightness.dark
          ? answerDark
          : answerLight,
      leading: AnswerIcon(),
      title: Padding(
        padding: EdgeInsets.only(right: 18, top: 5),
        child: Text('Hello! How can I assist you today?'),
      ),
      subtitle: Padding(
        padding: EdgeInsets.only(top: 5),
        child: Text('', textAlign: TextAlign.end, style: messagesTime(context)),
      ),
    );
  }
}


