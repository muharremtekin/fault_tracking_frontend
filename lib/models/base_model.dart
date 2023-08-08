// ignore: public_member_api_docs
abstract class BaseModel<T> {
  // ignore: public_member_api_docs
  Map<String, dynamic> toJson();
  // ignore: public_member_api_docs
  T fromJson(Map<String, dynamic> json);
}
