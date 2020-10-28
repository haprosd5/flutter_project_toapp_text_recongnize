import 'package:floor/floor.dart';

class EntityBase {
   EntityBase(this.id, this.createdAt, this.updateAt);

   @PrimaryKey(autoGenerate: true)
   final int id;

   final String createdAt;
   final String updateAt;
}


enum Status {
   complete, // 0
   wait, //1
   delay, //-1
}