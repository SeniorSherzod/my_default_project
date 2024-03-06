import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:my_default_project/data/local/storage_repository.dart';
import 'package:my_default_project/screens/named_route.dart';
import 'package:my_default_project/utils/theme/theme.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
        light: AppTheme.lightTheme,
        dark: AppTheme.darkTheme,
        initial: AdaptiveThemeMode.system,
        builder: (theme, darkTheme)
    {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        // darkTheme: ThemeData.dark(),
        initialRoute: RouteNames.splashScreen,
        onGenerateRoute: AppRoutes.generateRoute,
      );
    }
    );
  }
}

