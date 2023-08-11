import '../states/todosState.dart';

//bloc 에 발생시킬 이벤트..
//이벤트 발생시키면서 bloc 에 전달할 데이터가 없다면 enum
//있다면 클래스로..
//event 에 B/L 추가 하지 않는다..
abstract class TodosEvent {}

class AddTodoEvent extends TodosEvent {
  Todo todo;
  AddTodoEvent(this.todo);
}
class DeleteTodoEvent extends TodosEvent {
  Todo todo;
  DeleteTodoEvent(this.todo);
}
class ToggleCompletedTodoEvent extends TodosEvent {
  Todo todo;
  ToggleCompletedTodoEvent(this.todo);
}