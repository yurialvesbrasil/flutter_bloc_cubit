import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_cubit/presenter/router.dart';

import '../../infra/models/todo.dart';
import '../cubit/todo_cubit.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  Widget _buildList(List<Todo> list) {
    return ListView.builder(
      itemCount: list.length,
      itemBuilder: (_, index) {
        var item = list[index];
        return Dismissible(
            key: Key("${item.id}"),
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  border: Border(bottom: BorderSide(color: Colors.grey))),
              child: Row(
                children: [
                  Text(item.todoMessage),
                ],
              ),
            ));
      },
    );
  }

  @override
  initState() {
    super.initState();
    BlocProvider.of<TodoCubit>(context).fetchTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Todos"),
          actions: [
            InkWell(
              onTap: () => Navigator.pushNamed(context, ADD_TODO_ROUTE),
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Icon(Icons.add),
              ),
            )
          ],
        ),
        body: BlocBuilder<TodoCubit, TodoState>(builder: (context, state) {
          if (state is TodosInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TodosLoaded) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildList(state.todos),
            );
          } else {
            return Center(
              child: Text((state as TodosError).message),
            );
          }
        }));
  }
}
