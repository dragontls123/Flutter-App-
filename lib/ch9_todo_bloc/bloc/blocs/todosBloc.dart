import 'package:bloc/bloc.dart';
import '../events/events.dart';
import '../states/todosState.dart';

//우리가 만든 클래스를 등록하면.. 각 함수들을 이벤트 발생시점에 알아서 호출..
class TodosBloc extends Bloc<TodosEvent, TodosState>{
  //버전이 업되면서.. 초기 상태를 상위 클래스 생성자 호출로..
  //이벤트 발생에 의한 상태값 유지를 생성자에서..
  TodosBloc(): super(TodosState([])){
    //이벤트가 발생했다면..
    //event -  현재 발생한 이벤트 정보.. 여기서 이벤트 발생한 곳에서 넘긴 데이터 추출..
    //emit -  이벤트 발생에 의해 새로 만들어지는 상태를 발행하기 위해..
    on<AddTodoEvent>((event, emit){
      //state.todos - 과거의 상태...
      //과거의 상태를 변경하는 것이 아니라.. 변경사항을 적용한 새로운 상태를 만들어서 발행하는 것이다.
      //상태는 불변이다.. 새로운 상태를 만드는 것이다..
      //내부적으로 상태 불변성을 이용해 어떤 상태 데이터가 변경된 건지를 판단할 목적으로 불변...
      List<Todo> newTodos = List.from(state.todos)
        ..add(event.todo);
      emit(TodosState(newTodos));
    });

    on<DeleteTodoEvent>((event, emit){
      List<Todo> newTodos = List.from(state.todos)
        ..remove(event.todo);
      emit(TodosState(newTodos));
    });
    on<ToggleCompletedTodoEvent>((event, emit){
      List<Todo> newTodos = List.from(state.todos);
      int index = newTodos.indexOf(event.todo);
      newTodos[index].toggleComplete();
      emit(TodosState(newTodos));
    });
  }

  @override
  void onTransition(Transition<TodosEvent, TodosState> transition) {
    super.onTransition(transition);
    print(transition);
  }
}