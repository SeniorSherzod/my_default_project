import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_default_project/screens/bloc_currency_screen/bloc_currency_screen.dart';
import 'package:my_default_project/utils/styles/app_text_style.dart';

import '../../data/cubits/multistate_cubit/currency_multi_cubit.dart';
import '../../data/cubits/multistate_cubit/currency_multistate.dart';
import '../../data/models/currency_mode.dart';
import '../../data/repository/currency_repo.dart';

class MultiCurrenciesScreen extends StatelessWidget {
  const MultiCurrenciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CurrencyRepository>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currencies"),
        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>CurrenciesScreenBloc()));
          }, child: Text("Bloc",style: AppTextStyle.GilroyMedium,))
        ],
      ),
      body: BlocBuilder<CurrencyCubitMulti, CurrencyStateMulti>(
        builder: (context, state) {
          if (state is CurrencyLoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is CurrencyErrorState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.errorText),
              ],
            );
          } else if (state is CurrencySuccessState) {
            return ListView(
              children: List.generate(state.currencies.length, (index) {
                CurrencyModel currencyModel = state.currencies[index];
                return ListTile(
                  title:
                  Text("${currencyModel.nominal} ${currencyModel.cyNmUZ}"),
                  subtitle: Text("Qiymati: ${currencyModel.rate}"),
                );
              }),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}