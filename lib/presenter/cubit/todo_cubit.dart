import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../infra/models/todo.dart';
import '../../infra/repositories/repository.dart';
part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final Repository repository;

  TodoCubit({required this.repository}) : super(TodosInitial());

  void fetchTodos() {
    print("Entrou no Cubit");
    repository.fetchTodos().then((todos) {
      emit(TodosLoaded(todos: todos));
    }).onError((error, stackTrace) {
      emit(TodosError(message: error.toString()));
    });
  }
}
