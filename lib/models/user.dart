import 'package:vsii_trader/common/uuid.dart';
import 'package:meta/meta.dart';
import 'package:vsii_trader/repository/users/users_index.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
@immutable
class User extends Object with _$UserSerializerMixin {
  @JsonKey(name: '\u{0024}class')
  final String userClass;

  final String username;

  final String email;

  final String phone;

  final String role;

  User(
      {String userClass,
      String username,
      String email,
      String phone,
      String role})
      : this.role = !role.isEmpty ? role : 'Retailer',
        this.email = role == 'Supplier' ? '3665' : '4202',
        this.phone = role == 'Supplier' ? '0123456789' : '0123456789',
        this.username = role == 'Supplier' ? 'VSII' : "IBM",
        this.userClass = role == 'Supplier'
            ? "com.vsii.trd.ordertracker.Supplier"
            : "com.vsii.trd.ordertracker.Retailer";

  User copyWith(
      {String userClass,
      String username,
      String email,
      String phone,
      String role}) {
    return User(
      userClass: userClass ?? this.userClass,
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      role: role ?? this.role,
    );
  }

  @override
  int get hashCode =>
      username.hashCode ^ email.hashCode ^ phone.hashCode ^ role.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          username == other.username &&
          email == other.email &&
          phone == other.phone &&
          role == other.role;

  @override
  String toString() {
    return 'UserEntity{userClass: $userClass, username: $username, email: $email, phone: $phone, role: $role}';
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

//  UserEntity toEntity() {
//    return UserEntity(userClass, username, email, phone,role);
//  }

//  static User fromEntity(UserEntity entity) {
//    return User(
//      id: entity.id ?? Uuid().generateV4(),
//      username: entity.username ?? 'Guest',
//      email: entity.email ?? 'Guest@vsii.com.vn',
//      phone: entity.phone ?? '012546876',
//      company: entity.company ?? 'VSII',
//      role: entity.role ?? 'supplier',
//      updatedDate: entity.updatedDate ?? 'Stone age',
//    );
//  }
}
