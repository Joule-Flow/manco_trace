import 'package:hive/hive.dart';
import 'address.dart';
import 'package:json_annotation/json_annotation.dart';

part 'person.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class Person {
  @HiveField(0)
  String firstName;
  @HiveField(1)
  String lastName;
  @HiveField(2)
  Address address;

  @HiveField(3)
  String emailAddress;
  @HiveField(4)
  String telephoneNumber;

  @HiveField(5)
  DateTime birthday;

  Person(
      {this.firstName,
      this.lastName,
      this.address,
      this.emailAddress,
      this.telephoneNumber,
      this.birthday});

  factory Person.fromJson(Map<String, dynamic> json) => _$PersonFromJson(json);
  Map<String, dynamic> toJson() => _$PersonToJson(this);
}
