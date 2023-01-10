import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Data Model/data_model.dart';

class ApiService{
  static Future<List<Articles>> getAllData()async{
    const String apiUrl='https://newsapi.org/v2/top-headlines?country=in&apiKey=c1d4c95ab73c4176895d219c2f66da77';
    print('start api calling..........');
    http.Response response = await http.get(Uri.parse(apiUrl));
      List<Articles> newsData = [];
      print("response:--------------- ${response.statusCode}");
      if(response.statusCode==200){
        Map<String, dynamic> res = json.decode(response.body);
        print('@@@@@@@@@@@@@@@@@@ ${res.toString()}');
        for (var i = 0; i < res["articles"].length; i++) {
          var data = Articles.fromJson(res["articles"][i]);
          newsData.add(data);
        }
        print('^^^^^^^^^^^^^^^^ ${newsData.length}');
        return newsData;
      }
      else{
        return [];
      }
}
}
