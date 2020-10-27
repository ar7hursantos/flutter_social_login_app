import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/user_result.dart';

class UserResultModel extends UserResult {
  String id;
  String name;
  String email;
  String photoUrl;

  UserResultModel({
    this.id,
    this.name,
    this.email,
    this.photoUrl,
  });

  factory UserResultModel.fromFirebaseUser(User firebaseUser) =>
      UserResultModel(
        id: firebaseUser.uid,
        name: firebaseUser.displayName ?? 'Aluno LearningOn',
        email: firebaseUser.email ?? '',
        photoUrl: firebaseUser.photoURL != null
            ? '${firebaseUser.photoURL}?type=large'
            : '',
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'photoUrl': photoUrl,
    };
  }

  factory UserResultModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserResultModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      photoUrl: map['photoUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserResultModel.fromJson(String source) =>
      UserResultModel.fromMap(json.decode(source));

  @override
  String toString() {
    return '''UserResultModel(id: $id, name: $name, email: $email, photoUrl: $photoUrl)''';
  }
}
