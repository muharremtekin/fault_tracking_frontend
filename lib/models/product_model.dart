import 'package:fault_tracking_frontend/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'product_model.g.dart';

@JsonSerializable()

///
class ProductModel extends _ProductModelBase
    with _$ProductModel
    implements BaseModel<ProductModel> {
  ///
  ProductModel();

  @override
  ProductModel fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

abstract class _ProductModelBase with Store {
  // yapım aşamasında
  @observable
  int? id;
  @observable
  DateTime? innstallationDate;
}
