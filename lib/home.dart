import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Box box;

  @override
  void initState() {
    super.initState();
    openBox();
  }

  Future openBox() async {
    var dir = await getApplicationDocumentsDirectory();
    Hive.init(dir.path);
    box = await Hive.openBox('testBox');
    return;
  }

  void getall() {
    print(box.toMap());
  }

  void ptudata() {
    //key / pair
    // box.put('name', 'Prabesh');
    // box.put('name1', 'Pratik');
    box.add("value"); //add

    //box.add('value'); //For auto increment key
  }

  void getdata() {
    //print(box.get('name'));
    print(box.getAt(0)); //add
  }

  void updatedata() {
    // box.put('name', "Prabesh Developer");
    box.put(0, 'Prabesh Hacker'); //add
  }

  void deletedata() {
    //box.delete('name');
    box.delete(0); //add
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hive Test App'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(child: Align(child: Text('UOTPUT'))),
          RaisedButton(
              child: Text('Get All Data'),
              onPressed: () {
                getall();
              }),
          RaisedButton(
              child: Text('Put Data'),
              onPressed: () {
                ptudata();
              }),
          RaisedButton(
              child: Text('Get Data'),
              onPressed: () {
                getdata();
              }),
          RaisedButton(
              child: Text('Update Data'),
              onPressed: () {
                updatedata();
              }),
          RaisedButton(
              child: Text('Delete Data'),
              onPressed: () {
                deletedata();
              }),
        ],
      ),
    );
  }
}
