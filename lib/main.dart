import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_default_project/bloc/file_manager_bloc.dart';
import 'package:my_default_project/screens/home_screens/home_screens.dart';
import 'package:my_default_project/services/file_manager_service.dart';

import 'data/repository/file_repository.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

 await FileManagerService.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (_) => FileRepository()),
        BlocProvider(create:(_)=> FileManagerBloc() )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: false,
            scaffoldBackgroundColor: Colors.greenAccent,
          appBarTheme: AppBarTheme(backgroundColor: Colors.greenAccent,elevation: 0)
        ),
        home: FileManagerScreen(),
      ),
    );
  }
}