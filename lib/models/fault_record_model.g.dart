// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fault_record_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FaultRecordModel _$FaultRecordModelFromJson(Map<String, dynamic> json) =>
    FaultRecordModel(
      id: json['id'] as int,
      status: json['status'] as bool,
      title: json['title'] as String,
      description: json['description'] as String,
      images:
          (json['images'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$FaultRecordModelToJson(FaultRecordModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'title': instance.title,
      'description': instance.description,
      'images': instance.images,
    };
