import 'package:flutter/material.dart';
import 'package:todo_list/app/models/todo_model.dart';
import 'package:todo_list/app/repositories/todo_repository.dart';

class HomeController {
  List<TodoModel> todos = [];
  final state = ValueNotifier<HomeState>(HomeState.start);

  late TodoRepository _repository;

  HomeController([TodoRepository? repository]) {
    _repository = repository ?? TodoRepository();
  }

  Future<void> start() async {
    state.value = HomeState.load;

    try {
      todos = await _repository.fecthTodos();
      state.value = HomeState.success;
    } catch (error) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { start, load, success, error }
