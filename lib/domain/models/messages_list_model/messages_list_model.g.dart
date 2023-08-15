// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MessagesListModelAdapter extends TypeAdapter<MessagesListModel> {
  @override
  final int typeId = 1;

  @override
  MessagesListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MessagesListModel(
      (fields[0] as List).cast<dynamic>(),
    );
  }

  @override
  void write(BinaryWriter writer, MessagesListModel obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.messages);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessagesListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
