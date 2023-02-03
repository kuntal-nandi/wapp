// ignore_for_file: dead_code

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:wapp/game/Bloc/game_cubit.dart';

class TreeGame extends StatefulWidget {
  const TreeGame({Key? key}) : super(key: key);

  @override
  State<TreeGame> createState() => _TreeGameState();
}

class _TreeGameState extends State<TreeGame> {
  // List<ResultNumberModel> numbersToSelect = [
  //   ResultNumberModel(num: 11),
  //   ResultNumberModel(num: 5),
  //   ResultNumberModel(num: 2)
  // ];
  // List<ResultNumberModel> randomNumbers = [
  //   ResultNumberModel(num: 8),
  //   ResultNumberModel(num: 11),
  //   ResultNumberModel(num: 2),
  //   ResultNumberModel(num: 6),
  //   ResultNumberModel(num: 9),
  //   ResultNumberModel(num: 5),
  //   ResultNumberModel(num: 14),
  //   ResultNumberModel(num: 13),
  //   ResultNumberModel(num: 10),
  //   ResultNumberModel(num: 1),
  // ];
  // int selectedNumber = 99;
  // List<bool> isAlive = [true, true, true];
  // int totalTap = 0;

  // bool isWin=false;
  // bool isLoose=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<GameCubit, GameState>(
        builder: (context, state) {
          if (state is GameRunning) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 20),
                  child: Container(
                    color: Colors.grey.withOpacity(0.7),
                    margin: const EdgeInsets.all(8),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 40,
                              width: 200,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: 3,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return state.lives[index] == false
                                        ? const Icon(
                                            Icons.favorite_border,
                                            size: 30,
                                            color: Colors.black,
                                          )
                                        : Icon(
                                            Icons.favorite,
                                            size: 30,
                                            color: Colors.red.shade900,
                                          );
                                  }),
                            ),
                            InkWell(
                              onTap: () {
                                BlocProvider.of<GameCubit>(context).resetGame();
                              },
                              child: Container(
                                  height: 35,
                                  width: 35,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.red),
                                  child: const Icon(
                                    Icons.restart_alt_sharp,
                                    size: 30,
                                    color: Colors.white,
                                  )),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: SizedBox(
                            height: 60,
                            width: 180,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: state.numbersToSelect.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Container(
                                      margin: const EdgeInsets.only(left: 8),
                                      height: 45,
                                      width: 45,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: state.numbersToSelect[index].isSelected
                                            ? Colors.green
                                            : Colors.white,
                                        border: Border.all(
                                            width: 2, color: Colors.blue),
                                      ),
                                      child: Text(
                                        state.numbersToSelect[index].num.toString(),
                                        style: const TextStyle(
                                            fontSize: 25,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700),
                                      ));
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Stack(
                  children: [
                    for (int i = 0; i < state.randomNumbers.length; i++)
                      Container(
                          height: 45,
                          width: 45,
                          margin: getMargin(i),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: state.randomNumbers[i].isSelected
                                ? Colors.green
                                : state.randomNumbers[i].isWrong
                                ? Colors.redAccent : Colors.white,
                            border: Border.all(width: 2, color: Colors.blue),
                          ),
                          child: InkWell(
                            onTap: state.totalTap < 9
                                ? () {
                                    BlocProvider.of<GameCubit>(context).selectNumber(selectedNumberIndex: i);
                                  }
                                : null,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                state.randomNumbers[i].num.toString(),
                                style: const TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ))
                  ],
                )
              ],
            );
          } else if (state is GameWin) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.network('https://assets1.lottiefiles.com/packages/lf20_xldzoar8.json',
                      width: double.infinity,fit: BoxFit.fitWidth,animate: true),
                  const SizedBox(height: 30,),
                  Text('Congratulation',style: TextStyle(
                    fontSize: 50,
                    color: Colors.green.shade800,
                    fontWeight: FontWeight.w700
                  ),),
                  const SizedBox(height: 10),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(8),
                          textStyle: const TextStyle(fontSize: 28,wordSpacing: 2,fontWeight: FontWeight.w600),
                          backgroundColor:  Colors.green.shade900
                      ),
                      onPressed: (){
                        BlocProvider.of<GameCubit>(context).resetGame();
                      },
                      icon: const Icon(Icons.replay,size: 32,),
                      label: const Text('Play Again'))
                ],
              ),
            );
          } else if (state is GameLoss) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.network('https://assets9.lottiefiles.com/packages/lf20_9xRnlw.json',
                      width: double.infinity,fit: BoxFit.fitWidth,animate: true),
                  const SizedBox(height: 30,),
                  ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.all(8),
                          textStyle: const TextStyle(fontSize: 28,wordSpacing: 2,fontWeight: FontWeight.w600),
                          backgroundColor:  Colors.purple.shade800
                      ),
                      onPressed: (){
                        BlocProvider.of<GameCubit>(context).resetGame();
                      },
                      icon: const Icon(Icons.replay,size: 32,),
                      label: const Text('Replay Game'))
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }

  EdgeInsetsGeometry getMargin(int index) {
    switch (index) {
      case 0:
        {
          return const EdgeInsets.only(left: 80, right: 0, top: 0, bottom: 0);
        }
        break;
      case 1:
        {
          return const EdgeInsets.only(left: 0, right: 150, top: 60, bottom: 0);
        }
        break;

      case 2:
        {
          return const EdgeInsets.only(left: 120, right: 0, top: 90, bottom: 0);
        }
        break;
      case 3:
        {
          return const EdgeInsets.only(
              left: 100, right: 70, top: 240, bottom: 0);
        }
        break;
      case 4:
        {
          return const EdgeInsets.only(
              left: 90, right: 60, top: 180, bottom: 0);
        }
        break;
      case 5:
        {
          return const EdgeInsets.only(left: 0, right: 30, top: 200, bottom: 0);
        }
        break;
      case 6:
        {
          return const EdgeInsets.only(
              left: 180, right: 0, top: 250, bottom: 0);
        }
        break;
      case 7:
        {
          return const EdgeInsets.only(left: 0, right: 70, top: 300, bottom: 0);
        }
        break;
      case 8:
        {
          return const EdgeInsets.only(
              left: 20, right: 70, top: 140, bottom: 0);
        }
        break;
      case 9:
        {
          return const EdgeInsets.only(
              left: 100, right: 90, top: 360, bottom: 0);
        }
        break;
      default:
        {
          return EdgeInsets.only(
              left: Random().nextInt(100).toDouble(),
              right: Random().nextInt(100).toDouble(),
              top: Random().nextInt(100).toDouble(),
              bottom: Random().nextInt(100).toDouble());
        }
    }
  }
}
