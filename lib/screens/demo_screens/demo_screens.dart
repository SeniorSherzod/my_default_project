import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_default_project/data/cubits/countries/countries_cubit.dart';
import 'package:my_default_project/data/cubits/countries/countries_state.dart';
import 'package:my_default_project/utils/colors/app_colors.dart';
import 'package:my_default_project/utils/styles/app_text_style.dart';
import '../../data/models/form_status.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.black,
        title: const Text("Countries"),
      ),
      body: BlocBuilder<CountriesCubit, CountryState>(
        builder: (context, state) {
          if (state.formsStatus == FormsStatus.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.formsStatus == FormsStatus.error) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.statusText),
              ],
            );
          }
          return ListView.builder(
            itemCount: state.countries.length,
            itemBuilder: (context, index) {
              final countryInfo = state.countries[index];
              return ListTile(
                leading: Text(countryInfo.phone,),
                title: Text(countryInfo.name,),
                subtitle: Text(countryInfo.capital,),
                trailing: Text(countryInfo.emoji,style: AppTextStyle.GilroyThin.copyWith(fontSize: 40),),
              );
            },
          );
        },
      ),
    );
  }
}
