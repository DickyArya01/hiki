import 'dart:convert';

import 'package:hiki/app/data/models/futsal.dart';
import 'package:http/http.dart' as http;
class Service{
  // String baseUrl = "http://10.0.2.2:5000/futsal";
  String baseUrl = "https://reqres.in/api/users?page=2";
  Future<List<User>> getData() async{
    var response = await http.get(Uri.parse(baseUrl));
    if(response.statusCode == 200){
      List jsonResponse = json.decode(response.body)["data"];
      print(response.body);
      return jsonResponse.map((e) => User.fromJson(e)).toList();
    }else {
      throw Exception('Failed to load data');
    }
  }


}