import 'package:todo_list/app/models/todo_model.dart';
import 'package:todo_list/app/repositories/todo_repository.dart';

class HomeController {
  List<TodoModel> todos = [];
  late TodoRepository _repository;

  HomeController([TodoRepository? repository]) {
    _repository = repository ?? TodoRepository();
  }

  Future<void> start() async {
    todos = await _repository.fecthTodos();
  }
}
