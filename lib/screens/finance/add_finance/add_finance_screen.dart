import 'package:auto_route/auto_route.dart';
import 'package:chip_list/chip_list.dart';
import 'package:fin_quiz_app/models/finance_model.dart';
import 'package:fin_quiz_app/router/router.dart';
import 'package:fin_quiz_app/screens/finance/finance_bloc/finance_bloc.dart';
import 'package:fin_quiz_app/theme/colors.dart';
import 'package:fin_quiz_app/theme/textstyles.dart';
import 'package:fin_quiz_app/widgets/action_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

@RoutePage()
class AddFinanceScreen extends StatefulWidget {
  const AddFinanceScreen({super.key});

  @override
  State<AddFinanceScreen> createState() => _AddFinanceScreenState();
}

class _AddFinanceScreenState extends State<AddFinanceScreen> {
  final controller = PageController();

  final valueIncomeController = TextEditingController();
  final dateIncomeController = TextEditingController();

  final valueExpenseController = TextEditingController();
  final dateExpenseController = TextEditingController();

  List<String> incomeCategoryList = [
    'Salary',
    'Freelance',
    'Investments',
    'Rental Income',
    'Side Jobs',
    'Bonuses and Awards',
    'Passive Income',
    'Social Benefits',
    'Sales',
    'Consulting and Training'
  ];
  String incomeCategory = 'Salary';
  int _incomeCategoryIndex = 0;

  List<String> expenseCategoryList = [
    'Housing',
    'Food',
    'Transportation',
    'Health',
    'Entertainment',
    'Clothing and Footwear',
    'Education',
    'Personal Expenses',
    'Debts and Loans',
    'Unexpected Expenses'
  ];
  String expenseCategory = 'Housing';
  int _expenseCategoryIndex = 0;

  int _currentIndex = 0;

  DateTime dateIncome = DateTime.now();
  DateTime dateExpense = DateTime.now();


