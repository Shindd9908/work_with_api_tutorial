// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      uName: json['username'] as String? ?? "abc",
      email: json['email'] as String? ?? "abc@gmail.com",
      id: json['id'] as int? ?? 0,
      companyModel:
          CompanyModel.fromJson(json['company'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.uName,
      'email': instance.email,
      'company': instance.companyModel,
    };
