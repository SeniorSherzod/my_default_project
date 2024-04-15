
import '../data/models/user_model/user_model.dart';

abstract class UserState {}

class UserLoadedState extends UserState {
  final UserModel user;

  UserLoadedState({required this.user});
}

class UserLoadingState extends UserState {}

class UserErrorState extends UserState {
  final String errorText;

  UserErrorState({required  this.errorText});
}

class UserInitialState extends UserState {}
