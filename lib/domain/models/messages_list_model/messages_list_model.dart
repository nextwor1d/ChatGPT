import 'package:hive_flutter/hive_flutter.dart';

part 'messages_list_model.g.dart';

@HiveType(typeId: 1)
class MessagesListModel extends HiveObject {
  @HiveField(0)
  List messages;

  MessagesListModel(this.messages);
}
