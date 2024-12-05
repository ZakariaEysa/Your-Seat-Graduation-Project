// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GoogleUserModelAdapter extends TypeAdapter<GoogleUserModel> {
  @override
  final int typeId = 1;

  @override
  GoogleUserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GoogleUserModel(
      displayName: fields[0] as String,
      email: fields[1] as String,
      password: fields[2] as String?,
      dateOfBirth: fields[3] as String?,
      image: fields[4] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, GoogleUserModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.displayName)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.password)
      ..writeByte(3)
      ..write(obj.dateOfBirth)
      ..writeByte(4)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GoogleUserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
