import 'package:dio/dio.dart';
import 'package:todo_list/app/models/todo_model.dart';

class TodoRepository {
  late Dio dio;
  final url = 'https://jsonplaceholder.typicode.com/todos';

  TodoRepository([Dio? client]) {
    dio = client ?? Dio();
  }

  Future<List<TodoModel>> fecthTodos() async {
    final response = await dio.get(url);
    final list = response.data as List;

    List<TodoModel> todos =
        list.map((json) => TodoModel.fromJson(json)).toList();

    return todos;
  }
}
