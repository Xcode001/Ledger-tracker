class UserEntity {
  final String id;
  final String username;
  final String email;
  final String phone;
  final String company;
  final String role;
  final String updatedDate;

  UserEntity(this.id, this.username, this.email, this.phone, this.company,
      this.role, this.updatedDate);

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
      other is UserEntity &&
          runtimeType == other.runtimeType &&
          username == other.username &&
          email == other.email &&
          phone == other.phone &&
          company == other.company &&
          role == other.role &&
          updatedDate == other.updatedDate &&
          id == other.id;

  Map<String, Object> toJson() {
    return {
      "username": username,
      "email": email,
      "phone": phone,
      "company": company,
      "role": role,
      "updatedDate": updatedDate,
      "id": id,
    };
  }

  @override
  String toString() {
    return 'OrderEntity{username: $username, email: $email, phone: $phone, company: $company, role: $role, updatedDate: $updatedDate, id: $id}';
  }

  static UserEntity fromJson(Map<String, Object> json) {
    return UserEntity(
      json["id"] as String,
      json["username"] as String,
      json["email"] as String,
      json["phone"] as String,
      json["company"] as String,
      json["role"] as String,
      json["updatedDate"] as String,
    );
  }
}
