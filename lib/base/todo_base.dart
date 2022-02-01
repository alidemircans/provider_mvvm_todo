
import 'package:todo/model/todo_model.dart';

abstract class TodoBase {
  Future< List<TodoModel?>> getTodos(userId);
  Future<List<TodoModel?>> getAllTodos();

}
