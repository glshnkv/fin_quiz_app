import 'package:auto_route/auto_route.dart';
import 'package:fin_quiz_app/models/finance_model.dart';
import 'package:fin_quiz_app/router/router.dart';
import 'package:fin_quiz_app/screens/finance/finance_bloc/finance_bloc.dart';
import 'package:fin_quiz_app/theme/colors.dart';
import 'package:fin_quiz_app/theme/textstyles.dart';
import 'package:fin_quiz_app/widgets/action_button_widget.dart';
import 'package:fin_quiz_app/widgets/app_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';

@RoutePage()
class FinanceListScreen extends StatefulWidget {
  const FinanceListScreen({super.key});

  @override
  State<FinanceListScreen> createState() => _FinanceListScreenState();
}

class _FinanceListScreenState extends State<FinanceListScreen> {
  final controller = PageController();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FinanceBloc()..add(GetFinanceEvent()),
      child: BlocConsumer<FinanceBloc, FinanceState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is EmptyFinanceState) {
            return Scaffold(
              backgroundColor: AppColors.white,
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text('Operations',
                                style: AppTextStyles.h1(AppColors.black))),
                        Column(
                          children: [
                            Image.asset('assets/images/finance/empty-list.png'),
                            SizedBox(height: 20),
                            Text('There\'s no info',
                                style: AppTextStyles.h2(AppColors.blue)),
                            Text('Add your incomes and expenses',
                                style: AppTextStyles.text(AppColors.black60)),
                            SizedBox(height: 20),
                            SvgPicture.asset('assets/images/finance/line.svg'),
                            SizedBox(height: 20),
                            ActionButtonWidget(
                              text: 'Add new',
                              width: double.infinity,
                              onTap: () {
                                context.router.push(AddFinanceRoute());
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else if (state is LoadedFinanceState) {
            return Scaffold(
              backgroundColor: AppColors.white,
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text('Operations', style: AppTextStyles.h1(AppColors.black))),
                        ),
                        SizedBox(height: 20),
                        FlutterToggleTab(
                          height: 35,
                          width: MediaQuery.of(context).size.width * 0.22,
                          borderRadius: 7,
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
                                      AppContainer(child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Hello!',
                                                  style: AppTextStyles.h1(AppColors.white)),
                                              Container(
                                                  width: 200,
                                                  height: 1, color: Colors.white),
                                              SizedBox(height: 5),
                                              Text('Your amount of income!',
                                                  style: AppTextStyles.text(Colors.white70)),
                                              Text('\$ ${state.incomeValue}',
                                                  style: AppTextStyles.h2(AppColors.white)),
                                            ],
                                          ),
                                          Image.asset('assets/images/finance/sum-image.png'),
                                        ],
                                      ),),
                                      ListView.separated(
                                          padding: EdgeInsets.symmetric(vertical: 16),
                                          physics: NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: state.incomes.length,
                                          separatorBuilder: (BuildContext context, int index) =>
                                          const SizedBox(height: 15),
                                          itemBuilder: (BuildContext context, int index) {
                                            final FinanceModel _income = state.incomes[index];
                                            return Container(
                                              padding: EdgeInsets.all(16),
                                              decoration: BoxDecoration(
                                                  color: AppColors.lightBlue,
                                                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text('\$ ${_income.value}',
                                                          style: AppTextStyles.h2(AppColors.blue)),
                                                      SizedBox(height: 15),
                                                      Text('${_income.date.day}/${_income.date.month}/${_income.date.year}', style: AppTextStyles.text(AppColors.black70)),
                                                    ],
                                                  ),
                                                  Text(_income.category, style: AppTextStyles.text(AppColors.black70)),
                                                ],
                                              ),
                                            );
                                          }),
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
                                      AppContainer(child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text('Hello!',
                                                  style: AppTextStyles.h1(AppColors.white)),
                                              Container(
                                                  width: 200,
                                                  height: 1, color: Colors.white),
                                              SizedBox(height: 5),
                                              Text('Your amount of expenses!',
                                                  style: AppTextStyles.text(Colors.white70)),
                                              Text('-\$ ${state.expenseValue}',
                                                  style: AppTextStyles.h2(AppColors.white)),
                                            ],
                                          ),
                                          Image.asset('assets/images/finance/sum-image.png'),
                                        ],
                                      )),
                                      ListView.separated(
                                          padding: EdgeInsets.symmetric(vertical: 16),
                                          physics: NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemCount: state.expenses.length,
                                          separatorBuilder: (BuildContext context, int index) =>
                                          const SizedBox(height: 15),
                                          itemBuilder: (BuildContext context, int index) {
                                            final FinanceModel _expense = state.expenses[index];
                                            return Container(
                                              padding: EdgeInsets.all(16),
                                              decoration: BoxDecoration(
                                                  color: AppColors.lightBlue,
                                                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
                                              child: Row(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    children: [
                                                      Text('- \$ ${_expense.value}',
                                                          style: AppTextStyles.h2(AppColors.blue)),
                                                      SizedBox(height: 15),
                                                      Text('${_expense.date.day}/${_expense.date.month}/${_expense.date.year}', style: AppTextStyles.text(AppColors.black70)),
                                                    ],
                                                  ),
                                                  Text(_expense.category, style: AppTextStyles.text(AppColors.black70)),
                                                ],
                                              ),
                                            );
                                          }),
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
              floatingActionButton: FloatingActionButton(
                  backgroundColor: AppColors.blue,
                onPressed: () {
                  context.router.push(AddFinanceRoute());
                },
                child: Icon(Icons.add, color: AppColors.white),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
