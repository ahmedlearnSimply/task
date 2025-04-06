import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/data/bloc/task_event.dart';
import 'package:task/data/bloc/task_states.dart';
import 'package:task/data/cubit/task_states.dart';

class TaskBloc extends Bloc<TaskEvent, TaskStateBloc> {
  TaskBloc() : super(TaskStateInitial());
}
