import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:todo_list/app/controllers/home_controller.dart';
import 'package:todo_list/app/models/todo_model.dart';
import 'package:todo_list/app/repositories/todo_repository.dart';

import 'home_controller_test.mocks.dart';

@GenerateMocks([TodoRepository])
main() {
  final repository = MockTodoRepository();
  final controller = HomeController(repository);

  test('should get ToDos from repository', () async {
    final mockedList = [
      TodoModel(userId: 1, id: 1, title: 'title', completed: false),
      TodoModel(userId: 2, id: 2, title: 'title', completed: false),
    ];
    
    when(repository.fecthTodos()).thenAnswer((_) async => mockedList);

    await controller.start();
    expect(controller.todos.isNotEmpty, true);
  });
}
