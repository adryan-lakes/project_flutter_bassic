// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_post_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PostAdapter extends TypeAdapter<Post> {
  @override
  final int typeId = 0;

  @override
  Post read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Post(
      nama: fields[0] as String,
      caption: fields[1] as String,
      like: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Post obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.nama)
      ..writeByte(1)
      ..write(obj.caption)
      ..writeByte(2)
      ..write(obj.like);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PostAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
