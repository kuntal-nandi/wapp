part of 'calculator_cubit.dart';

@immutable
abstract class CalculatorState {}

class CalculatorInitial extends CalculatorState {}

class CalculatorUpdate extends CalculatorState {
  String input;
  String result;
  CalculatorUpdate({required this.input,required this.result});
}

