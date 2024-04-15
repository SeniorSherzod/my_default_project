import '../data/models/user_model/user_model.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class FetchUserEvent extends UserEvent {}

class UpdateUserEvent extends UserEvent {
  final UserModel user;

  UpdateUserEvent(this.user);

  @override
  List<Object> get props => [user];
}

class CreateUserEvent extends UserEvent {
  final UserModel user;

  CreateUserEvent(this.user);

  @override
  List<Object> get props => [user];
}

class DeleteUserEvent extends UserEvent {
  final String userId;

  DeleteUserEvent(this.userId);

  @override
  List<Object> get props => [userId];
}
