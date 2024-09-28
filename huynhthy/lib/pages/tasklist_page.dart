import 'package:flutter/material.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:huynhthy/pages/txstasklist_page.dart';
import 'package:huynhthy/widget/button_widget.dart';

class Tasklist_Page extends StatefulWidget {
  const Tasklist_Page({super.key});

  @override
  State<Tasklist_Page> createState() => _Tasklist_PageState();
}

class _Tasklist_PageState extends State<Tasklist_Page> {
  final tasks = <String>[];
  TextEditingController taskController = TextEditingController();

  @override
  void dispose(){
    taskController.dispose();
    super.dispose();
}

List _dataDummy = [
  {
    "albumId": 1,
    "id": 1,
    "title": "Công việc 1",
    "url": "https://via.placeholder.com/600/92c952",
    "thumbnailUrl": "https://via.placeholder.com/150/92c952",
    "author": "HuynhThy",
    "date": "28/9/24",
    "group": "Flutter"
  },
  {
    "albumId": 1,
    "id": 2,
    "title": "Công việc 2",
    "url": "https://via.placeholder.com/600/771796",
    "thumbnailUrl": "https://via.placeholder.com/150/771796",
  "author": "HuynhThy",
  "date": "28/9/24",
  "group": "Android"
  },
  {
    "albumId": 1,
    "id": 3,
    "title": "Công việc 3",
    "url": "https://via.placeholder.com/600/24f355",
    "thumbnailUrl": "https://via.placeholder.com/150/24f355",
  "author": "HuynhThy",
  "date": "28/9/24",
  "group": "IOS"
  },
  {
    "albumId": 1,
    "id": 4,
    "title": "Công việc 4",
    "url": "https://via.placeholder.com/600/d32776",
    "thumbnailUrl": "https://via.placeholder.com/150/d32776",
  "author": "HuynhThy",
  "date": "28/9/24",
  "group": "React Native"
  },
  {
    "albumId": 1,
    "id": 5,
    "title": "Công việc 5",
    "url": "https://via.placeholder.com/600/f66b97",
    "thumbnailUrl": "https://via.placeholder.com/150/f66b97",
  "author": "HuynhThy",
  "date": "28/9/24",
  "group": "Python"
  }
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Danh sách công việc")),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(16.0),
            child:
            TextField(
              controller: taskController,
              decoration: InputDecoration(
                  labelText: "Nhập tên công việc"
              ),
            ),
          ),
          ElevatedButton(onPressed: addTask, child: Text("Thêm công việc"),),
          Expanded(
              child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(tasks.elementAt(index)),
                      trailing: IconButton(
                          onPressed: (){
                            tasks.removeAt(index);
                            setState(() {
                            });
                          },
                          icon: Icon(Icons.delete_outline),
                      ),
                    );
                  }
              )),
          Expanded(
              child: GroupedListView<dynamic, String>(
                elements: _dataDummy,
                groupBy: (element) => element['group'],
                groupSeparatorBuilder: (String groupByValue) => Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Flexible(
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10, right: 10),
                              child: Text(
                                groupByValue,
                                textAlign: TextAlign.start,
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),),
                    ],
                  ),),
                itemBuilder: (context, dynamic element) {
                  return Card(
                    elevation: 10,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              child: ClipRRect(
                                child: Image(
                                    image: NetworkImage(element['thumbnailUrl']),
                                    fit: BoxFit.cover
                                ),
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                              )),
                          Expanded(flex: 5, child: Container(
                            padding: EdgeInsets.only(bottom: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  child: Text(
                                    element['title'],
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.account_circle_sharp, color: Colors.black, size: 16),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Text('${element['author']}'),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10, right: 10, top: 5),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.calendar_today, color: Colors.black, size: 16),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Text('${element['date']}'),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ))
                        ],
                      ),
                    ),
                  );
                },
                itemComparator: (item1, item2) => item1['title'].compareTo(item2['title']), // optional
                useStickyGroupSeparators: true, // optional
                floatingHeader: true, // optional
                order: GroupedListOrder.ASC, // optional
                footer: Text("Widget at the bottom of list"), // optional
              ))
        ],
      ) ,

    );
  }

  void addTask() {
    setState(() {
      tasks.add(taskController.text);
      taskController.clear();
    });
  }
}
