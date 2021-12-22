import 'package:json_annotation/json_annotation.dart';

part 'company_model.g.dart';
@JsonSerializable()
class CompanyModel {
  @JsonKey(name: 'name')
  String name;
  @JsonKey(name: 'catchPhrase')
  String catchPhrase;
  @JsonKey(name: 'bs')
  String bs;

  CompanyModel({
    this.bs = " abc",
    this.catchPhrase = "abc",
    this.name = "abc",
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) => _$CompanyModelFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyModelToJson(this);
}
