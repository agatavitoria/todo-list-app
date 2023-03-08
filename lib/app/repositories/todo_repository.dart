import 'package:dio/dio.dart';
import 'package:todo_list/app/models/todo_model.dart';

import '../config/api.dart';

class TodoRepository {
  late Dio dio;

  TodoRepository([Dio? client]) {
    dio = client ?? Dio();
  }

  Future<List<TodoModel>> fecthTodos() async {
    final response = await dio.get(Api().url);
    final list = response.data as List;

    List<TodoModel> todos =
        list.map((json) => TodoModel.fromJson(json)).toList();

    return todos;
  }
}
