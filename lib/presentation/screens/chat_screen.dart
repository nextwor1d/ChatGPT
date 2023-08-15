import 'package:chatgpt/config/theme/colors.dart';
import 'package:chatgpt/config/theme/icons.dart';
import 'package:chatgpt/presentation/widgets/messages_listtile.dart';
import 'package:chatgpt/presentation/widgets/permanent_message.dart';
import 'package:chatgpt/presentation/widgets/spinkit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../config/theme/fonts.dart';
import '../blocs/messages_bloc/messages_bloc.dart';
import '../widgets/input_textfield.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessagesBloc, MessagesState>(
      builder: (context, state) {
        if (state is MessagesLoadedState) {
          var chats = state.chats[state.currentChatIndex];
          return Column(
            children: [
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ListView(
                      shrinkWrap: true,
                      reverse: true,
                      children: [
                        ...List.generate(
                          chats.length,
                          (index) => MessagesListTile(
                            messageText: SelectableText(chats[index][0],
                                style: messagesText(context)),
                            messageTime: chats[index][1],
                            copy: () => Clipboard.setData(ClipboardData(
                                text: chats[index][0].toString())),
                            color: chats[index][2]
                                ? Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? questionDark
                                    : questionLight
                                : Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? answerDark
                                    : answerLight,
                            icon: chats[index][2] ? questionIcon : AnswerIcon(),
                            remove: () => context.read<MessagesBloc>()
                              ..add(RemoveMessage(index)),
                          ),
                        ),
                        PermanentMessage(),
                      ],
                    ),
                    chats.isNotEmpty
                        ? chats[0][0] == ''
                            ? Positioned(bottom: 18, left: 55, child: spinkit)
                            : SizedBox.shrink()
                        : SizedBox.shrink()
                  ],
                ),
              ),
              InputTextField(),
            ],
          );
        } else {
          return Center(child: spinkit);
        }
      },
    );
  }
}
