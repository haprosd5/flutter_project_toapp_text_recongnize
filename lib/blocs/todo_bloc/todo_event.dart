part of 'todo_bloc.dart';

abstract class TodoEvent extends Equatable {
  const TodoEvent();
}

class TodoAddEvent extends TodoEvent {
  @override
  // TODO: implement props
  List<Object> get props => [];
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
