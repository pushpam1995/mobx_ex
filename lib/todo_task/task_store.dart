

import 'package:mobx/mobx.dart';

import 'model.dart';
part 'task_store.g.dart';

class Taskto = TodoTask with _$Taskto;

abstract class TodoTask with Store{

  @observable
  ObservableList<AbstractDataModel> TodoListValues = ObservableList<AbstractDataModel>.of([]);

  @observable
  ObservableList<AbstractDataModel> TodoListValuesCompleted = ObservableList<AbstractDataModel>.of([]);

  @observable
  ObservableList<AbstractDataModel> TodoListValuesNonCompleted = ObservableList<AbstractDataModel>.of([]);

  @action
  void AddTask(task){
    if(TodoListValues.isEmpty) {
      AbstractDataModel obj= AbstractDataModel(task: task);
      TodoListValues.add(
        AbstractDataModel(task: task),
      );
      TodoListValuesCompleted.clear();
     // TodoListValuesNonCompleted.add(obj);
    }
    else{
      TodoListValues.add(
        AbstractDataModel(task: task),
      );
      TodoListValues.forEach((element) {

        if(element.isComplete &&  !TodoListValuesCompleted.contains(element)){

          TodoListValuesCompleted.add(element);
        }
        else if(!element.isComplete &&  !TodoListValuesNonCompleted.contains(element))
          TodoListValuesNonCompleted.add(element);
      });

    }

    print('TodoListValues length  ${TodoListValues.length}');
    print('TodoListValuesCompleted length  ${TodoListValuesCompleted.length}');
    print('TodoListValuesNonCompleted length  ${TodoListValuesNonCompleted.length}');

  }
  @action
  void checkBox(index,obj) {
    AbstractDataModel ob=AbstractDataModel(task:obj.task,isComplete: !obj.isComplete);
    if(obj.isComplete){

      TodoListValuesCompleted.remove(obj);
      TodoListValuesNonCompleted.add(ob);
      TodoListValues.remove(obj);
      TodoListValues.add(ob,);
    }
    else{
      TodoListValuesNonCompleted.remove(obj);
      TodoListValuesCompleted.add(ob);
      TodoListValues.remove(obj);
      TodoListValues.add(ob,);
    }

  }

  @action
  void RemoveCompleted() {
   if(!TodoListValuesCompleted.isEmpty){
     TodoListValuesCompleted.forEach((element) {
       print("indx $element");
       TodoListValues.remove(element);
     });
     TodoListValuesCompleted.clear();
   }
  }

  @action
  void MarkAllComplete(){
    if(TodoListValuesCompleted.length!=TodoListValues.length){
      TodoListValues.forEach((element) {
        TodoListValues[TodoListValues.indexOf(element)].isComplete=true;
      });
      TodoListValuesNonCompleted.clear();
      TodoListValuesCompleted.clear();
      TodoListValues.forEach((element) {
        TodoListValuesCompleted.add(element);
      });
      TodoListValues.clear();
      TodoListValuesCompleted.forEach((element) {
        TodoListValues.add(element);
      });

    }
  }

  @action
  void RemoveListItem(obj){
    if(TodoListValues.contains(obj))
      TodoListValues.remove(obj);
    if(TodoListValuesCompleted.contains(obj))
      TodoListValuesCompleted.remove(obj);
    if(TodoListValuesNonCompleted.contains(obj))
      TodoListValuesNonCompleted.remove(obj);
  }

}