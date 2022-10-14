import 'package:flutter_bloc_cubit/infra/datasources/network_service.dart';

import '../models/todo.dart';

class Repository {
  final NetworkService networkService;

  Repository({required this.networkService});

  Future<List<Todo>> fetchTodos() async {
    try {
      final todosRaw = await networkService.fetchTodos();
      return todosRaw.map((e) => Todo.fromJson(e)).toList();
    } catch (e) {
      throw Exception(e);
    }
  }
}
