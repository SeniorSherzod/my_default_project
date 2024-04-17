import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_default_project/screens/demo_screens/demo_screens.dart';
import 'bloc/countries_bloc.dart';
import 'bloc/country_event.dart';
import 'data/network/api_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  final ApiClient apiClient =
  ApiClient(graphQLClient: ApiClient.create().graphQLClient);

  runApp(MultiBlocProvider(providers: [
    BlocProvider(
      create: (_) => CountriesBloc(apiClient: apiClient)..add(FetchCountries()),
    )
  ], child: const App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CountriesScreen(),
    );
  }
}