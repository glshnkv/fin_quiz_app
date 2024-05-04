import 'package:hive_flutter/hive_flutter.dart';

part 'finance_model.g.dart';

@HiveType(typeId: 0)
class FinanceModel {
  @HiveField(0)
  int value;
  @HiveField(1)
  final String category;
  @HiveField(2)
  final FinanceType type;
  @HiveField(3)
  final DateTime date;

  FinanceModel(
      {required this.value,
        required this.category,
        required this.type,
        required this.date});
}

@HiveType(typeId: 1)
enum FinanceType {
  @HiveField(0)
  income,
  @HiveField(1)
  expense,
}