import 'package:flutter/material.dart';
import 'package:my_default_project/data/models/countries/countries.dart';
import 'package:my_default_project/screens/user_model_screen/users_screen.dart';
import 'package:my_default_project/utils/styles/app_text_style.dart';
import 'package:my_default_project/view_model/view_model_countries/countries_model.dart';
import 'package:provider/provider.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Countries"),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const UsersScreen()),
                );
              },
              child: const Text("Next"))
        ],
      ),
      body: context.watch<CountriesViewModel>().isLoading
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () {
                return Future<void>.delayed(
                  const Duration(seconds: 2),
                  () {
                    context.read<CountriesViewModel>().fetchCountries();
                  },
                );
              },
              child: ListView(
                children: [
                  ...List.generate(
                    context.watch<CountriesViewModel>().countries.length,
                    (index) {
                      CountryModel country =
                          context.watch<CountriesViewModel>().countries[index];
                      return ListTile(
                        title: Text(country.officialName),
                        leading: Text(country.flag,style: AppTextStyle.GilroyMedium.copyWith(fontSize: 40),),
                        subtitle:Text(country.region),
                        trailing: Column(
                          children: [
                            Text("Population ${country.population.toString()}"),
                          ],
                        ),

                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
