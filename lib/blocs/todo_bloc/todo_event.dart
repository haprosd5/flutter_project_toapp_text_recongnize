part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class TodoGetEvent extends TodoEvent {
  @override
  List<Object> get props => [];
}

class TodoAddEvent extends TodoEvent {
  final String title;
  final String datetime;

  TodoAddEvent({this.title, this.datetime});

  @override
  //
  List<Object> get props => [title, datetime];
}

class TodoEditEvent extends TodoEvent {
  final TodoEntity task;

  TodoEditEvent({this.task});

  @override
  //
  List<Object> get props => [task];
}

class TodoDeleteEvent extends TodoEvent {
  final int id;

  TodoDeleteEvent({this.id});

  @override
  //
  List<Object> get props => [id];
}
