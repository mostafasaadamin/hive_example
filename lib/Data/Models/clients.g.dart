// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clients.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GetApprovedDetailsObjctAdapter
    extends TypeAdapter<GetApprovedDetailsObjct> {
  @override
  final int typeId = 0;

  @override
  GetApprovedDetailsObjct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GetApprovedDetailsObjct(
      aPPRVD: fields[0] as int?,
      aPPRVDDATE: fields[1] as String?,
      aPPRVDDESC: fields[2] as String?,
      aPPRVDNM: fields[3] as String?,
      dOCDATE: fields[4] as String?,
      dOCDESC: fields[5] as String?,
      dOCNO: fields[6] as int?,
      dOCSER: fields[7] as String?,
      dOCTYP: fields[8] as int?,
      dOCTYPNM: fields[9] as String?,
      lVLNM: fields[10] as String?,
      lVLNO: fields[11] as int?,
      oRDRNO: fields[12] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, GetApprovedDetailsObjct obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.aPPRVD)
      ..writeByte(1)
      ..write(obj.aPPRVDDATE)
      ..writeByte(2)
      ..write(obj.aPPRVDDESC)
      ..writeByte(3)
      ..write(obj.aPPRVDNM)
      ..writeByte(4)
      ..write(obj.dOCDATE)
      ..writeByte(5)
      ..write(obj.dOCDESC)
      ..writeByte(6)
      ..write(obj.dOCNO)
      ..writeByte(7)
      ..write(obj.dOCSER)
      ..writeByte(8)
      ..write(obj.dOCTYP)
      ..writeByte(9)
      ..write(obj.dOCTYPNM)
      ..writeByte(10)
      ..write(obj.lVLNM)
      ..writeByte(11)
      ..write(obj.lVLNO)
      ..writeByte(12)
      ..write(obj.oRDRNO);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GetApprovedDetailsObjctAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
