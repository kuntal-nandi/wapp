import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '../Model/user_data_model.dart';

class UserRepository {
  static Future<List<UserModel>> getUserData(
      {required int limit, required int pageNo}) async {
    String apiUrl =
        'https://jsonplaceholder.typicode.com/posts?_limit=$limit&_page=$pageNo';
    Response response = await http.get(Uri.parse(apiUrl));
    List<UserModel> userData = [];
    if (response.statusCode == 200) {
      List<dynamic> res = json.decode(response.body);
      for (var i = 0; i < res.length; i++) {
        var data = UserModel.fromJson(res[i]);
        userData.add(data);
      }
      return userData;
    } else {
      return [];
    }
  }
}
