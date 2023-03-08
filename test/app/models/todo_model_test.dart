import 'package:flutter_test/flutter_test.dart';
import 'package:todo_list/app/models/todo_model.dart';

main() {
  final mockedJson = {
    "userId": 1,
    "id": 1,
    "title": "example",
    "completed": false
  };
  final mockedModel = TodoModel(
    userId: 1,
    id: 1,
    title: "example",
    completed: false,
  );

  test('should call fromJson', () {
    final model = TodoModel.fromJson(mockedJson);
    expect(model.title, mockedModel.title);
  });

  test('should call toJson', () {
    final json = mockedModel.toJson();
    expect(json, mockedJson);
  });
}
