import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:manco_tracer/models/event.dart';
import 'person.dart';

part 'contact.g.dart';

@HiveType(typeId: 3)
@JsonSerializable()
class Contact extends HiveObject {
  @HiveField(0)
  Person person;
  @HiveField(1)
  DateTime checkIn;
  @HiveField(2)
  DateTime checkOut;
  @HiveField(3)
  Event event;

  Contact({this.person, this.checkIn, this.checkOut, this.event});
  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);
  Map<String, dynamic> toJson() => _$ContactToJson(this);
}
