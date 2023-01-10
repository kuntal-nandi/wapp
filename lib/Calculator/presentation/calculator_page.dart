import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wapp/Calculator/Data%20Provider/calculator_data.dart';
import 'package:wapp/Calculator/bloc/calculator_cubit.dart';
import '../widget/calculator_button.dart';

class Calculator extends StatefulWidget {
  const Calculator({
    Key? key,
  }) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CalculatorCubit()..runCalculator(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xffFFA07A),
          title: const Text(
            "Calculator",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ), //AppBar
        backgroundColor: Colors.white38,
        body: Column(
          children: <Widget>[
            BlocBuilder<CalculatorCubit, CalculatorState>(
              builder: (context, state) {
                if(state is CalculatorInitial){
                  return Expanded(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(20),
                            alignment: Alignment.centerRight,
                            child: const Text(
                              '',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            alignment: Alignment.centerRight,
                            child: const Text(
                              '',
                              style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ]),
                  );
                }
                else if(state is CalculatorUpdate){
                  return Expanded(
                    child: ListView(
                      children: [
                            Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                padding: const EdgeInsets.all(20),
                                alignment: Alignment.centerRight,
                                child: Text(
                                  state.input,
                                  style: const TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(15),
                                alignment: Alignment.centerRight,
                                child: Text(
                                  state.result,
                                  style: const TextStyle(
                                      fontSize: 30,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              )
                            ]),
                          ],
                    ),
                  );
                }
                return const Calculator();
              },
            ),
            Expanded(
              flex: 2,
              child: GridView.builder(
                  itemCount: CalculatorData.buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    // Clear Button
                    if (index == 0) {
                      return MyButton(
                        buttonTapped: () {
                          BlocProvider.of<CalculatorCubit>(context).allClear();
                        },
                        buttonText: CalculatorData.buttons[index],
                        color: Colors.orange,
                        textColor: Colors.black,
                      );
                    }

                    // +/- button
                    else if (index == 1) {
                      return MyButton(
                        buttonText: CalculatorData.buttons[index],
                        color: Colors.white54,
                        textColor: Colors.black,
                        buttonTapped: () {},
                      );
                    }
                    // % Button
                    else if (index == 2) {
                      return MyButton(
                        buttonTapped: () {
                          BlocProvider.of<CalculatorCubit>(context).inputTake(CalculatorData.buttons[index]);
                        },
                        buttonText: CalculatorData.buttons[index],
                        color: Colors.deepPurpleAccent,
                        textColor: Colors.black,
                      );
                    }
                    // Delete Button
                    else if (index == 3) {
                      return MyButton(
                        buttonTapped: () {
                          BlocProvider.of<CalculatorCubit>(context).delete();
                        },
                        buttonText: CalculatorData.buttons[index],
                        color: Colors.red,
                        textColor: Colors.white,
                      );
                    }
                    // Equal_to Button
                    else if (index == 18) {
                      return MyButton(
                        buttonTapped: () {
                          BlocProvider.of<CalculatorCubit>(context).updateResult();
                        },
                        buttonText: CalculatorData.buttons[index],
                        color: Colors.green,
                        textColor: Colors.white,
                      );
                    }

                    // other buttons
                    else {
                      return MyButton(
                        buttonTapped: () {
                          BlocProvider.of<CalculatorCubit>(context).inputTake(CalculatorData.buttons[index]);
                        },
                        buttonText: CalculatorData.buttons[index],
                        color: isOperator(CalculatorData.buttons[index])
                            ? Colors.blueAccent
                            : Colors.white,
                        textColor: isOperator(CalculatorData.buttons[index])
                            ? Colors.white
                            : Colors.black,
                      );
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '/' || x == 'x' || x == '-' || x == '+' || x == '=') {
      return true;
    }
    return false;
  }
}
