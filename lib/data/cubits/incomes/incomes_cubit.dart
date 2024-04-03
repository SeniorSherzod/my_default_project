import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_default_project/data/models/incomes_model.dart';

import '../../models/network_responce.dart';
import '../../models/transactions_model.dart';
import '../../repository/incomes_repository.dart';
import 'incomes_state.dart';

class IncomeCubit extends Cubit<IncomeState> {
  IncomeCubit({required this.incomeRepository})
      : super(IncomeInitialState());

  final IncomeRepository incomeRepository;

  Future<void> fetchIncome() async {
    emit(IncomeLoadingState());
    NetworkResponse response = await incomeRepository.getIncomes();
    if (response.errorText.isEmpty) {
      emit(IncomeSuccessState(
          income: response.data as List<TransactionModel>,));
    } else {
      emit(IncomesErrorState(errorText: response.errorText));
    }
  }
}

