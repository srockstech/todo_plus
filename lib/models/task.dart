class Task {
  final String taskName;
  bool isDone;
  Task({required this.taskName, this.isDone = false});
  void toggleIsDone() {
    isDone = !isDone;
  }
}
