import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

@immutable
sealed class AuthState {}
enum AuthenticationStatus { authenticated, unauthenticated, unknown }

class AuthenticationState extends Equatable {

  final AuthenticationStatus status;
  final User? user;

  const AuthenticationState._({
    this.status = AuthenticationStatus.unknown,
    this.user,
  });

  /// No information about the [AuthenticationStatus] of the current user.
  const AuthenticationState.unknown() : this._();

  /// Current user is [authenticated].
  ///
  /// It takes a [MyUser] property representing the current [authenticated] user.
  const AuthenticationState.authenticated(User user) : this._(status: AuthenticationStatus.authenticated, user: user);

  /// Current user is [unauthenticated].
  const AuthenticationState.unauthenticated() : this._(status: AuthenticationStatus.unauthenticated);

  @override
  List<Object?> get props => [status, user];


}
