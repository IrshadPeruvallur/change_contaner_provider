import 'package:change_container_provider/controller/change_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyWidget extends StatelessWidget {
  MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ChangeProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Consumer<ChangeProvider>(builder: (context, value, child) {
              return Container(
                width: value.a ? 100 : 200,
                height: value.a ? 100 : 200,
                color: value.c ? Colors.blue : Colors.yellow,
              );
            }),
            TextButton(
              onPressed: () {
                provider.changeSize();
              },
              child: Text("Change Size"),
            ),
            TextButton(
              onPressed: () {
                provider.changeColor();
              },
              child: Text("Change Color"),
            ),
            TextField(controller: provider.controller1),
            TextField(controller: provider.controller2),
            Consumer<ChangeProvider>(builder: (context, value, child) {
              return TextButton(
                  onPressed: () => provider.text(),
                  child: Text(value.b ? "Add Text" : "Clear Text"));
            }),
            Consumer<ChangeProvider>(builder: (context, value, child) {
              return Text(value.concatedText);
            }),
            Consumer<ChangeProvider>(builder: (context, value, child) {
              return Text("Count Number : ${value.count}");
            }),
            Consumer<ChangeProvider>(builder: (context, value, child) {
              return Container(
                width: 100,
                height: 100,
                color: value.selectedColors.isNotEmpty
                    ? value.selectedColors.last
                    : Colors.white,
              );
            }),
            TextButton(
                onPressed: () {
                  provider.indexColor();
                },
                child: Text('data'))
          ],
        ),
      ),
    );
  }
}
