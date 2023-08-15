// ignore_for_file: must_be_immutable

part of 'messages_bloc.dart';

abstract class MessagesEvent extends Equatable {
  const MessagesEvent();

  @override
  List<Object> get props => [];
}

// Load
class LoadMessages extends MessagesEvent {}

// Send Message
class SendMessage extends MessagesEvent {
  final String messageText;
  final String messageTime;
  final bool isQuestion;

  const SendMessage({
    required this.messageText,
    required this.messageTime,
    required this.isQuestion,
  });

  @override
  List<Object> get props => [messageText, messageTime, isQuestion];
}

// Stream Message
class StreamMessage extends MessagesEvent {
  final String messageText;

  const StreamMessage({
    required this.messageText,
  });

  @override
  List<Object> get props => [messageText];
}

// Remove Message
class RemoveMessage extends MessagesEvent {
  final int index;

  const RemoveMessage(this.index);

  @override
  List<Object> get props => [index];
}

// Add New Chat
class AddNewChat extends MessagesEvent {}

// Delete Chat
class DeleteChat extends MessagesEvent {
  final int index;

  const DeleteChat({
    required this.index,
  });

  @override
  List<Object> get props => [index];
}

// Clear Chat
class ClearChat extends MessagesEvent {
  final int index;

  const ClearChat({
    required this.index,
  });

  @override
  List<Object> get props => [index];
}

// Switch Chat
class SwitchChat extends MessagesEvent {
  final int index;

  const SwitchChat({
    required this.index,
  });

  @override
  List<Object> get props => [index];
}
