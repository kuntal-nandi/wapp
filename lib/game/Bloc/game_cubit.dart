import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:wapp/game/Data%20Provider/tree_game_data_provider.dart';

import '../Game Model/result_number_model.dart';

part 'game_state.dart';

class GameCubit extends Cubit<GameState> {
  GameCubit(
      {required List<bool> lives,
      required List<ResultNumberModel> numbersToSelect,
      required List<ResultNumberModel> randomNumbers,
      required int totalTap})
      : super(GameRunning(
          lives: lives,
          numbersToSelect: numbersToSelect,
          randomNumbers: randomNumbers,
          totalTap: totalTap,
        ));
  void selectNumber({required int selectedNumberIndex}) {

    GameData.selectedNumber = GameData.randomNumbers[selectedNumberIndex].num;
    GameData.totalTap = GameData.totalTap + 1;
    if(GameData.totalTap==3){
      GameData.lives[0] = false;
    }
    else if(GameData.totalTap==6){
      GameData.lives[1] = false;
    }
    else if(GameData.totalTap==9){
      GameData.lives[2] = false;
    }
    else{

    }
      for (int n = 0;
      n < GameData.numbersToSelect.length;
      n++) {
        if (GameData.selectedNumber ==
            GameData.numbersToSelect[n].num) {
          GameData.correctSelection=GameData.correctSelection+1;
          GameData.numbersToSelect[n].isSelected = true;
          GameData.randomNumbers[selectedNumberIndex].isSelected = true;
        }
        else{
          GameData.randomNumbers[selectedNumberIndex].isWrong = true;
        }
      }

      if(GameData.correctSelection==3){
        emit(GameWin());
      }
      else if(GameData.correctSelection<3 && GameData.totalTap==9){
        if(GameData.lives[0]==false && GameData.lives[1]==false && GameData.lives[2]==false){
          emit(GameLoss());
        }
      }
      else if(GameData.correctSelection<3 && (GameData.totalTap==3 || GameData.totalTap==6)){
        startAgainGame();
      }
      else{
        emit(GameRunning(
            totalTap: GameData.totalTap,
            numbersToSelect: GameData.numbersToSelect,
            lives: GameData.lives,
            randomNumbers: GameData.randomNumbers));
      }

  }

  void startAgainGame() {
    GameData.correctSelection=0;
    GameData.randomNumbers = [];
    for (int i = 0; i < 10; i++) {
      int num = Random().nextInt(20);
      GameData.randomNumbers.add(
        ResultNumberModel(num: num),
      );
    }
    GameData.numbersToSelect = [];
    for (int i = 0; i < 3; i++) {
      int select = Random().nextInt(9);
      GameData.numbersToSelect
          .add(ResultNumberModel(num: GameData.randomNumbers[select].num));
    }
    emit(GameRunning(
        totalTap: GameData.totalTap,
        numbersToSelect: GameData.numbersToSelect,
        lives: GameData.lives,
        randomNumbers: GameData.randomNumbers));
  }

  void resetGame() {
    GameData.totalTap = 0;
    GameData.selectedNumber=99;
    GameData.correctSelection=0;
    GameData.lives = [true, true, true];
    GameData.randomNumbers = [];
    for (int i = 0; i < 10; i++) {
      int num = Random().nextInt(20);
      GameData.randomNumbers.add(
        ResultNumberModel(num: num),
      );
    }
    GameData.numbersToSelect = [];
    for (int i = 0; i < 3; i++) {
      int select = Random().nextInt(9);
      GameData.numbersToSelect
          .add(ResultNumberModel(num: GameData.randomNumbers[select].num));
    }
    emit(GameRunning(
        totalTap: GameData.totalTap,
        numbersToSelect: GameData.numbersToSelect,
        lives: GameData.lives,
        randomNumbers: GameData.randomNumbers));
  }
}
