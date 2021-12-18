// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'art.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ArtAdapter extends TypeAdapter<Art> {
  @override
  final int typeId = 0;

  @override
  Art read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Art(
      fields[0] as String,
      fields[1] as String,
      fields[4] as String,
      fields[5] as String,
      fields[13] as String,
      fields[6] as String,
      fields[7] as String,
      fields[8] as String,
      fields[9] as String,
      fields[10] as String,
      fields[11] as String,
      fields[12] as String,
    )..description = fields[14] as String;
  }

  @override
  void write(BinaryWriter writer, Art obj) {
    writer
      ..writeByte(15)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.beginDate)
      ..writeByte(3)
      ..write(obj.endDate)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.author)
      ..writeByte(6)
      ..write(obj.artistBio)
      ..writeByte(7)
      ..write(obj.artistBeginDate)
      ..writeByte(8)
      ..write(obj.artistEndDate)
      ..writeByte(9)
      ..write(obj.creditLine)
      ..writeByte(10)
      ..write(obj.artistNationality)
      ..writeByte(11)
      ..write(obj.medium)
      ..writeByte(12)
      ..write(obj.dimensions)
      ..writeByte(13)
      ..write(obj.primaryImage)
      ..writeByte(14)
      ..write(obj.description);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ArtAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
