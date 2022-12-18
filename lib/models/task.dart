class Task {
  String taskName;
  bool? isDone;
  Task({required this.taskName, this.isDone = false});

  Map<String, dynamic> toMap() {
    return {'taskName': taskName, 'isDone': isDone};
  }
}
