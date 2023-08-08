// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel()
  ..id = json['id'] as int?
  ..innstallationDate = json['innstallationDate'] == null
      ? null
      : DateTime.parse(json['innstallationDate'] as String);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'innstallationDate': instance.innstallationDate?.toIso8601String(),
    };

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductModel on _ProductModelBase, Store {
  late final _$idAtom = Atom(name: '_ProductModelBase.id', context: context);

  @override
  int? get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int? value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$innstallationDateAtom =
      Atom(name: '_ProductModelBase.innstallationDate', context: context);

  @override
  DateTime? get innstallationDate {
    _$innstallationDateAtom.reportRead();
    return super.innstallationDate;
  }

  @override
  set innstallationDate(DateTime? value) {
    _$innstallationDateAtom.reportWrite(value, super.innstallationDate, () {
      super.innstallationDate = value;
    });
  }

  @override
  String toString() {
    return '''
id: ${id},
innstallationDate: ${innstallationDate}
    ''';
  }
}
