import 'package:json_annotation/json_annotation.dart';

part 'transfer.g.dart';

@JsonSerializable(explicitToJson: true, checked: true)
class TransferData {
  String vali;
  String data;
  String version;

  TransferData({this.vali, this.data});
  factory TransferData.fromJson(Map<String, dynamic> json) =>
      _$TransferDataFromJson(json);
  Map<String, dynamic> toJson() => _$TransferDataToJson(this);
}
