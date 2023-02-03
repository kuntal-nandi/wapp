import '../Game Model/result_number_model.dart';

class GameData{
  GameData._();
  static List<ResultNumberModel> numbersToSelect =[ResultNumberModel(num: 11),ResultNumberModel(num: 5),ResultNumberModel(num: 2)];
  static List<ResultNumberModel> randomNumbers=[
    ResultNumberModel(num: 8),
    ResultNumberModel(num: 11),
    ResultNumberModel(num: 2),
    ResultNumberModel(num: 6),
    ResultNumberModel(num: 9),
    ResultNumberModel(num: 5),
    ResultNumberModel(num: 14),
    ResultNumberModel(num: 13),
    ResultNumberModel(num: 10),
    ResultNumberModel(num: 1),
  ];
  static int selectedNumber=99;
  static List<bool> lives=[true,true,true];
  static int totalTap=0;
  static int correctSelection = 0;
}