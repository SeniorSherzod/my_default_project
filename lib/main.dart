import 'package:flutter/material.dart';
import 'package:my_default_project/data/local/storage_repository.dart';
import 'package:my_default_project/screens/named_route.dart';
Future <void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await StorageRepository.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: false),
      // TODO Step 1
      initialRoute: RouteNames.splashScreen,
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }


}

