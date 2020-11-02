// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'person.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonAdapter extends TypeAdapter<Person> {
  @override
  final int typeId = 0;

  @override
  Person read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Person(
      firstName: fields[0] as String,
      lastName: fields[1] as String,
      address: fields[2] as Address,
      emailAddress: fields[3] as String,
      telephoneNumber: fields[4] as String,
      birthday: fields[5] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, Person obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.firstName)
      ..writeByte(1)
      ..write(obj.lastName)
      ..writeByte(2)
      ..write(obj.address)
      ..writeByte(3)
      ..write(obj.emailAddress)
      ..writeByte(4)
      ..write(obj.telephoneNumber)
      ..writeByte(5)
      ..write(obj.birthday);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Person _$PersonFromJson(Map<String, dynamic> json) {
  return $checkedNew('Person', json, () {
    final val = Person(
      firstName: $checkedConvert(json, 'firstName', (v) => v as String),
      lastName: $checkedConvert(json, 'lastName', (v) => v as String),
      address: $checkedConvert(
          json,
          'address',
          (v) =>
              v == null ? null : Address.fromJson(v as Map<String, dynamic>)),
      emailAddress: $checkedConvert(json, 'emailAddress', (v) => v as String),
      telephoneNumber:
          $checkedConvert(json, 'telephoneNumber', (v) => v as String),
      birthday: $checkedConvert(json, 'birthday',
          (v) => v == null ? null : DateTime.parse(v as String)),
    );
    return val;
  });
}

Map<String, dynamic> _$PersonToJson(Person instance) => <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'address': instance.address,
      'emailAddress': instance.emailAddress,
      'telephoneNumber': instance.telephoneNumber,
      'birthday': instance.birthday?.toIso8601String(),
    };
