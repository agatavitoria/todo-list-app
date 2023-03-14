import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_list/app/common/app_vars.dart';
import 'package:todo_list/app/repositories/todo_repository.dart';

import 'todo_repository_test.mocks.dart';

@GenerateMocks([Dio])
main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

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
    when(dio.get(AppVars.apiUrl)).thenAnswer(
      (_) async => Response(
        requestOptions: RequestOptions(path: '/'),
        data: jsonDecode(jsonData),
      ),
    );
    final list = await repository.fecthTodos();
    expect(list[0].id, 1);
  });
}
