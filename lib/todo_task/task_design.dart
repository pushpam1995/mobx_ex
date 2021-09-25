import 'package:flutter/material.dart';
import 'package:mobx_example/todo_task/model.dart';
import 'package:mobx_example/todo_task/task_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class TodoTaskImplementation extends StatefulWidget {
  @override
  _TodoTaskImplementationState createState() => _TodoTaskImplementationState();
}

class _TodoTaskImplementationState extends State<TodoTaskImplementation> {
  bool? isChecked;

  Taskto taskto = Taskto();
  TextEditingController textEditingController = TextEditingController();

  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Todo Task'),
          centerTitle: true,
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'All',
              ),
              Tab(
                text: 'Pending',
              ),
              Tab(
                text: 'Completed',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              children: [
                Card(
                  child: Container(
                    margin: EdgeInsets.all(20),
                    height: 150,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text(
                          'Add Task',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextFormField(
                          controller: textEditingController,
                          decoration: InputDecoration(
                            labelText: 'task',
                            border: OutlineInputBorder(),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                            child: MaterialButton(
                          onPressed: () {
                            taskto.AddTask(textEditingController.text);
                          },
                          color: Colors.blue,
                          child: Text('Add'),
                        )),
                      ],
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: taskto.RemoveCompleted,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text('Remove Completed'),
                        ),
                      ),
                    ),
                    Observer(
                      builder: (_) {
                        return InkWell(
                          onTap: taskto.MarkAllComplete,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: (taskto.TodoListValuesCompleted.length ==
                                      taskto.TodoListValues.length)
                                  ? Text(
                                      'Mark All Completed',
                                      style: TextStyle(color: Colors.grey),
                                    )
                                  : Text('Mark All Completed'),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                Observer(
                  builder: (_) {
                    return Text(
                        '${taskto.TodoListValuesCompleted.length} Completed and ${taskto.TodoListValuesNonCompleted.length} Remaning');
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                Observer(
                  builder: (ctx) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.35,
                      child: ListView.builder(
                        itemCount: taskto.TodoListValues.length,
                        itemBuilder: (ctx, index) {
                          return ListTile(
                            leading: Checkbox(
                              checkColor: Colors.white,
                              value: taskto.TodoListValues[index].isComplete,
                              onChanged: (bool? value) {
                                taskto.checkBox(
                                    taskto.TodoListValues.indexOf(
                                        taskto.TodoListValues[index]),
                                    taskto.TodoListValues[index]);
                              },
                            ),
                            title: Text(
                              taskto.TodoListValues[index].task,
                            ),
                            trailing:
                                InkWell(onTap:() {
                                  taskto.RemoveListItem(
                                      taskto.TodoListValues[index]);
                                },child: Icon(Icons.delete_forever)),
                          );
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
            Observer(
              builder: (ctx) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: taskto.TodoListValuesNonCompleted.length,
                    itemBuilder: (ctx, index) {
                      return ListTile(
                        leading: Checkbox(
                          checkColor: Colors.white,
                          value: taskto
                              .TodoListValuesNonCompleted[index].isComplete,
                          onChanged: (bool? value) {
                            taskto.checkBox(
                                taskto.TodoListValues.indexOf(
                                    taskto.TodoListValues[index]),
                                taskto.TodoListValues[index]);
                          },
                        ),
                        title: Text(
                          taskto.TodoListValuesNonCompleted[index].task,
                        ),
                        trailing: InkWell(onTap:(){
                          taskto.RemoveListItem(taskto.TodoListValues[index]);
                        },child: Icon(Icons.delete_forever)),
                      );
                    },
                  ),
                );
              },
            ),
            Observer(
              builder: (ctx) {
                return Container(
                  height: MediaQuery.of(context).size.height,
                  child: ListView.builder(
                    itemCount: taskto.TodoListValuesCompleted.length,
                    itemBuilder: (ctx, index) {
                      return ListTile(
                        leading: Checkbox(
                          checkColor: Colors.white,
                          value:
                              taskto.TodoListValuesCompleted[index].isComplete,
                          onChanged: (bool? value) {
                            taskto.checkBox(
                                taskto.TodoListValues.indexOf(
                                    taskto.TodoListValues[index]),
                                taskto.TodoListValues[index]);
                          },
                        ),
                        title: Text(
                          taskto.TodoListValuesCompleted[index].task,
                        ),
                        trailing: InkWell(onTap: (){
                          taskto.RemoveListItem(taskto.TodoListValues[index]);
                        },child: Icon(Icons.delete_forever)),
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
