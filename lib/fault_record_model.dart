// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:typed_data';

class FaultRecordModel {
  final int id;
  final String title;
  final String description;
  final List<Uint8List> images;
  FaultRecordModel({
    required this.title,
    required this.description,
    required this.images,
    required this.id,
  });
}
