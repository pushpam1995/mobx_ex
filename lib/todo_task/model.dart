import 'package:flutter/cupertino.dart';

class AbstractDataModel{
  String task;
  bool isComplete;

  AbstractDataModel({this.isComplete = false, required this.task});


}