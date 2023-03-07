import 'package:todo_list/app/models/todo_model.dart';
import 'package:todo_list/app/repositories/todo_repository.dart';

class HomeController {
  List<TodoModel> todos = [];
  HomeState state = HomeState.start;

  late TodoRepository _repository;

  HomeController([TodoRepository? repository]) {
    _repository = repository ?? TodoRepository();
  }

  Future<void> start() async {
    state = HomeState.load;

    try {
      todos = await _repository.fecthTodos();
      state = HomeState.success;
    } catch (error) {
      state = HomeState.error;
    }
  }
}

enum HomeState { start, load, success, error }
