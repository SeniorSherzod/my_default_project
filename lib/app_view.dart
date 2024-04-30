import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_default_project/blocs/chat_message/chat_bloc.dart';
import 'package:my_default_project/data/network/contact_list.dart';
import 'package:my_default_project/screens/auth_screen/welcome_screen.dart';
import 'package:my_default_project/screens/contact_screen/contact_screen.dart';
import 'package:my_default_project/screens/message_screen/chat_screen.dart';
import 'package:my_default_project/screens/message_screen/message_screen.dart';
import 'blocs/auth_blic/auth_bloc.dart';
import 'blocs/auth_blic/auth_state.dart';
import 'blocs/get_chat/get_post_bloc.dart';
import 'blocs/my_user/my_user_bloc.dart';
import 'blocs/sign_in_bloc/sign_in_bloc.dart';
import 'blocs/update/update_user_info_bloc.dart';
import 'data/chat/repository/post_repository.dart';

class MyAppView extends StatelessWidget {
  const MyAppView({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chatapp',
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
            background: Colors.white,
            onBackground: Colors.black,
            primary: Color.fromRGBO(206, 147, 216, 1),
            onPrimary: Colors.black,
            secondary: Color.fromRGBO(244, 143, 177, 1),
            onSecondary: Colors.white,
            tertiary: Color.fromRGBO(255, 204, 128, 1),
            error: Colors.red,
            outline: Color(0xFF424242)
        ),
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            if(state.status == AuthenticationStatus.authenticated) {
              return MultiBlocProvider(
                providers: [
                  BlocProvider(
                    create: (context) => SignInBloc(
                        userRepository: context.read<AuthenticationBloc>().userRepository
                    ),
                  ),
                  BlocProvider(
                    create: (context) => UpdateUserInfoBloc(
                        userRepository: context.read<AuthenticationBloc>().userRepository
                    ),
                  ),
                  BlocProvider(
                    create: (context) => MyUserBloc(
                        myUserRepository: context.read<AuthenticationBloc>().userRepository
                    )..add(GetMyUser(
                        myUserId: context.read<AuthenticationBloc>().state.user!.uid
                    )),
                  ),
                  BlocProvider(
                      create: (context) => GetPostBloc(
                          postRepository: FirebasePostRepository()
                      )..add(GetPosts())
                  ),
                  BlocProvider(
                      create: (context) => ChatBloc(
                      )
                  )
                ],
                child:  HomeScreen()
              );
            } else {
              return const WelcomeScreen();
            }
          }
      ),
    );
  }
}