import 'package:floor/floor.dart';
import 'package:todo_list_base/model/todo.dart';

// Todo : add the TodoDao class
@dao
abstract class TodoDao {
  Stream<List<Todo>> observeTodos(int pid);
  Stream<Todo?> getTodo(int id);
  Future<void> addTodo(Todo todo);
  Future<void> updateTodo(Todo todo);
  Future<void> deleteTodo(Todo todo);
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> upsertTodo(Todo todo);
}
