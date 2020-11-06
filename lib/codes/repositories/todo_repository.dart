import 'package:floor/floor.dart';
import 'package:projecttodoapp/codes/entitys/todo_entity.dart';

import 'repository_dao_abstract.dart';

@dao
abstract class TodoRepositoryDao extends IRepositoryDaoInterface<TodoEntity> {
  @Query('SELECT * FROM Todos WHERE id = :id')
  Future<TodoEntity> getById(int id);

  @Query('SELECT * FROM Todos ORDER BY id DESC')
  Future<List<TodoEntity>> getAll();

  @Query('SELECT * FROM Todos Where title = :temp')
  Future<List<TodoEntity>> getByText(String temp);
}
