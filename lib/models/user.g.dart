// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => new User(
    userClass: json[r'$class'] as String,
    username: json['username'] as String,
    email: json['email'] as String,
    phone: json['phone'] as String,
    role: json['role'] as String);

abstract class _$UserSerializerMixin {
  String get userClass;
  String get username;
  String get email;
  String get phone;
  String get role;
  Map<String, dynamic> toJson() => <String, dynamic>{
        r'$class': userClass,
        'username': username,
        'email': email,
        'phone': phone,
        'role': role
      };
}
