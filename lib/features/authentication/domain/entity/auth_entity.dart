class AuthEntity {
  final String email;
  final String avatarimg;
  final String name;
  AuthEntity({required this.email, required this.avatarimg,required this.name});

  AuthEntity copyWith({
    String? email,
    String? avatarimg,
    String? name,
  }) {
    return AuthEntity(
      email: email ?? this.email,
      avatarimg: avatarimg ?? this.avatarimg,
      name: name ?? this.name,
    );
  }

  @override
  String toString() => 'AuthEntity(email: $email, avatarimg: $avatarimg, name: $name)';


  @override
  bool operator ==(covariant AuthEntity other) {
    if (identical(this, other)) return true;
  
    return 
      other.email == email &&
      other.avatarimg == avatarimg &&
      other.name == name;
  }

  @override
  int get hashCode => email.hashCode ^ avatarimg.hashCode ^ name.hashCode;
}
