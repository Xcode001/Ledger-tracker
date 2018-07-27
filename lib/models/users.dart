import 'package:vsii_trader/common/uuid.dart';
import 'package:meta/meta.dart';
import 'package:vsii_trader/repository/users/users_index.dart';

@immutable
class User {
  final String id;
  final String username;
  final String email;
  final String phone;
  final String company;
  final String role;
  final String updatedDate;

  User(
      {String id,
      String username,
      String email,
      String phone,
      String company = "VSII",
      String role = "Supplier",
      String updatedDate})
      : this.username = username ?? 'Guest',
        this.email = email ?? 'Guest@vsii.com.vn',
        this.phone = phone ?? '012546876',
        this.company = company ?? 'VSII',
        this.role = role ?? 'supplier',
        this.updatedDate =
            updatedDate ?? (new DateTime.now()).toString().split(' ')[0],
        this.id = id ?? Uuid().generateV4();

  User copyWith(
      {String id,
      String username,
      String email,
      String phone,
      String company,
      String role,
      String updatedDate}) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      company: company ?? this.company,
      role: role ?? this.role,
      updatedDate: updatedDate ?? this.updatedDate,
    );
  }

  @override
  int get hashCode =>
      username.hashCode ^
      email.hashCode ^
      phone.hashCode ^
      company.hashCode ^
      role.hashCode ^
      updatedDate.hashCode ^
      id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          username == other.username &&
          email == other.email &&
          phone == other.phone &&
          company == other.company &&
          role == other.role &&
          updatedDate == other.updatedDate &&
          id == other.id;

  @override
  String toString() {
    return 'UserEntity{username: $username, email: $email, phone: $phone, company: $company, role: $role, updatedDate: $updatedDate, id: $id}';
  }

  UserEntity toEntity() {
    return UserEntity(id, username, email, phone, company, role, updatedDate);
  }

  static User fromEntity(UserEntity entity) {
    return User(
      id: entity.id ?? Uuid().generateV4(),
      username: entity.username ?? 'Guest',
      email: entity.email ?? 'Guest@vsii.com.vn',
      phone: entity.phone ?? '012546876',
      company: entity.company ?? 'VSII',
      role: entity.role ?? 'supplier',
      updatedDate: entity.updatedDate ?? 'Stone age',
    );
  }
}
