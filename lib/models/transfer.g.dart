// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferData _$TransferDataFromJson(Map<String, dynamic> json) {
  return $checkedNew('TransferData', json, () {
    final val = TransferData(
      vali: $checkedConvert(json, 'vali', (v) => v as String),
      data: $checkedConvert(json, 'data', (v) => v as String),
    );
    $checkedConvert(json, 'version', (v) => val.version = v as String);
    return val;
  });
}

Map<String, dynamic> _$TransferDataToJson(TransferData instance) =>
    <String, dynamic>{
      'vali': instance.vali,
      'data': instance.data,
      'version': instance.version,
    };
