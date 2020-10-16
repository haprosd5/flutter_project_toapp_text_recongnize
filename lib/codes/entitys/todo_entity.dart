import 'package:floor/floor.dart';

import 'entity_base.dart';

@Entity(tableName: 'Todos')
class TodoEntity extends EntityBase {
  TodoEntity(
      {int id, String createdAt, String updateAt, this.title, this.status})
      : super(id, createdAt, updateAt);

  final String title;
  final int status;
}

