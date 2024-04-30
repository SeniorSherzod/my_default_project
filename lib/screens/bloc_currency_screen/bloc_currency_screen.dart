import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_update/currency_model.dart';

import '../../bloc/currency_bloc.dart';
import '../../bloc/currency_event.dart';
import '../../bloc/currency_state.dart';
import '../../data/models/currency_mode.dart';
class CurrenciesScreenBloc extends StatelessWidget {
  const CurrenciesScreenBloc({super.key});

  @override
  Widget build(BuildContext context) {
    //context.read<CurrencyRepository>();
    return Scaffold(
      appBar: AppBar(title: const Text("Currencies")),
      body: Column(
        children: [
          BlocBuilder<CurrencyBloc, CurrencyStateBloc>(
            buildWhen: (previous, current) {
              return true;
            },
            builder: (context, state) {
              if (state is CurrencyLoadingStateBloc) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is CurrencyErrorStateBloc) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state.errorText),
                  ],
                );
              } else if (state is CurrencySuccessStateBloc) {
                return Expanded(
                  child: ListView(
                    children: List.generate(state.currencies.length, (index) {
                      CurrencyModel currencyModel = state.currencies[index];
                      return ListTile(
                        onTap: () {
                          context.read<CurrencyBloc>().add(GetCurrencyEvent(
                              ));
                        },
                        title: Text(
                            "${currencyModel.nominal} ${currencyModel.cyNmUZ}"),
                        subtitle: Text("Qiymati: ${currencyModel.rate}"),
                      );
                    }),
                  ),
                );
              }
              return const SizedBox();
            },
          ),
          // Container(
          //   height: 300,
          //   color: Colors.red,
          //   width: double.infinity,
          // ),
          // BlocListener<CurrencyBloc, CurrencyState>(
          //   listener: (context, state) {
          //     if (state is CurrencySuccessState) {
          //       if (state.currencies.isNotEmpty) {
          //         //  Navigator.
          //       }
          //     }
          //
          //     if (state is CurrencyDeletedState) {
          //       Future.microtask(
          //             () => ScaffoldMessenger.of(context).showSnackBar(
          //           const SnackBar(
          //             duration: Duration(seconds: 1),
          //             content: Text("DELETED"),
          //           ),
          //         ),
          //       );
          //     }
          //   },
          //   child: Container(
          //     height: 300,
          //     color: Colors.red,
          //     width: double.infinity,
          //   ),
          // )
        ],
      ),
    );
  }
}