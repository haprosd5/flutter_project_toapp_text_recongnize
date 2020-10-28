

part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}
class TodoGetEvent extends TodoEvent {

  @override
  // TODO: implement props
  List<Object> get props => [];
}
class TodoAddEvent extends TodoEvent {
  final String title;
  final DateTime datetime;
  TodoAddEvent({this.title, this.datetime});
  @override
  // TODO: implement props
  List<Object> get props => [title, datetime];
}

class TodoEditEvent extends TodoEvent {

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class TodoDeleteEvent extends TodoEvent {
  final int id;
  TodoDeleteEvent({this.id});
  @override
  // TODO: implement props
  List<Object> get props => [id];
}
