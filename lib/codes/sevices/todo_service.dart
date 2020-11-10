import 'package:intl/intl.dart';
import 'package:projecttodoapp/codes/dbs/database.dart';
import 'package:projecttodoapp/codes/entitys/todo_entity.dart';

class TodoService {
  const TodoService({this.db}) : assert(db != null);
  final AppDatabase db;

  Future<bool> getAddTodo(String todoName, String time) async {
    if (todoName != '' || todoName != null) {
      await db.todoRepositoryDao.insertItem(TodoEntity(
          title: toBeginningOfSentenceCase(todoName),
          status: 1,
          createdAt: time,
          updateAt: time));
      return true;
    }
    return false;
  }

  Future<List<TodoEntity>> getLoadAllTodo() async {
    List<TodoEntity> listAllTodo = [];
    try {
      listAllTodo = await db.todoRepositoryDao.getAll();
      return listAllTodo;
    } on Error {
      return listAllTodo;
    }
  }

  Future<bool> removeAllDataTodo(List<TodoEntity> listTodo) async {
    try {
      listTodo.forEach((element) {
        db.todoRepositoryDao.deleteItem(element);
      });
      return true;
    } on Error {
      print('loi roi');
      return false;
    }
  }

  Future<bool> removeTodoId(int id) async {
    try {
      db.todoRepositoryDao.deleteItem(await db.todoRepositoryDao.getById(id));
      return true;
    } on Error {
      print('loi roi');
      return false;
    }
  }

  Future<bool> editTodo(TodoEntity todo) async {
    try {
      await db.todoRepositoryDao.updateItem(todo);
      return true;
    } on Error {
      print('loi roi');
      return false;
    }
  }

  static String mapStatus(int inputStatus) {
    String status;
    switch (inputStatus) {
      case 1:
        status = 'Suceess';
        break;
      case 2:
        status = 'Waitting';
        break;
      case -1:
        status = 'Delay';
        break;
    }
    return status;
  }
}
