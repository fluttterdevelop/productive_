class AuthenticatedUserEntity {
  final String email;
  final String password;
  final String? avatar;


  const AuthenticatedUserEntity({
    required this.email,
    required this.password,
    this.avatar,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is AuthenticatedUserEntity &&
      other.email == email &&
      other.password == password &&
      other.avatar == avatar;
  }

  @override
  int get hashCode => email.hashCode ^ password.hashCode ^ avatar.hashCode;

  @override
  String toString() => 'AuthenticatedUserEntity(email: $email, password: $password, avatar: $avatar)';

  AuthenticatedUserEntity copyWith({
    String? email,
    String? password,
    String? avatar,
  }) {
    return AuthenticatedUserEntity(
      email: email ?? this.email,
      password: password ?? this.password,
      avatar: avatar ?? this.avatar,
    );
  }
}