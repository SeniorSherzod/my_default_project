import 'package:flutter/material.dart';
import 'package:my_default_project/screens/demo_screens/demo_screens.dart';
import 'package:my_default_project/screens/number_increase/increase_number_screen.dart';
import 'package:my_default_project/utils/theme/app-theme.dart';
import 'package:my_default_project/view_models/book_view_models.dart';
import 'package:my_default_project/view_models/increase_number.dart';
import 'package:provider/provider.dart';
import 'data/local/storage_repository.dart';
import 'data/repository/book_repository.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await StorageRepository.init();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
          create: (_) => BookViewModel(productRepo: BookRepo())),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: AppTheme.lightTheme,
      dark: AppTheme.darkTheme,
      initial: AdaptiveThemeMode.system,
      builder: (theme, darkTheme) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme,
          darkTheme: darkTheme,
          home: const IncreaseNumber(),
        );
      },
    );
  }
}