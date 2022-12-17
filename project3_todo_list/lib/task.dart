class Task {
  String? id;
  String? task;
  bool isDone;

  Task({required this.id, required this.task, this.isDone = false});

  static List<Task> toDoList() {
    return [
      Task(id: '1', task: 'Eat'),
      Task(id: '2', task: 'Workout'),
      Task(id: '3', task: 'Study')
    ];
  }
}
