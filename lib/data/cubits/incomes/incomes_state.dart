
import 'package:my_default_project/data/models/incomes_model.dart';

import '../../models/transactions_model.dart';

abstract class IncomeState {}

class IncomeInitialState extends IncomeState {}

class IncomeLoadingState extends IncomeState {}

class IncomeSuccessState extends IncomeState {
  IncomeSuccessState({required this.income});

  final List<TransactionModel> income;
}

class IncomesErrorState extends IncomeState {
  IncomesErrorState({required this.errorText});

  final String errorText;
}