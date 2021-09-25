import 'package:flutter/material.dart';
import 'package:mobx_example/todo_task/task_design.dart';

import 'counter/counter_implementation.dart';

void main() => runApp(MobXImplimentaion());

class MobXImplimentaion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'mobx implimentation',
      home: UserInterfaceDesign(),
    );
  }
}

class UserInterfaceDesign extends StatelessWidget {
  void callCounterScreen(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CounterClass()),
    );
  }

  void callTodoTaskScreen(context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TodoTaskImplementation()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobx List'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ListTile(
            title: Text(
              'Counter List',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
                'Mobx helps to implement counter and mannage to keep Counter Variable as Observable '),
            onTap: () {
              callCounterScreen(context);
            },
          ),
          SizedBox(height: 10,),
          ListTile(
            title: Text(
              'Todo Task List',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
                'With help of Mobx List of task can be tracked dwon and keep every task as a global state'),
            onTap: () {
              callTodoTaskScreen(context);
            },
          ),
        ],
      ),
    );
  }
}
