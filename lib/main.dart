import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_default_project/bloc/contact/contact_cubit.dart';
import 'package:my_default_project/bloc/message/message_cubit.dart';
import 'package:my_default_project/screens/contact_screen/contact_screen.dart';
import 'package:my_default_project/services/file_manager_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await FileManagerService.init();

  final contactBloc = ContactBloc(); // Initialize ContactBloc
  runApp(MyApp(contactBloc: contactBloc));
}

class MyApp extends StatelessWidget {
  final ContactBloc contactBloc;

  const MyApp({Key? key, required this.contactBloc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        BlocProvider(create: (_) => MessageCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: false,
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: AppBarTheme(backgroundColor: Colors.white, elevation: 0),
        ),
        home: ContactScreen(),
      ),
    );
  }
}
