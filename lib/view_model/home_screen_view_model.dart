import 'package:flutter/material.dart';
import 'package:todo/helper/locator.dart';
import 'package:todo/model/todo_model.dart';
import 'package:todo/model/user_model.dart';
import 'package:todo/repository/todo_repository.dart';
import 'package:todo/repository/user_repository.dart';

enum UserEnum { Loading, Error, Idle }
enum TodoEnum { Loading, Error, Idle }

class HomeScreenViewModel extends ChangeNotifier {
  HomeScreenViewModel() {
    getAllUser();
    getTodo();
  }

  UserEnum userEnum = UserEnum.Idle;
  TodoEnum todoEnum = TodoEnum.Idle;

  UserRepository _userRepository = locator<UserRepository>();
  TodoRepository _todoRepository = locator<TodoRepository>();

  List<UserModel?> users = [];
  List<TodoModel?> todos = [];

  int? selecetedUserId;

  changeSelecetedUser(id) async {
    selecetedUserId = id;
    todos.clear();
    await getTodo();
    notifyListeners();
    
  }

  getAllUser() async {
    try {
      userEnum = UserEnum.Loading;
      notifyListeners();

      users = await _userRepository.getAllUser();
      userEnum = UserEnum.Idle;
      notifyListeners();
    } catch (e) {
      userEnum = UserEnum.Error;
      notifyListeners();
      print("HomeScreenViewModel/getAllUser $e");
    }
  }

  getTodo() async {
    try {
      todoEnum = TodoEnum.Loading;
      notifyListeners();

      todos = await _todoRepository
          .getTodos(selecetedUserId == null ? 1 : selecetedUserId);
      todoEnum = TodoEnum.Idle;
      notifyListeners();
    } catch (e) {
      todoEnum = TodoEnum.Error;
      notifyListeners();
      print("HomeScreenViewModel/getAllTodo $e");
    }
  }
}
