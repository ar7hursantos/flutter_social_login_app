import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  String id;
  String name;
  String email;
  String photoUrl;
  String phoneNumber;
  String cloudMessagingToken;

  static const String defaultName = 'Usuário';
  static const String defaultPhotoUrlPath = 'assets/images/default_user.png';

  UserModel({
    this.id,
    this.name,
    this.email,
    this.photoUrl,
    this.phoneNumber,
    this.cloudMessagingToken,
  });

  factory UserModel.fromFirebaseUser(User firebaseUser) => UserModel(
        id: firebaseUser.uid,
        name: firebaseUser.displayName != null
            ? firebaseUser.displayName
            : defaultName,
        email: firebaseUser.email ?? '',
        photoUrl: firebaseUser.photoURL != null
            ? '${firebaseUser.photoURL}?type=large'
            : '',
        phoneNumber: firebaseUser.phoneNumber,
      );

  UserModel copyWith({
    String id,
    String name,
    String email,
    String photoUrl,
    String phoneNumber,
    String cloudMessagingToken,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      cloudMessagingToken: cloudMessagingToken ?? this.cloudMessagingToken,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'photo_url': photoUrl,
      'phone_number': phoneNumber,
      'cloud_messaging_token': cloudMessagingToken,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      photoUrl: map['photo_url'],
      phoneNumber: map['phone_number'],
      cloudMessagingToken: map['cloud_messaging_token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return '''UserModel(id: $id, name: $name, email: $email, photoUrl: $photoUrl, 
    phoneNumber: $phoneNumber, cloudMessagingToken: $cloudMessagingToken''';
  }
}
