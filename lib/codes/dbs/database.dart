import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:projecttodoapp/codes/entitys/todo_entity.dart';
import 'package:projecttodoapp/codes/repositories/todo_repository.dart';

part 'database.g.dart';

@Database(version: 1, entities: [TodoEntity])
abstract class AppDatabase extends FloorDatabase {
  TodoRepositoryDao get todoRepositoryDao;
}
