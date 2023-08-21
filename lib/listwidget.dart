import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'critics_modalclass/criticsmodalclass.dart';
class ListWidget extends StatelessWidget {
  final int index;
  ListWidget({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Datum> _criticsModel = [];

    return Container(
      child: Slidable(
        closeOnScroll: false,
        startActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: ((context) {}),
              icon: Icons.call,
              backgroundColor: Colors.green,
            ),
            SlidableAction(
              onPressed: ((context) {}),
              icon: Icons.message,
              backgroundColor: Colors.blue,
            ),
          ],
        ),
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: ((context) {}),
              icon: Icons.delete,
              backgroundColor: Colors.red,
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(
            Icons.person,
            size: 20.0,
          ),
          title: Text(_criticsModel[index].name.toString()),
          subtitle: Text(_criticsModel[index].id.toString()),
        ),
      ),
    );
  }
}
