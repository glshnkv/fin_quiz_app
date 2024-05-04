import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:fin_quiz_app/models/finance_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';

part 'finance_event.dart';

part 'finance_state.dart';

class FinanceBloc extends Bloc<FinanceEvent, FinanceState> {
  FinanceBloc() : super(FinanceInitial()) {
    on<GetFinanceEvent>(_getFinanceHandler);
    on<AddIncomeEvent>(_addIncomeHandler);
    on<AddExpenseEvent>(_addExpenseHandler);
  }

  void _getFinanceHandler(
      GetFinanceEvent event, Emitter<FinanceState> emit) async {
    List<FinanceModel> incomes = [];
    List<FinanceModel> expenses = [];

    int incomeValue = 0;
    int expenseValue = 0;

    final incomesBox = Hive.box('incomes');
    final expensesBox = Hive.box('expenses');

    if (incomesBox.isNotEmpty && expensesBox.isNotEmpty) {
      for (int i = 0; i < incomesBox.length; i++) {
        incomes.add(incomesBox.getAt(i));
      }

      for (int i = 0; i < expensesBox.length; i++) {
        expenses.add(expensesBox.getAt(i));
      }

      for (FinanceModel income in incomes) {
        incomeValue += income.value;
      }

      for (FinanceModel expense in expenses) {
        expenseValue += expense.value;
      }

      incomes.sort((a, b) => a.date.compareTo(b.date));
      expenses.sort((a, b) => a.date.compareTo(b.date));

      final formattedIncomes = incomes.reversed.toList();
      final formattedExpenses = expenses.reversed.toList();

      emit(LoadedFinanceState(
          incomeValue: incomeValue,
          expenseValue: expenseValue,
          incomes: formattedIncomes,
          expenses: formattedExpenses));
    } else if (incomesBox.isNotEmpty && expensesBox.isEmpty) {
      for (int i = 0; i < incomesBox.length; i++) {
        incomes.add(incomesBox.getAt(i));
      }
      for (FinanceModel income in incomes) {
        incomeValue += income.value;
      }
      incomes.sort((a, b) => a.date.compareTo(b.date));

      emit(LoadedFinanceState(
          incomeValue: incomeValue,
          expenseValue: 0,
          incomes: incomes.reversed.toList(),
          expenses: []));
    } else if (incomesBox.isEmpty && expensesBox.isNotEmpty) {
      for (int i = 0; i < expensesBox.length; i++) {
        expenses.add(expensesBox.getAt(i));
      }
      for (FinanceModel expense in expenses) {
        expenseValue += expense.value;
      }
      expenses.sort((a, b) => a.date.compareTo(b.date));

      emit(LoadedFinanceState(
          incomeValue: 0,
          expenseValue: expenseValue,
          incomes: [],
          expenses: expenses.reversed.toList()));
    } else {
      emit(EmptyFinanceState());
    }
  }

  void _addIncomeHandler(
      AddIncomeEvent event, Emitter<FinanceState> emit) async {
    final incomesBox = Hive.box('incomes');

    incomesBox.add(event.income);
  }

  void _addExpenseHandler(
      AddExpenseEvent event, Emitter<FinanceState> emit) async {
    final expensesBox = Hive.box('expenses');

    expensesBox.add(event.expense);
  }
}