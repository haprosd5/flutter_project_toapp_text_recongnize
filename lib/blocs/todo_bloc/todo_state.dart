part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();
}

class TodoInitial extends TodoState {
  @override
  List<Object> get props => [];
}

/*! loading */
class TodoLoading extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoLoaded extends TodoState {
  final List<TodoEntity> list;

  TodoLoaded({this.list});

  @override
  List<Object> get props => [list];
}

class TodoLoadError extends TodoState {
  final String message;

  const TodoLoadError(this.message);

  @override
  List<Object> get props => [message];
}

class TodoAdding extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoAddSuccess extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoAddError extends TodoState {
  final String message;

  const TodoAddError(this.message);

  @override
  List<Object> get props => [message];
}

class TodoEditing extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoEditSuccess extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoEditError extends TodoState {
  final String message;

  const TodoEditError(this.message);

  @override
  List<Object> get props => [message];
}

class TodoDeleting extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoDeleteSuccess extends TodoState {
  @override
  List<Object> get props => [];
}

class TodoDeleteError extends TodoState {
  final String message;

  const TodoDeleteError(this.message);

  @override
  List<Object> get props => [message];
}
