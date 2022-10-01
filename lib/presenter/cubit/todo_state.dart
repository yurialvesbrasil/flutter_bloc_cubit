part of 'todo_cubit.dart';

@immutable
abstract class TodoState {}

class TodosInitial extends TodoState {}

class TodosLoaded extends TodoState {
  final List<Todo> todos;

  TodosLoaded({required this.todos});
}

class TodosError extends TodoState {
  final String message;

  TodosError({required this.message});
}
