import 'package:hive/hive.dart';
import 'address.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class Event extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(2)
  DateTime startOfEvent;
  @HiveField(3)
  DateTime endOfEvent;
  @HiveField(4)
  Address location;

  Event({this.name, this.startOfEvent, this.endOfEvent, this.location});

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
  Map<String, dynamic> toJson() => _$EventToJson(this);
}
