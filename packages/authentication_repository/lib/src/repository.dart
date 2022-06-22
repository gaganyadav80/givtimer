import 'dart:async';

import 'package:authentication_repository/cache.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';

import 'exceptions.dart';
import 'models/user_model.dart';

/// {@template authentication_repository}
/// Repository which manages user authentication.
/// {@endtemplate}
class AuthenticationRepository {
  /// {@macro authentication_repository}
  AuthenticationRepository({
    CacheClient? cache,
    firebase_auth.FirebaseAuth? firebaseAuth,
    GoogleSignIn? googleSignIn,
  })  : _cache = cache ?? CacheClient(),
        _firebaseAuth = firebaseAuth ?? firebase_auth.FirebaseAuth.instance,
        _googleSignIn = googleSignIn ?? GoogleSignIn.standard();

  final CacheClient _cache;
  final firebase_auth.FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  /// Whether or not the current environment is web
  /// Should only be overriden for testing purposes. Otherwise,
  /// defaults to [kIsWeb]
  @visibleForTesting
  bool isWeb = kIsWeb;

  /// User cache key.
  /// Should only be used for testing purposes.
  @visibleForTesting
  static const userCacheKey = '__user_cache_key__';

  /// Stream of [User] which will emit the current user when
  /// the authentication state changes.
  ///
  /// Emits [User.empty] if the user is not authenticated.
  Stream<AuthUser> get user {
    return _firebaseAuth.userChanges().map((firebaseUser) {
      final user = firebaseUser == null ? AuthUser.empty : firebaseUser.toUser;
      _cache.write<AuthUser>(key: userCacheKey, value: user);
      return user;
    });
  }

  /// Returns the current cached user.
  /// Defaults to [User.empty] if there is no cached user.
  AuthUser get currentUser {
    return _cache.read<AuthUser>(key: userCacheKey) ?? AuthUser.empty;
  }

  /// Creates a new user with the provided [email] and [password].
  ///
  /// Throws a [SignUpWithEmailAndPasswordFailure] if an exception occurs.
  Future<void> signUp({
    required String email,
    required String password,
    String? name,
    bool sendVerification = false,
  }) async {
    try {
      final _userCred = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final firebase_auth.User _user = _userCred.user!;
      if (name != null) {
        await _user.updateDisplayName(name);
        await _user.reload();
      }
      if (sendVerification) {
        _user.sendEmailVerification();
      }
    } on FirebaseAuthException catch (e) {
      throw SignUpWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const SignUpWithEmailAndPasswordFailure();
    }
  }

  /// Starts the Sign In with Google Flow.
  ///
  /// Throws a [LogInWithGoogleFailure] if an exception occurs.
  Future<void> logInWithGoogle() async {
    try {
      late final firebase_auth.AuthCredential credential;
      if (isWeb) {
        final googleProvider = firebase_auth.GoogleAuthProvider();
        final userCredential = await _firebaseAuth.signInWithPopup(
          googleProvider,
        );
        credential = userCredential.credential!;
      } else {
        final googleUser = await _googleSignIn.signIn();
        final googleAuth = await googleUser!.authentication;
        credential = firebase_auth.GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
      }

      await _firebaseAuth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw LogInWithGoogleFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithGoogleFailure();
    }
  }

  /// Signs in with the provided [email] and [password].
  ///
  /// Throws a [LogInWithEmailAndPasswordFailure] if an exception occurs.
  Future<void> logInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw LogInWithEmailAndPasswordFailure.fromCode(e.code);
    } catch (_) {
      throw const LogInWithEmailAndPasswordFailure();
    }
  }

  /// Sends verification mail to the user.
  ///
  /// Throws a [SendVerificationEmailFailure] if an exception occurs.
  // Future<void> sendVerificationEmail() async {
  //   try {
  //     final firebaseUser = _firebaseAuth.currentUser!;
  //     await firebaseUser.sendEmailVerification();
  //   } catch (_) {
  //     throw SendVerificationEmailFailure();
  //   }
  // }

  /// Update profile photo of the currently signed in user.
  Future<void> updateProfilePhoto(String url) async {
    try {
      final firebaseUser = _firebaseAuth.currentUser!;
      await firebaseUser.updatePhotoURL(url);
      await firebaseUser.reload();
    } catch (_) {
      throw const UpdateProfileFailures('Failed to update profile photo');
    }
  }

  /// Update display name of the currently signed in user.
  Future<void> updateDisplayName(String name) async {
    try {
      final firebaseUser = _firebaseAuth.currentUser!;
      await firebaseUser.updateDisplayName(name);
      await firebaseUser.reload();
    } catch (_) {
      throw const UpdateProfileFailures('Failed to update display name');
    }
  }

  /// Update email used to authenticate the currently signed in user.
  Future<void> updateProfileEmail(String email) async {
    try {
      final firebaseUser = _firebaseAuth.currentUser!;
      await firebaseUser.verifyBeforeUpdateEmail(email);
      // await firebaseUser.reload();
    } on FirebaseAuthException catch (e) {
      throw UpdateProfileFailures.fromCode(e.code);
    } catch (_) {
      throw const UpdateProfileFailures('Failed to update user email');
    }
  }

  /// Update password used to authenticate the currently signed in user.
  Future<void> updateProfilePassword(
      String email, String oldpass, String newpass) async {
    try {
      final firebaseUser = _firebaseAuth.currentUser!;
      await firebaseUser.reauthenticateWithCredential(
        firebase_auth.EmailAuthProvider.credential(
          email: email,
          password: oldpass,
        ),
      );
      await firebaseUser.updatePassword(newpass);
      // await firebaseUser.reload();
    } on FirebaseAuthException catch (e) {
      throw UpdateProfileFailures.fromCode(e.code);
    } catch (_) {
      throw const UpdateProfileFailures('Failed to update user email');
    }
  }

  /// Signs out the current user which will emit
  /// [User.empty] from the [user] Stream.
  ///
  /// Throws a [LogOutFailure] if an exception occurs.
  Future<void> logOut() async {
    try {
      await Future.wait([
        _firebaseAuth.signOut(),
        // _googleSignIn.signOut(),
      ]);
    } catch (_) {
      throw LogOutFailure();
    }
  }
}

extension on firebase_auth.User {
  AuthUser get toUser {
    return AuthUser(
      id: uid,
      email: email,
      name: displayName,
      photo: photoURL,
      createdAt: metadata.creationTime,
      lastLoginAt: metadata.lastSignInTime,
      isVerified: emailVerified,
    );
  }
}
