import 'package:task/data/model/taskModel.dart';

class TaskStateBloc {
  final List<TaskModel> list;
  TaskStateBloc(this.list);
}

class TaskStateInitial extends TaskStateBloc {
  TaskStateInitial() : super([]);
}

class TaskUpdateBloc extends TaskStateBloc {
  TaskUpdateBloc(super.list);
}
