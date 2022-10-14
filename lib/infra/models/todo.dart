// ignore_for_file: public_member_api_docs, sort_constructors_first
class Todo {
  String todoMessage;
  bool isCompleted;
  int id;

  Todo.fromJson(Map json)
      : todoMessage = json["todo"],
        isCompleted = (json["isCompleted"] == "true"),
        id = int.parse(json["id"]);
}
