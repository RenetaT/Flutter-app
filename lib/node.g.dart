// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'node.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NodeAdapter extends TypeAdapter<Node> {
  @override
  final int typeId = 0;

  @override
  Node read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Node(
      fields[0] as int,
      fields[1] as String,
      fields[2] as String,
      fields[3] as int,
      fields[4] as String,
      fields[5] as int,
      fields[6] as String,
      fields[7] as int,
      isFinal: fields[8] as bool,
      image: fields[9] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Node obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.iD)
      ..writeByte(1)
      ..write(obj.question)
      ..writeByte(2)
      ..write(obj.optionAText)
      ..writeByte(3)
      ..write(obj.nextIdA)
      ..writeByte(4)
      ..write(obj.optionBText)
      ..writeByte(5)
      ..write(obj.nextIdB)
      ..writeByte(6)
      ..write(obj.optionCText)
      ..writeByte(7)
      ..write(obj.nextIdC)
      ..writeByte(8)
      ..write(obj.isFinal)
      ..writeByte(9)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is NodeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
