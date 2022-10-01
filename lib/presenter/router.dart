// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit/infra/datasources/network_service.dart';
import 'package:flutter_bloc_cubit/presenter/screens/todos_screen.dart';
import '../infra/repositories/repository.dart';
import 'cubit/todo_cubit.dart';
import 'screens/add_todo_screen.dart';
import 'screens/edit_todo_screen.dart';

const ADD_TODO_ROUTE = "/add_todo";
const EDIT_TODO_ROUTE = "/edit_todo";
const TODO_ROUTE = "/";

class AppRouter {
  late Repository repository;

  AppRouter() {
    repository = Repository(networkService: NetworkService());
  }

  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case TODO_ROUTE:
        return MaterialPageRoute(
            builder: (_) => BlocProvider<TodoCubit>(
                create: (BuildContext context) =>
                    TodoCubit(repository: repository),
                child: const TodosScreen()));
      case EDIT_TODO_ROUTE:
        return MaterialPageRoute(builder: (_) => const EditTodoScreen());
      case ADD_TODO_ROUTE:
        return MaterialPageRoute(builder: (_) => const AddTodoScreen());
      default:
        return MaterialPageRoute(builder: (_) => const TodosScreen());
    }
  }
}
