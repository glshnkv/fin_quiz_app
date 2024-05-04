part of 'finance_bloc.dart';

@immutable
abstract class FinanceState {}

class FinanceInitial extends FinanceState {}

class LoadedFinanceState extends FinanceState {
  final int incomeValue;
  final int expenseValue;

  final List<FinanceModel> incomes;
  final List<FinanceModel> expenses;

  LoadedFinanceState(
      {required this.incomeValue,
        required this.expenseValue,
        required this.incomes,
        required this.expenses});
}

class EmptyFinanceState extends FinanceState {}