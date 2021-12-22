import 'package:json_annotation/json_annotation.dart';
import 'package:the_movie_db/models/flutter_api_2/company_model.dart';
part 'user_model.g.dart';
@JsonSerializable()
class UserModel {
  @JsonKey(name: 'id')
  int id;
  @JsonKey(name: 'username')
  String uName;
  @JsonKey(name: 'email')
  String email;
  @JsonKey(name: 'company')
  CompanyModel companyModel;

  UserModel({
    this.uName = "abc",
    this.email = "abc@gmail.com",
    this.id = 0,
    required this.companyModel,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

}
