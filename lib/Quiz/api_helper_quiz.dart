import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wapp/Quiz/quiz_data_model.dart';


class QuizApiService{
  static Future<List<QuizModel>> getQuizData()async{
    const String apiUrl='https://the-trivia-api.com/api/questions';
    print('started api calling..........');
    http.Response response = await http.get(Uri.parse(apiUrl));
    List<QuizModel> quizData = [];
    print("response:--------------- ${response.statusCode}");
    if(response.statusCode==200){
      List<dynamic> res = json.decode(response.body);
      print('@@@@@@@@@@@@@@@@@@ ${res.toString()}');
      for (var i = 0; i < res.length; i++) {
        var data = QuizModel.fromJson(res[i]);
        print(data.correctAnswer);
        data.incorrectAnswers?.add(data.correctAnswer!);

        quizData.add(data);
      }
      print('+++++++++++++++++++++ ${quizData.length}');
      print('+++++++++++++++++++++ ${quizData[0].incorrectAnswers?.length}');
      print('********************* ${quizData[1].incorrectAnswers}');
      print('%%%%%%%%%%%%%%%%%%%% ${quizData[0].question}');
      return quizData;
    }
    else{
      return [];
    }
  }
}