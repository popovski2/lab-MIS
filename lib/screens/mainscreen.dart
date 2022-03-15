import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:lab3_mis/model/exam_item.dart';
import 'package:lab3_mis/screens/calendar.dart';
import 'package:lab3_mis/screens/exam_detail_screen.dart';
import 'package:nanoid/nanoid.dart';

import 'map.dart';

class MainScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState(){
    return _MainScreenState();
  }
}

class _MainScreenState extends State<MainScreen> {
  final String title = "Organizator na ispiti";

  int _selectedIndex = 0;
  var _widgets = <Widget>[CalendarScreen()];

  List<ExamItem> _examItems = [
    ExamItem(id: nanoid(5), title: "Verojatnost i statistika", date: DateTime.parse('2022-03-03 11:00')),
    ExamItem(id: nanoid(5), title: "Diskretna matematika", date: DateTime.parse('2022-05-12 12:00')),
    ExamItem(id: nanoid(5), title: "Masinsko ucenje", date: DateTime.parse('2022-06-15 10:00')),
    ExamItem(id: nanoid(5), title: "Podatocno rudarstvo", date: DateTime.parse('2022-07-12 08:00'))

  ];

  TextEditingController nameController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  void addItemToList(){
    if (nameController.text.isEmpty)
    {
      return;
    }
    setState(() {
      ExamItem newItem = ExamItem(
        id: nanoid(5),
        title: nameController.text,
        date: DateTime.parse(dateController.text),
      );
      nameController.text = "";
      dateController.text = "";
      _examItems.add(newItem);
      Navigator.pop(context);
    });
  }

  void deleteItem(String id){
    setState(() {
      _examItems.removeWhere((element) => element.id == id);
    });
  }

  void ShowDetails(BuildContext context, ExamItem item){
    /* Navigator.of(context).push(
        MaterialPageRoute(builder: (_) => ExamDetailScreen(item)),
      );*/
    Navigator.of(context).pushNamed(
        ExamDetailScreen.routeName,
        arguments: item
    );
  }

  void ShowCalendar(BuildContext context, List<ExamItem> items){
    Navigator.of(context).pushNamed(
        CalendarScreen.routeName,
        arguments: items
    );
  }

  Widget createBody(){
    return Column(
      children: [
        Expanded(
            child: _examItems.isEmpty ?
            Center(child: Text(
                "Nema ispiti",
                style: const TextStyle(fontWeight: FontWeight.bold)
            )
              ,) :
            ListView.builder(
              itemCount: _examItems.length,
              itemBuilder: (context, index){
                print(_examItems[index]);
                return Card(
                    elevation: 2,
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    child: ListTile(
                      title: Text(
                          _examItems[index].title,
                          style: const TextStyle(fontWeight: FontWeight.bold)
                      ),
                      subtitle: Text(_examItems[index].date.toString()),
                      onTap: () => ShowDetails(context, _examItems[index]),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => deleteItem(_examItems[index].id),
                      ),
                    )
                );
              },
            )
        ),

      ],
    );
  }

  PreferredSizeWidget createAppBar(){
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(onPressed: () {
          showDialog(context: context,
              builder: (BuildContext context) {
                return SimpleDialog(
                  contentPadding: EdgeInsets.symmetric(
                      horizontal: 25,
                      vertical: 20
                  ),
                  title: Row(
                    children: [
                      Text("DODAJ ISPIT"),
                      Spacer(),
                      IconButton(onPressed: () {Navigator.pop(context);},
                          icon: Icon(Icons.cancel))
                    ],
                  ),
                  children: [
                    Divider(height: 5,indent: 5),
                    TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: "Ime na predmetot",
                      ),
                    ),
                    TextFormField(
                      controller: dateController,
                      decoration: InputDecoration(
                        hintText: "DATUM I VREME (yyyy-mm-dd)",
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                    Divider(height: 5,indent: 5),
                    Spacer(),
                    SizedBox(
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      child: FlatButton(
                        child: Text("DODAJ"),
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: (){
                          addItemToList();
                        },
                      ),
                    )
                  ],
                );  });
        } ,
          icon: Icon(Icons.add, size: 35),
          padding: EdgeInsets.only(right: 40),
        )
      ],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: createAppBar(),
      body:
     createBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => ShowCalendar(context, _examItems),
        tooltip: 'Calendar',
        child: const Icon(Icons.calendar_today),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), label: "Calendar"),
          BottomNavigationBarItem(icon: Icon(Icons.pin_drop), label: "Locations"),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.orange,
       onTap: _onItemTapped,
      ),
    );
  }

}