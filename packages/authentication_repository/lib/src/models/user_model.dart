import 'dart:convert';

import 'package:equatable/equatable.dart';

/// {@template user}
/// Authenticated User model
///
/// [AuthUser.empty] represents an unauthenticated user.
/// {@endtemplate}
class AuthUser extends Equatable {
  /// {@macro user}
  const AuthUser({
    required this.id,
    this.email,
    this.name,
    this.photo,
    this.createdAt,
    this.lastLoginAt,
    this.isVerified,
  });

  /// The current user's email address.
  final String? email;

  /// The current user's id.
  final String id;

  /// The current user's name (display name).
  final String? name;

  /// Url for the current user's photo.
  final String? photo;

  final DateTime? createdAt;
  final DateTime? lastLoginAt;
  final bool? isVerified;

  /// Empty user which represents an unauthenticated user.
  static const empty = AuthUser(id: '');

  /// Convenience getter to determine whether the current user is empty.
  bool get isEmpty => this == AuthUser.empty;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isNotEmpty => this != AuthUser.empty;

  @override
  List<Object?> get props =>
      [email, id, name, photo, createdAt, lastLoginAt, isVerified];

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'id': id,
      'name': name,
      'photo': photo,
      'createdAt': createdAt?.millisecondsSinceEpoch,
      'lastLoginAt': lastLoginAt?.millisecondsSinceEpoch,
      'isVerified': isVerified,
    };
  }

  factory AuthUser.fromMap(Map<String, dynamic> map) {
    return AuthUser(
      email: map['email'],
      id: map['id'] ?? '',
      name: map['name'],
      photo: map['photo'],
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'])
          : null,
      lastLoginAt: map['lastLoginAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['lastLoginAt'])
          : null,
      isVerified: map['isVerified'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthUser.fromJson(String source) =>
      AuthUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AuthUser(email: $email, id: $id, name: $name, photo: $photo, createdAt: $createdAt, lastLoginAt: $lastLoginAt, isVerified: $isVerified)';
  }
}
