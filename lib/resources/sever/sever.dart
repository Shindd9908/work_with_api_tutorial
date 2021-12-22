import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:the_movie_db/models/flutter_api_2/user_model.dart';

Future<List<UserModel>?> userRequestSever() async {
  Uri url = Uri.parse("https://jsonplaceholder.typicode.com/users");
  var responce = await http.get(url);

  try {
    if (responce.statusCode == 200) {
      //UserModel userModel = UserModel.fromJson(jsonDecode(responce.body));
      List<UserModel> listUserModel = List<UserModel>.from(
          jsonDecode(responce.body).map((x) => UserModel.fromJson(x)));
      return listUserModel;
    }
  } on Exception catch (e) {
    print(e);
  }
}
