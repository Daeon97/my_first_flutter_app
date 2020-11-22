import 'package:flutter/material.dart';
import 'models/image_model.dart';
import 'package:http/http.dart' show get;
import 'dart:convert';
import 'widgets/image_list.dart';

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> images = [];

  void fetchImage() async {
    counter++;
    /*get('https://jsonplaceholder.typicode.com/photos/$counter')
        .then((response) => print(response));*/
    var response =
        await get('https://jsonplaceholder.typicode.com/photos/$counter');
    var imageModel = ImageModel.fromJson(json.decode(response.body));

    setState(() {
      images.add(imageModel);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        body: ImageList(images),
        appBar: AppBar(
          title: Text('Engels Immanuel'),
          backgroundColor: Colors.red,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: fetchImage,
        ),
      ),
    );
  }
}
