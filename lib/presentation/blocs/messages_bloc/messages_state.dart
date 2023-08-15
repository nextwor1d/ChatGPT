// ignore_for_file: must_be_immutable

part of 'messages_bloc.dart';

abstract class MessagesState extends Equatable {
  const MessagesState();

  @override
  List<Object> get props => [];
}

class MessagesInitialState extends MessagesState {}

class MessagesLoadedState extends MessagesState {
  final List chats;
  final int currentChatIndex;


  const MessagesLoadedState({
    required this.chats,
    required this.currentChatIndex,
  });

  @override
  List<Object> get props => [chats, currentChatIndex];
}
