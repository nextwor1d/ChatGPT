import '../../domain/models/messages_list_model/messages_list_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ChatsRepository {
  Box chatsBox = Hive.box('chatsBox');

  List loadChats() {
    var messagesListModel =
        MessagesListModel(chatsBox.get('chats', defaultValue: [[]]));
    chatsBox.put('chats', messagesListModel.messages);
    return messagesListModel.messages;
  }

  updatedChats(dynamic message) {
    chatsBox.put('chats', message);
  }
}
