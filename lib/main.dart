import 'package:fin_quiz_app/fin_quiz_app.dart';
import 'package:fin_quiz_app/models/finance_model.dart';
import 'package:fin_quiz_app/screens/finance/finance_bloc/finance_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await Hive.initFlutter();
  Hive.registerAdapter(FinanceModelAdapter());
  Hive.registerAdapter(FinanceTypeAdapter());
  await Hive.openBox('incomes');
  await Hive.openBox('expenses');

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<FinanceBloc>(create: (context) => FinanceBloc()),
      ],
      child: FinQuizApp(),
    ),
  );
}
