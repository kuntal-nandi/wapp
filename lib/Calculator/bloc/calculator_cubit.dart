import 'package:bloc/bloc.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:meta/meta.dart';

import '../Data Provider/calculator_data.dart';

part 'calculator_state.dart';

class CalculatorCubit extends Cubit<CalculatorState> {
  CalculatorCubit() : super(CalculatorInitial());


  void inputTake(String input){
    CalculatorData.userInput += input;
    emit(CalculatorUpdate(input: CalculatorData.userInput, result: ''));
  }

  void delete(){
    CalculatorData.userInput =
        CalculatorData.userInput.substring(0,   CalculatorData.userInput.length - 1);
    emit(CalculatorUpdate(input: CalculatorData.userInput, result: ''));
  }

  void allClear(){
    CalculatorData.userInput = '';
    CalculatorData.answer = '0';
    emit(CalculatorUpdate(input: CalculatorData.userInput,result: CalculatorData.answer));
  }

  void runCalculator(){
    CalculatorData.userInput = '';
    CalculatorData.answer = '';
    emit(CalculatorInitial());
  }

  void updateResult(){
    String finalUserInput = CalculatorData.userInput;
    finalUserInput = CalculatorData.userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalUserInput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    CalculatorData.answer = eval.toString();
    emit(CalculatorUpdate(input: finalUserInput, result: CalculatorData.answer));
  }

}
