import 'package:chatgpt/data/repositories/messages_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'messages_event.dart';
part 'messages_state.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  ChatsRepository chatsRepository = ChatsRepository();

  MessagesBloc() : super(MessagesInitialState()) {
    // Load
    on<LoadMessages>((event, emit) async {
      await Future.delayed(Duration(seconds: 1));
      emit(MessagesLoadedState(
        currentChatIndex: 0,
        chats: chatsRepository.loadChats(),
      ));
    });

    // Send Message
    on<SendMessage>((event, emit) {
      if (state is MessagesLoadedState) {
        final state = this.state as MessagesLoadedState;

        final updatedChats = List.from(state.chats);
        updatedChats[state.currentChatIndex] = [
          [event.messageText, event.messageTime, event.isQuestion],
          ...updatedChats[state.currentChatIndex],
        ];

        emit(MessagesLoadedState(
          currentChatIndex: state.currentChatIndex,
          chats: updatedChats,
        ));

        chatsRepository.updatedChats(updatedChats);
      }
    });

    on<StreamMessage>((event, emit) {
      if (state is MessagesLoadedState) {
        final state = this.state as MessagesLoadedState;

        final updatedChats = List.from(state.chats);
        updatedChats[state.currentChatIndex] = [
          [
            event.messageText,
            updatedChats[state.currentChatIndex][0][1],
            false
          ],
          ...updatedChats[state.currentChatIndex].sublist(1),
        ];

        emit(MessagesLoadedState(
          currentChatIndex: state.currentChatIndex,
          chats: updatedChats,
        ));

        chatsRepository.updatedChats(updatedChats);
      }
    });

    // Remove Message
    on<RemoveMessage>((event, emit) {
      if (state is MessagesLoadedState) {
        final state = this.state as MessagesLoadedState;

        final updatedChats = List.from(state.chats);
        final chatMessages = List.from(updatedChats[state.currentChatIndex]);
        chatMessages.removeAt(event.index);
        updatedChats[state.currentChatIndex] = chatMessages;

        emit(MessagesLoadedState(
          currentChatIndex: state.currentChatIndex,
          chats: updatedChats,
        ));

        chatsRepository.updatedChats(updatedChats);
      }
    });

    // Add New Chat
    on<AddNewChat>((event, emit) {
      if (state is MessagesLoadedState) {
        final state = this.state as MessagesLoadedState;

        final updatedChats = List.from(state.chats)..add([]);

        emit(MessagesLoadedState(
          currentChatIndex: state.currentChatIndex,
          chats: updatedChats,
        ));

        chatsRepository.updatedChats(updatedChats);
      }
    });

    // Switch Chat
    on<SwitchChat>((event, emit) {
      if (state is MessagesLoadedState) {
        final state = this.state as MessagesLoadedState;

        emit(MessagesLoadedState(
          currentChatIndex: event.index,
          chats: state.chats,
        ));
      }
    });

    // Delete Chat
    on<DeleteChat>((event, emit) {
      if (state is MessagesLoadedState) {
        final state = this.state as MessagesLoadedState;

        final updatedChats = List.from(state.chats)..removeAt(event.index);

        // Last index
        final updatedCurrentChatIndex =
            state.currentChatIndex >= updatedChats.length
                ? updatedChats.length - 1
                : state.currentChatIndex;

        emit(MessagesLoadedState(
          currentChatIndex: updatedCurrentChatIndex,
          chats: updatedChats,
        ));

        chatsRepository.updatedChats(updatedChats);
      }
    });

    // Clear Chat
    on<ClearChat>((event, emit) {
      if (state is MessagesLoadedState) {
        final state = this.state as MessagesLoadedState;

        final updatedChats = List.from(state.chats);
        updatedChats[state.currentChatIndex] = [];

        emit(MessagesLoadedState(
          currentChatIndex: state.currentChatIndex,
          chats: updatedChats,
        ));

        chatsRepository.updatedChats(updatedChats);
      }
    });
  }
}
