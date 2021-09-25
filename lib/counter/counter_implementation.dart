import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_example/counter/counter_store.dart';

class CounterClass extends StatelessWidget {
  Counter _counter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Observer(
            builder: (_) => Text(
              "${_counter.value}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.purple,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            child: Text('Sub'),
            onPressed: () {
              _counter.decrement();
            },
            backgroundColor: Colors.purple,
          ),
          FloatingActionButton(
            child: Text('Add'),
            onPressed: () {
              _counter.increment();
            },
            backgroundColor: Colors.purple,
          ),
        ],
      ),
    );
  }
}
