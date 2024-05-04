import 'package:fin_quiz_app/models/question_model.dart';
import 'package:fin_quiz_app/models/quiz_model.dart';

final QuizModel quiz = QuizModel(
  questionCount: 15,
  results: [],
  quiz: [
    QuestionModel(
      question: 'What is APR in the context of credit cards and loans?',
      answers: {
        'Annual Percentage Rate': true,
        'Automatic Payment Recognition': false,
        'Annual Amortization Rate': false,
      },
    ),
    QuestionModel(
      question: 'What is the process of assessing the value of an asset or property called?',
      answers: {
        'Shareholder Assessment': false,
        'Market Valuation': true,
        'Active Management': false,
      },
    ),
    QuestionModel(
      question: 'What is ETF?',
      answers: {
        'One-time Trading Fund': false,
        'Exchange-Traded Fund': true,
        'Economic Tariff Fund': false,
      },
    ),
    QuestionModel(
      question: 'What is the difference between stocks and bonds?',
      answers: {
        'Bonds represent ownership in a company, and stocks represent a promise to return money.': false,
        'Stocks represent ownership in a company, and bonds represent a company\'s debt obligation.': true,
        'Bonds and stocks are the same thing.': false,
      },
    ),
    QuestionModel(
      question: 'What is an IRA?',
      answers: {
        'Individual Reserve Account': false,
        'Individual Stock Growth': false,
        'Individual Retirement Account': true,
      },
    ),
    QuestionModel(
      question: 'What factors affect a person\'s credit score?',
      answers: {
        'Monthly income amount and eye color.': false,
        'Payment history and debt level.': true,
        'Love for cats and the number of friends on social media.': false,
      },
    ),
    QuestionModel(
      question: 'What is cash flow, and why is it important for financial planning?',
      answers: {
        'It\'s the cash flowing into a bank account, important for loan repayment.': false,
        'It\'s a company\'s profit, important for stock growth.': false,
        'It\'s the flow of cash into and out of a business or personal finances, important for evaluating financial health and decision-making.': true,
      },
    ),
    QuestionModel(
      question: 'What is compound interest?',
      answers: {
        'Interest paid by the bank each year.': false,
        'Interest accrued only on the principal amount.': false,
        'Interest earned on the initial deposit and the interest already earned on it.': true,
      },
    ),
    QuestionModel(
      question: 'What types of insurance are typically included in auto insurance?',
      answers: {
        'Life insurance and unemployment insurance.': false,
        'Home insurance and health insurance.': false,
        'Damage insurance and injury insurance.': true,
      },
    ),
    QuestionModel(
      question: 'What is an investment portfolio, and why is it important for risk diversification?',
      answers: {
        'It\'s a collection of funds gathered for investment in a single asset.': false,
        'It\'s a combination of various assets such as stocks, bonds, real estate, and others, important for reducing investment risk.': true,
        'It\'s a strategy of investing only in one type of asset for maximizing profit.': false,
      },
    ),
    QuestionModel(
      question: 'What documents are required for filing a tax return in the USA?',
      answers: {
        'Only a passport.': false,
        'Only a W-2 form.': false,
        'W-2 form, 1099 form, income, and deduction information.': true,
      },
    ),
    QuestionModel(
      question: 'What strategies can be used for debt reduction?',
      answers: {
        'Only ignoring debts.': false,
        'Creating a budget and planning debt repayment.': true,
        'Closing all credit cards.': false,
      },
    ),
    QuestionModel(
      question: 'What is the rule of 72 used for in finance?',
      answers: {
        'Calculating compound interest.': true,
        'Assessing creditworthiness.': false,
        'Determining retirement age.': false,
      },
    ),
    QuestionModel(
      question: 'What does FICO stand for in relation to credit scores?',
      answers: {
        'Financial Indicators and Credit Outcomes.': false,
        'Financial Instrument for Credit Oversight.': false,
        'Fair Isaac Corporation.': true,
      },
    ),
    QuestionModel(
      question: 'What is the purpose of a 401(k) retirement plan?',
      answers: {
        'Tax-free savings account.': false,
        'Employer-sponsored retirement savings plan.': true,
        'Student loan repayment program.': false,
      },
    ),
  ],
);