  Future<void> _selectIncomeDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );
    if (_picked != null) {
      dateIncome = _picked;
      setState(() {
        dateIncomeController.text = _picked.toString().split(' ')[0];
      });
    }
  }

  Future<void> _selectExpenseDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );
    if (_picked != null) {
      dateExpense = _picked;
      setState(() {
        dateExpenseController.text = _picked.toString().split(' ')[0];
      });
    }
  }

  @override
  void dispose() {
    controller.dispose();
    valueIncomeController.dispose();
    dateIncomeController.dispose();
    valueExpenseController.dispose();
    dateExpenseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        leadingWidth: 110,
        leading: GestureDetector(
          onTap: () {
            context.router.push(MainRoute());
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios_new, color: AppColors.black),
                SizedBox(width: 5),
                Text('Back', style: AppTextStyles.text(AppColors.black)),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                FlutterToggleTab(
                  height: 35,
                  width: MediaQuery.of(context).size.width * 0.22,
                  borderRadius: 8,
                  selectedBackgroundColors: [AppColors.blue],
                  unSelectedBackgroundColors: [AppColors.lightBlue],
                  selectedTextStyle: AppTextStyles.text(AppColors.white),
                  unSelectedTextStyle: AppTextStyles.text(AppColors.black),
                  labels: ['Incomes', 'Expenses'],
                  selectedIndex: _currentIndex,
                  selectedLabelIndex: (index) {
                    _currentIndex = index;
                    if (_currentIndex == 0) {
                      controller.previousPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease);
                    } else {
                      controller.nextPage(
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease);
                    }
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.9,
                  child: PageView(
                    physics: NeverScrollableScrollPhysics(),
                    onPageChanged: (index) {
                      setState(() {});
                    },
                    controller: controller,
                    children: [
                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Category',
                                  style: AppTextStyles.text(AppColors.black60)),
                              SizedBox(height: 5),
                              ChipList(
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                                spacing: 5,
                                runSpacing: 5,
                                listOfChipNames: incomeCategoryList,
                                activeBorderColorList: [AppColors.blue],
                                inactiveBorderColorList: [AppColors.white],
                                activeBgColorList: [AppColors.blue],
                                inactiveBgColorList: [AppColors.lightBlue],
                                activeTextColorList: [AppColors.white],
                                inactiveTextColorList: [AppColors.black],
                                listOfChipIndicesCurrentlySeclected: [
                                  _incomeCategoryIndex
                                ],
                                shouldWrap: true,
                                checkmarkColor: AppColors.white,
                                extraOnToggle: (val) {
                                  _incomeCategoryIndex = val;
                                  setState(() {
                                    incomeCategory = incomeCategoryList[_incomeCategoryIndex];
                                  });
                                },
                              ),
                              SizedBox(height: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('\$ Amount',
                                      style: AppTextStyles.text(AppColors.black60)),
                                  SizedBox(height: 10),
                                  TextField(
                                    style: TextStyle(color: AppColors.black),
                                    controller: valueIncomeController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: AppColors.lightBlue,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 16.0, vertical: 17),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: AppColors.blue),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Date',
                                      style: AppTextStyles.text(AppColors.black60)),
                                  SizedBox(height: 10),
                                  TextField(
                                    style: TextStyle(color: AppColors.black),
                                    controller: dateIncomeController,
                                    readOnly: true,
                                    onTap: () {
                                      _selectIncomeDate();
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Date',
                                      filled: true,
                                      fillColor: AppColors.lightBlue,
                                      prefixIcon: Icon(Icons.calendar_month),
                                      prefixIconColor: AppColors.black60,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: AppColors.blue),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                      hintStyle:
                                      AppTextStyles.text(AppColors.black60),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 25),
                              ActionButtonWidget(
                                  text: 'Add income',
                                  width: double.infinity,
                                  onTap: () {
                                    if (valueIncomeController.text.isNotEmpty &&
                                        int.tryParse(valueIncomeController.text) !=
                                            null) {
                                      context.read<FinanceBloc>().add(
                                          AddIncomeEvent(
                                              income: FinanceModel(
                                                  value: int.parse(
                                                      valueIncomeController.text),
                                                  category: incomeCategory,
                                                  type: FinanceType.income,
                                                  date: dateIncome)));
                                      context.router.push(MainRoute());
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          backgroundColor: AppColors.blue,
                                          content: Text(
                                            'Firstly, enter information',
                                            style: TextStyle(color: AppColors.white),
                                          ),
                                        ),
                                      );
                                    }
                                  })
                            ],
                          ),
                        ),
                      ),

                      SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Category',
                                  style: AppTextStyles.text(AppColors.black70)),
                              SizedBox(height: 5),
                              ChipList(
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                                spacing: 5,
                                runSpacing: 5,
                                listOfChipNames: expenseCategoryList,
                                activeBorderColorList: [AppColors.blue],
                                inactiveBorderColorList: [AppColors.white],
                                activeBgColorList: [AppColors.blue],
                                inactiveBgColorList: [AppColors.lightBlue],
                                activeTextColorList: [AppColors.white],
                                inactiveTextColorList: [AppColors.black],
                                listOfChipIndicesCurrentlySeclected: [
                                  _expenseCategoryIndex
                                ],
                                shouldWrap: true,
                                checkmarkColor: AppColors.white,
                                extraOnToggle: (val) {
                                  _expenseCategoryIndex = val;
                                  setState(() {
                                    expenseCategory = expenseCategoryList[_expenseCategoryIndex];
                                  });
                                },
                              ),
                              SizedBox(height: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('\$ Amount',
                                      style: AppTextStyles.text(AppColors.black60)),
                                  SizedBox(height: 10),
                                  TextField(
                                    style: TextStyle(color: AppColors.black),
                                    controller: valueExpenseController,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: AppColors.lightBlue,
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 16.0, vertical: 17),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: AppColors.blue),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Date',
                                      style: AppTextStyles.text(AppColors.black60)),
                                  SizedBox(height: 10),
                                  TextField(
                                    style: TextStyle(color: AppColors.black),
                                    controller: dateExpenseController,
                                    readOnly: true,
                                    onTap: () {
                                      _selectExpenseDate();
                                    },
                                    decoration: InputDecoration(
                                      hintText: 'Date',
                                      filled: true,
                                      fillColor: AppColors.lightBlue,
                                      prefixIcon: Icon(Icons.calendar_month),
                                      prefixIconColor: AppColors.black60,
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide.none,
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide:
                                          BorderSide(color: AppColors.blue),
                                          borderRadius:
                                          BorderRadius.all(Radius.circular(8))),
                                      hintStyle:
                                      AppTextStyles.text(AppColors.black60),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 25),
                              ActionButtonWidget(
                                  text: 'Add expense',
                                  width: double.infinity,
                                  onTap: () {
                                    if (valueExpenseController.text.isNotEmpty &&
                                        int.tryParse(valueExpenseController.text) !=
                                            null) {
                                      context.read<FinanceBloc>().add(
                                          AddExpenseEvent(
                                              expense: FinanceModel(
                                                  value: int.parse(
                                                      valueExpenseController.text),
                                                  category: expenseCategory,
                                                  type: FinanceType.expense,
                                                  date: dateExpense)));
                                      context.router.push(MainRoute());
                                    } else {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                          backgroundColor: AppColors.blue,
                                          content: Text(
                                            'Firstly, enter information',
                                            style: TextStyle(color: AppColors.white),
                                          ),
                                        ),
                                      );
                                    }
                                  })
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}