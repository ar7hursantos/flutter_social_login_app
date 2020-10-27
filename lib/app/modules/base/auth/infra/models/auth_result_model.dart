import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/auth_result.dart';

class AuthResultModel extends AuthResult {
  String id;
  String name;
  String email;
  String photoUrl;

  AuthResultModel({
    this.id,
    this.name,
    this.email,
    this.photoUrl,
  });

  factory AuthResultModel.fromFirebaseUser(User firebaseUser) =>
      AuthResultModel(
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

  factory AuthResultModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return AuthResultModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      photoUrl: map['photoUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthResultModel.fromJson(String source) =>
      AuthResultModel.fromMap(json.decode(source));

  @override
  String toString() {
    return '''AuthResultModel(id: $id, name: $name, email: $email, photoUrl: $photoUrl)''';
  }
}
