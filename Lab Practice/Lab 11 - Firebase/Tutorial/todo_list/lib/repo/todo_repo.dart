import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_list/model/project.dart';
import 'package:todo_list/model/project_todo_status_counts.dart';
import 'package:todo_list/model/todo.dart';

class TodoListRepo {
  // final ProjectDao db;
  final CollectionReference projectRef;
  final CollectionReference todoRef;

  TodoListRepo({required this.projectRef, required this.todoRef});

  // projects
  Stream<List<Project>> observeProjects() =>
      projectRef.snapshots().map((snapshot) => snapshot.docs
          .map((doc) => Project.fromMap(doc.data() as Map<String, dynamic>))
          .toList());

  Future<Project?> getProjectById(String id) => projectRef.doc(id).get().then(
      (snapshot) => Project.fromMap(snapshot.data() as Map<String, dynamic>));

  Future<void> addProject(Project project) => projectRef.add(project.toMap());

  Future<void> updateProject(Project project) =>
      projectRef.doc(project.id).update(project.toMap());

  Future<void> deleteProject(Project project) =>
      projectRef.doc(project.id).delete();

  // todos

  Stream<List<Todo>> observeTodos(String projectId) => todoRef
      .where('pid', isEqualTo: projectId)
      .snapshots()
      .map((snapshot) => snapshot.docs
          .map((doc) => Todo.fromMap(doc.data() as Map<String, dynamic>))
          .toList());

  Future<Todo> getTodoById(String id) async {
    final snapshot = await todoRef.doc(id).get();
    return Todo.fromMap(snapshot.data() as Map<String, dynamic>);
  }

  Future<void> addTodo(Todo todo) => todoRef.add(todo.toMap());

  Future<void> updateTodo(Todo todo) =>
      todoRef.doc(todo.id).update(todo.toMap());
  Future<void> deleteTodo(Todo todo) => todoRef.doc(todo.id).delete();
  Stream<ProjectTodoStatusCounts?> getProjectTodosStatusCounts(
          String projectId) =>
      todoRef.where('pid', isEqualTo: projectId).snapshots().map((snapshot) {
        final todos = snapshot.docs
            .map((doc) => Todo.fromMap(doc.data() as Map<String, dynamic>))
            .toList();
        // print(todos);
        var counts = ProjectTodoStatusCounts(
          id: projectId,
          //ignore the case of status
          completedCount: todos
              .where((todo) => todo.status.toLowerCase() == 'completed')
              .length,
          pendingCount: todos
              .where((todo) => todo.status.toLowerCase() == 'pending')
              .length,
        );

        return counts;
      });
}
