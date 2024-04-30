import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_update/currency_model.dart';
import 'package:my_default_project/screens/multistate_cubit_screen/multi_state_currency_screen.dart';
import 'package:my_default_project/utils/styles/app_text_style.dart';

import '../../data/cubits/single_cubit/single_cubit_state.dart';
import '../../data/cubits/single_cubit/single_currency_cunit.dart';
import '../../data/models/currency_mode.dart';
import '../../data/models/form_status.dart';

class CurrenciesScreen extends StatelessWidget {
  const CurrenciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Currencies"),
        actions: [
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>MultiCurrenciesScreen()));
          }, child: Text("MultiState",style: AppTextStyle.GilroyMedium,))
        ],
      ),
      body: BlocBuilder<CurrenciesCubit, CurrencyState>(
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
          return ListView(
            children: List.generate(state.currencies.length, (index) {
              CurrencyModel currencyModel = state.currencies[index];
              return ListTile(
                title: Text("${currencyModel.nominal} ${currencyModel.cyNmUZ}"),
                subtitle: Text("Qiymati: ${currencyModel.rate}"),
              );
            }),
          );
        },
      ),
    );
  }
}