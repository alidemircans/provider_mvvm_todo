
import 'package:todo/base/todo_base.dart';
import 'package:todo/helper/locator.dart';
import 'package:todo/model/todo_model.dart';
import 'package:todo/service/base/todo_service_base.dart';
import 'package:todo/service/todo_service.dart';

class TodoRepository implements TodoBase {
  TodoService _service = locator<TodoApiService>();

  @override
  Future<List<TodoModel?>> getAllTodos()async {
   return await _service.getAllTodos();
  }

  @override
  Future< List<TodoModel?>> getTodos(userId) async{
    return await _service.getTodos(userId);
  }

 

}
