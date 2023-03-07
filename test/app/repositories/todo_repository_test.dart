import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_list/app/repositories/todo_repository.dart';

import 'todo_repository_test.mocks.dart';

@GenerateMocks([Dio])
main() {
  final dio = MockDio();
  final repository = TodoRepository(dio);

  test('should get TodoModel list', () async {
    String jsonData = '''
    [
      {
        "userId": 1,
        "id": 1,
        "title": "delectus aut autem",
        "completed": false
      }
    ]
    ''';
    when(dio.get('https://jsonplaceholder.typicode.com/todos')).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(path: '/'),
        data: jsonDecode(jsonData),
      ),
    );
    final list = await repository.fecthTodos();
    expect(list[0].id, 1);
  });
}
