// ignore_for_file: public_member_api_docs, sort_constructors_first
class Todo {
  String todoMessage;
  String isCompleted;
  int id;

  Todo.fromJson(Map json)
      : todoMessage = json["todo"],
        isCompleted = json["isCompleted"],
        id = json["id"];
}
