import 'package:projecttodoapp/codes/dbs/database.dart';
import 'package:projecttodoapp/codes/entitys/todo_entity.dart';

class TodoService {
  const TodoService({this.db}) : assert(db != null);
  final AppDatabase db;

  Future<bool> getAddTodo(String todoName, DateTime time) async {
    if (todoName != '' || todoName != null) {
      await db.todoRepositoryDao.insertItem(
          TodoEntity(title: todoName, status: 1, createdAt: time.toString()));
      return true;
    }
    return false;
  }

}
