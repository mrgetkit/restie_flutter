import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:restie/constants.dart';
import 'package:restie/models/user_model.dart';

class ApiService {
  //? future function that will make the api calls
  //? with the return as a list of our data model
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndPoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> _model = userModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
