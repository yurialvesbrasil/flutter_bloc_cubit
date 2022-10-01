import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../domain/repositories/repository.dart';
part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final Repository repository;

  TodoCubit(this.repository) : super(TodoInitial());

  void fetchTodos() {}
}
