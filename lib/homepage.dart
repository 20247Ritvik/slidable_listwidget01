import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:http/http.dart';
import 'critics_modalclass/criticsmodalclass.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map? mapResponse;
  List<Datum> _criticsModel = [];

  String apiUrl = "https://reqres.in/api/unknown";

  Future apiCall() async {
    Response response = await get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      setState(() {
        Critics cResponse = Critics.fromJson(json.decode(response.body));
        _criticsModel = cResponse.data;
        debugPrint(_criticsModel.length.toString());
      });
    } else {
      debugPrint("Error while loading data");
    }
  }


  @override
  void initState() {
    // you have to call api function inside init...!!!
    apiCall();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: _criticsModel == null ? 0 : _criticsModel.length,
            itemBuilder: (BuildContext context, int index) {
              //return ListWidget(index: _criticsModel.length);
              return Slidable(
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
                child: Card(
                  color: Colors.grey.shade300,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Icon(
                        Icons.person,
                        size: 20.0,
                      ),
                      title: Text(_criticsModel[index].name.toString()),
                      subtitle: Text(_criticsModel[index].id.toString()),
                    ),
                  ),
                ),
              );
        }),
    );
  }
}
