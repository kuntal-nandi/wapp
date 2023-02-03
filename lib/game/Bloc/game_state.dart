part of 'game_cubit.dart';

@immutable
abstract class GameState {}

class GameRunning extends GameState {
  List<ResultNumberModel> numbersToSelect;
  List<ResultNumberModel> randomNumbers;
  List<bool> lives;
  int totalTap;
  GameRunning(
      {required this.totalTap,
      required this.numbersToSelect,
      required this.lives,
      required this.randomNumbers});
}

class GameWin extends GameState {}

class GameLoss extends GameState {}
