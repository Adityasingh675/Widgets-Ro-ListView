import 'package:flutter/material.dart';

class ReorderList extends StatefulWidget {
  @override
  _ReorderListState createState() => _ReorderListState();
}

class _ReorderListState extends State<ReorderList> {
  List<String> myList = [
    "A0",
    "B1",
    "C2",
    "D3",
    "E4",
    "F5",
    "G6",
    "H7",
    "I8",
    "J9",
    "K10",
  ];

  _onReorder(oldIndex, newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex = newIndex - 1;
      }
      var item = myList.removeAt(oldIndex);
      myList.insert(newIndex, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reorderable List'),
      ),
      body: ReorderableListView(
        onReorder: _onReorder,
        header: Text('Heading'),
        children: myList
            .map((value) => ListTile(
                  key: ObjectKey(value),
                  title: Text(value),
                ))
            .toList(),
      ),
    );
  }
}
