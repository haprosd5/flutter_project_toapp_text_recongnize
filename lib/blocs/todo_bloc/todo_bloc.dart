import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:projecttodoapp/codes/entitys/todo_entity.dart';
import 'package:projecttodoapp/codes/sevices/todo_service.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  final TodoService _todoService;

  TodoBloc(this._todoService) : super(TodoInitial());

  @override
  Stream<TodoState> mapEventToState(
    TodoEvent event,
  ) async* {
    /**  ! Xử lý logic của bloc_todo */
    if (event is TodoGetEvent) {
      /* sự kiện load toàn bộ todo*/
      try {
        yield TodoLoading();

        final List<TodoEntity> listAllTodo =
            await _todoService.getLoadAllTodo();

       // remove toan bo data bang todo _todoService.removeAllDataTodo(listAllTodo);
        _todoService.removeAllDataTodo(listAllTodo);
        // hien thi list item
        print(listAllTodo);

        yield TodoLoaded(list: listAllTodo);
      } on Error {
        yield TodoLoadError('Load toan bo danh sach bi loi');
      }
    } else if (event is TodoAddEvent) {
      /* sự kiện thêm một todo*/
      try {
        yield TodoAdding();
        String time = (event.datetime == null) ? '0:00' : event.datetime;
        final bool check = await _todoService.getAddTodo(event.title, time);

        if (check) {
          yield TodoAddSuccess();
          final List<TodoEntity> listAllTodo =
              await _todoService.getLoadAllTodo();
          yield TodoLoaded(list: listAllTodo);
        } else
          yield TodoAddError('Load toan bo danh sach bi loi');
      } on Error {
        yield TodoAddError('Load toan bo danh sach bi loi');
      }
    }
  }
}
