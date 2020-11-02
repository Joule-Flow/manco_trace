import 'package:hive/hive.dart';

part 'event.g.dart';

@HiveType(typeId: 2)
class Event {
  @HiveField(0)
  String name;
  @HiveField(1)
  bool active;
  @HiveField(2)
  DateTime startOfEvent;
  @HiveField(3)
  DateTime endOfEvent;

  Event({this.name, this.active, this.startOfEvent, this.endOfEvent});
}
