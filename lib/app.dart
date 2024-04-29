import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app_view.dart';
import 'blocs/auth_blic/auth_bloc.dart';
import 'data/user/user_repo/user_repo.dart';

class MainApp extends StatelessWidget {
  final UserRepository userRepository;
  const MainApp(this.userRepository, {super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AuthenticationBloc>(
              create: (_) => AuthenticationBloc(
                  myUserRepository: userRepository
              )
          )
        ],
        child: const MyAppView()
    );
  }
}