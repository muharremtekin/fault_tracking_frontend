// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fault_tracking_frontend/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fault_record_model.g.dart'; 

@JsonSerializable()
class FaultRecordModel extends BaseModel<FaultRecordModel> {
  final int id;
  final bool status;
  final String title;
  final String description;
  final List<String> images;

  FaultRecordModel({
    required this.id,
    required this.status,
    required this.title,
    required this.description,
    required this.images,
  });

  @override
  FaultRecordModel fromJson(Map<String, dynamic> json) =>
      _$FaultRecordModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$FaultRecordModelToJson(this);
}
