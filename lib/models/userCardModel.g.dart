// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userCardModel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 1;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      ism: fields[1] as String,
      kartaRaqam: fields[2] as String,
      komp: fields[3] as String,
      amalQilishMuddati: fields[4] as String,
      id: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(1)
      ..write(obj.ism)
      ..writeByte(2)
      ..write(obj.kartaRaqam)
      ..writeByte(3)
      ..write(obj.komp)
      ..writeByte(4)
      ..write(obj.amalQilishMuddati)
      ..writeByte(5)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
