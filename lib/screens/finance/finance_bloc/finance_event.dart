part of 'finance_bloc.dart';

@immutable
abstract class FinanceEvent {}

class GetFinanceEvent extends FinanceEvent {}

class AddIncomeEvent extends FinanceEvent {
  final FinanceModel income;

  AddIncomeEvent({required this.income});
}

class AddExpenseEvent extends FinanceEvent {
  final FinanceModel expense;

  AddExpenseEvent({required this.expense});
}