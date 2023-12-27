import 'package:flutter/material.dart';

class ChangeProvider extends ChangeNotifier {
  bool a = true;
  void changeSize() {
    a = !a;
    notifyListeners();
  }

  bool c = true;
  void changeColor() {
    c = !c;
    notifyListeners();
  }

  List<Color> colors = [Colors.green, Colors.red, Colors.yellow, Colors.blue];
  List<Color> selectedColors = [];
  int index = 0;
  void indexColor() {
    index = (index + 1) < colors.length ? index + 1 : index = 0;
    selectedColors.add(colors[index]);
    notifyListeners();
  }

  final controller1 = TextEditingController();
  final controller2 = TextEditingController();
  String concatedText = '';
  bool b = true;

  void text() {
    b = !b;
    concatedText = controller1.text + controller2.text;
    notifyListeners();
  }

  int count = 0;
  void counting() {
    count++;
    notifyListeners();
  }
}
