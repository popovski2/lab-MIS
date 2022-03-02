import 'package:flutter/material.dart';
import 'package:lab3_mis/model/exam_item.dart';

class ExamDetailScreen extends StatelessWidget {
  static const routeName = '/exam_detail';

  //final ExamItem item;
  //ExamDetailScreen(this.item);

  @override
  Widget build(BuildContext context) {
    final item = ModalRoute.of(context)!.settings.arguments as ExamItem;
    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
      ),
      body: Column(children: [
        Text(item.title),
        Text(item.date.toString()),
        Text(item.id),
      ]),
    );
  }
}