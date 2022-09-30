import 'package:flutter/material.dart';
import 'package:flutter_bloc_cubit/presentation/screens/todos_screen.dart';

import 'screens/add_todo_screen.dart';
import 'screens/edit_todo_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const TodosScreen());
      case "/edit_todo":
        return MaterialPageRoute(builder: (_) => const EditTodoScreen());
      case "/add_todo":
        return MaterialPageRoute(builder: (_) => const AddTodoScreen());
      default:
        return MaterialPageRoute(builder: (_) => const TodosScreen());
    }
  }
}
