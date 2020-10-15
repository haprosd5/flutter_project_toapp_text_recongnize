part of 'todo_bloc.dart';

abstract class TodoState extends Equatable {
  const TodoState();
}

class TodoInitial extends TodoState {
  @override
  List<Object> get props => [];
}
class TodoAdding extends TodoState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class TodoAddSuccess extends TodoState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class TodoAddError extends TodoState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class TodoEditing extends TodoState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class TodoEditSuccess extends TodoState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class TodoEditError extends TodoState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class TodoDeleting extends TodoState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class TodoDeleteSuccess extends TodoState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}
class TodoDeleteError extends TodoState {
  @override
  // TODO: implement props
  List<Object> get props => [];
}