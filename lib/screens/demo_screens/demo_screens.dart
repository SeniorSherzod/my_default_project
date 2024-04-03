import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_default_project/data/models/transactions_model.dart';
import 'package:my_default_project/utils/colors/app_colors.dart';

import '../../data/cubits/incomes/incomes_cubit.dart';
import '../../data/cubits/incomes/incomes_state.dart';
import '../../data/models/incomes_model.dart';
import '../timer_screen/select_screen.dart';

class IncomeScreen extends StatelessWidget {
  const IncomeScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Incomes"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SelectType(),
              ),
            );
          },
              icon: Icon(Icons.arrow_forward))
        ],
      ),
      body: BlocBuilder<IncomeCubit, IncomeState>(
        builder: (context, state) {
          if (state is IncomeLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is IncomesErrorState) {
            return Center(
              child: Text(state.errorText),
            );
          } else if (state is IncomeSuccessState) {
            return ListView.builder(
              itemCount: state.income.length,
              itemBuilder: (context, index) {
                TransactionModel transactionModel = state.income[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (var transaction in transactionModel.transfersData)
                      ListTile(
                        leading: SizedBox(
                          width: 40,
                          child: Image.network(transaction.sender.brandImage),
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Transaction Code: ${transaction.transactionCode}'),
                            Text('Date: ${transaction.date}'),
                            Text('Income ID: ${transaction.incomeId}'),
                            Text('Amount: ${transaction.amount}'),
                            Text('Card ID: ${transaction.cardId}'),
                            Text('Sender Name: ${transaction.sender.name}'),
                            Text('Sender Location: ${transaction.sender.location}'),
                          ],
                        ),
                      ),
                    Divider(color: AppColors.black,height: 2,), // Add a divider between each group of transactions
                  ],
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
