import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class Address {
  @HiveField(0)
  String street;
  @HiveField(1)
  String houseNumber;
  @HiveField(2)
  String localAreaCode;
  @HiveField(3)
  String city;
  @HiveField(4)
  String country;

  Address(
      {this.street,
      this.houseNumber,
      this.localAreaCode,
      this.city,
      this.country});
  factory Address.fromJson(Map<String, dynamic> json) =>
      _$AddressFromJson(json);
  Map<String, dynamic> toJson() => _$AddressToJson(this);
}
