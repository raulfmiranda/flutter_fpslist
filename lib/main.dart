import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = "Flutter FPSList";
    const urlImages = <String>[
      "https://images.pexels.com/photos/220421/pexels-photo-220421.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
      "https://images.pexels.com/photos/207891/pexels-photo-207891.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
      "https://images.pexels.com/photos/164854/pexels-photo-164854.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
      "https://images.pexels.com/photos/34533/owl-glitter-stuffed-animal-cute.jpg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
      "https://images.pexels.com/photos/60023/baboons-monkey-mammal-freeze-60023.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: ListView.builder(
          key: Key('long_list'),
          padding: EdgeInsets.all(10),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecondRoute()));
              },
              child: Container(
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 280,
                      child: Image.network(
                        urlImages[index % urlImages.length],
                        key: Key("$index"),
                      ),
                    ),
                    Text(
                      'Imagem $index',
                      key: Key('item_${index}_text'),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Center(
        child: RaisedButton(
          key: Key('button'),
          onPressed: () => Navigator.pop(context),
          child: Text("Voltar"),
        ),
      ),
    );
  }
}
