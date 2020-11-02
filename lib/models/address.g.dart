// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddressAdapter extends TypeAdapter<Address> {
  @override
  final int typeId = 1;

  @override
  Address read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Address(
      street: fields[0] as String,
      houseNumber: fields[1] as String,
      localAreaCode: fields[2] as String,
      city: fields[3] as String,
      country: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Address obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.street)
      ..writeByte(1)
      ..write(obj.houseNumber)
      ..writeByte(2)
      ..write(obj.localAreaCode)
      ..writeByte(3)
      ..write(obj.city)
      ..writeByte(4)
      ..write(obj.country);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddressAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Address _$AddressFromJson(Map<String, dynamic> json) {
  return $checkedNew('Address', json, () {
    final val = Address(
      street: $checkedConvert(json, 'street', (v) => v as String),
      houseNumber: $checkedConvert(json, 'houseNumber', (v) => v as String),
      localAreaCode: $checkedConvert(json, 'localAreaCode', (v) => v as String),
      city: $checkedConvert(json, 'city', (v) => v as String),
      country: $checkedConvert(json, 'country', (v) => v as String),
    );
    return val;
  });
}

Map<String, dynamic> _$AddressToJson(Address instance) => <String, dynamic>{
      'street': instance.street,
      'houseNumber': instance.houseNumber,
      'localAreaCode': instance.localAreaCode,
      'city': instance.city,
      'country': instance.country,
    };
