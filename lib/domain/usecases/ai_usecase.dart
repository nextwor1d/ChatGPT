import 'dart:async';

import 'package:chatgpt/presentation/blocs/messages_bloc/messages_bloc.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void openAI(BuildContext context, String input) {
  TextEditingController output = TextEditingController();

  Stream<OpenAIStreamChatCompletionModel> chatStream =
      OpenAI.instance.chat.createStream(
    model: "gpt-3.5-turbo",
    messages: [
      OpenAIChatCompletionChoiceMessageModel(
        content: input,
        role: OpenAIChatMessageRole.user,
      ),
    ],
  );

  context.read<MessagesBloc>().add(SendMessage(
      messageText: input,
      messageTime: DateTime.now().toString().substring(0, 16),
      isQuestion: true));

  context.read<MessagesBloc>().add(SendMessage(
      messageText: '',
      messageTime: DateTime.now().toString().substring(0, 16),
      isQuestion: false));

  chatStream.listen(
    (streamChatCompletion) {
      output.text +=
          streamChatCompletion.choices.first.delta.content.toString();
      context.read<MessagesBloc>().add(StreamMessage(
            messageText: output.text,
          ));
    },
    onError: (error) {
      context.read<MessagesBloc>().add(StreamMessage(
            messageText: error.toString(),
          ));
    },
  );
}
