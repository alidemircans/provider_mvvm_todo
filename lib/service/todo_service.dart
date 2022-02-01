import 'dart:convert';

import 'package:todo/helper/constants.dart';
import 'package:todo/model/todo_model.dart';
import 'package:todo/service/base/todo_service_base.dart';
import 'package:http/http.dart' as http;

class TodoApiService implements TodoService {
  String _baseUrl = Constants.TODO_LIST_API_URL;
  @override
  Future<List<TodoModel?>> getAllTodos() async {
    List<TodoModel?> todos = [];
    try {
      Uri uri = Uri.parse(_baseUrl);
      var response = await http.get(
        uri,
        headers: Constants.getDefaultHeaders(),
      );

      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        for (var todo in result) {
          todos.add(TodoModel.fromJson(todo));
        }
      } else {
        print(
            "TodoApiService /getAllTodos APICALLERROR=> ${response.statusCode}");
      }
    } catch (e) {
      print("TodoApiService /getAllTodos $e ");
    }
    return todos;
  }

  @override
  Future<List<TodoModel?>> getTodos(userId) async {
    List<TodoModel?> todos = [];
    try {
      Uri uri = Uri.parse(_baseUrl + "/?userId=$userId");
      var response = await http.get(
        uri,
        headers: Constants.getDefaultHeaders(),
      );

      if (response.statusCode == 200) {
        var result = json.decode(response.body);
        for (var todo in result) {
          todos.add(TodoModel.fromJson(todo));
        }
      } else {
        print(
            "TodoApiService /getAllTodos APICALLERROR=> ${response.statusCode}");
      }
    } catch (e) {
      print("TodoApiService /getAllTodos $e ");
    }
    return todos;
  }
}
