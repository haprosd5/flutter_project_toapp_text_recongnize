import 'package:projecttodoapp/codes/dbs/database.dart';
import 'package:projecttodoapp/codes/entitys/todo_entity.dart';

class TodoService {
  const TodoService({this.db}) : assert(db != null);
  final AppDatabase db;

  Future<bool> getAddTodo(String todoName, String time) async {
    if (todoName != '' || todoName != null) {
      await db.todoRepositoryDao
          .insertItem(TodoEntity(title: todoName, status: 1, createdAt: time));
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

 /* Future<String> getSpeechToText(stt.SpeechToText _speech) async {
    String textToSpeech;
    bool available = await _speech.initialize(
      onStatus: (val) => print('onStatus: $val'),
      onError: (val) => print('onError: $val'),
    );
    if (available) {
      _speech.listen(onResult: (val) => {textToSpeech = val.recognizedWords});
      return textToSpeech;
    } else {
      _speech.stop();
      return 'No title Todo';
    }
  }*/
}
