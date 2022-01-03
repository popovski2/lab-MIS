import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<MyApp> {
  final List<String> names = <String>[];
  final List<DateTime> datumi = <DateTime>[];

  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();


  void addItemToList(){
    setState(() {
      names.insert(0,nameController.text);
      var datum = DateTime.parse(dateController.text);
      datumi.insert(0,datum);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Kolokviumi'),
          actions:<Widget>[
            IconButton(icon: Icon(Icons.add), onPressed: (){
              addItemToList(); //ovde dodaj kolokvium i termin
            },),
          ],
        ),
        body: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Ime na kolokvium',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: TextField(
                  controller: dateController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Datum (format: year-month-day)',
                  ),
                ),
              ),
             /* RaisedButton(
                child: Text('Add'),
                onPressed: () {
                  addItemToList();
                },
              ),*/
              Expanded(
                  child: ListView.builder(
                    itemCount: names.length,
                    itemBuilder: (contx, index) {
                      print(names[index]);

                      return Card(
                          elevation: 10,
                          child: Container (
                            margin: EdgeInsets.all(15),
                            //decoration: BoxDecoration(border: Border.all(color: Theme.of(contx).primaryColor, width: 2)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(names[index],
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.yellow)),
                                Text(datumi[index].toString(),
                                    style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.grey))
                              ],
                            ),
                          )
                      );
                    },
                  )
              )
            ]
        )
    );
  }
}