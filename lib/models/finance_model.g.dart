// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'finance_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FinanceModelAdapter extends TypeAdapter<FinanceModel> {
  @override
  final int typeId = 0;

  @override
  FinanceModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FinanceModel(
      value: fields[0] as int,
      category: fields[1] as String,
      type: fields[2] as FinanceType,
      date: fields[3] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, FinanceModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.value)
      ..writeByte(1)
      ..write(obj.category)
      ..writeByte(2)
      ..write(obj.type)
      ..writeByte(3)
      ..write(obj.date);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FinanceModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FinanceTypeAdapter extends TypeAdapter<FinanceType> {
  @override
  final int typeId = 1;

  @override
  FinanceType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return FinanceType.income;
      case 1:
        return FinanceType.expense;
      default:
        return FinanceType.income;
    }
  }

  @override
  void write(BinaryWriter writer, FinanceType obj) {
    switch (obj) {
      case FinanceType.income:
        writer.writeByte(0);
        break;
      case FinanceType.expense:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FinanceTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
