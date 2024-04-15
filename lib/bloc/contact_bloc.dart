import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/models/user_model/user_model.dart';
import '../data/network/user_responce.dart';
import 'contact_event.dart';
import 'contact_state.dart';
class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserInitialState());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is FetchUserEvent) {
      yield* _mapFetchUserEventToState();
    } else if (event is UpdateUserEvent) {
      yield* _mapUpdateUserEventToState(event);
    } else if (event is CreateUserEvent) {
      yield* _mapCreateUserEventToState(event);
    } else if (event is DeleteUserEvent) {
      yield* _mapDeleteUserEventToState(event);
    }
  }

  Stream<UserState> _mapFetchUserEventToState() async* {
    yield UserLoadingState();
    try {
      final UserModel user = (await userRepository.getUsers()) as UserModel;
      yield UserLoadedState( user: user);
    } catch (e) {
      yield UserErrorState(errorText: 'Failed to fetch user');
    }
  }

  Stream<UserState> _mapUpdateUserEventToState(UpdateUserEvent event) async* {
    yield UserLoadingState();
    try {
      await userRepository.updateUser(event.user);
      yield UserLoadedState(event.user);
    } catch (e) {
      yield UserErrorState(errorText: 'Failed to update user');
    }
  }

  Stream<UserState> _mapCreateUserEventToState(CreateUserEvent event) async* {
    yield UserLoadingState();
    try {
      await userRepository.createUser(event.user);
      yield UserLoadedState(event.user);
    } catch (e) {
      yield UserErrorState(errorText: 'Failed to create user');
    }
  }

  Stream<UserState> _mapDeleteUserEventToState(DeleteUserEvent event) async* {
    yield UserLoadingState();
    try {
      await userRepository.deleteUser(event.userId);
      yield UserLoadedState(null);
    } catch (e) {
      yield UserErrorState(errorText: 'Failed to delete user');
    }
  }
}
