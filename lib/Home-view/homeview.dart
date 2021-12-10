import 'dart:async';

import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:todoapp/Home-view/create_todo.dart';
import 'package:todoapp/Home-view/utils.dart';
import 'package:skeleton_text/skeleton_text.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:todoapp/share_todo_tile/todo_tile_widget.dart';

class TodoHome extends StatefulWidget {
  const TodoHome({Key? key}) : super(key: key);

  @override
  State<TodoHome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  List<Map<String, dynamic>> completed = [];
  List<Map<String, dynamic>> uncompleted = [];
  List<Map<String, dynamic>> data = [
    {
      'title': 'Trip to space',
      'description':
          'This trip will last a week,and I intend going with you guys',
      'date_time': 'Tomorrow',
      'status': false,
    },
    {
      'title': 'Trip to Dubai',
      'description':
          'This trip will last a week,and I intend going with you guys and my mom',
      'date_time': '24/12/2021',
      'status': false,
    },
    {
      'title': 'Buy a Car',
      'description':
          'After a trip I intend to buy 2022 latest Model S car in tesie company',
      'date_time': '01/01/2022',
      'status': false,
    },
    {
      'title': 'Lunch Kenkey',
      'description':
          'I want to take kenkey as lunch today as 12:30 pm in ivalley Ghana',
      'date_time': 'Today',
      'status': true,
    },
  ];
  void initState() {
    for (Map<String, dynamic> element in data) {
      if (element['status']) {
        completed.add(element);
      } else {
        uncompleted.add(element);

      }
    }
    Timer(const Duration(seconds: 2), () => callback());
    super.initState();
  }

  String isloaded = 'Todo';
  int count = 0;
  void callback() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: customColor(date: 'yesterday'),
          leading: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/profile_img.jpg'),
            radius: 10,
            backgroundColor: Colors.amber,
          ),
          title: const Text('My Task'),
          actions: const [
            Icon(Icons.menu),
            SizedBox(
              width: 20,
            ),
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: Icon(Icons.search),
            ),
          ],
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return count == 0
                  ? SkeletonAnimation(
                      shimmerColor: customColor(date: 'appbarColor'),
                      child: const todo_tile_widget(
                          title: '',
                          description: '',
                          dateTime: '',
                          status: false))
                  : todo_tile_widget(
                      title: isloaded == 'Todo'
                          ? uncompleted[index]['title']
                          : completed[index][Title],
                      description: isloaded == 'Todo'
                          ? uncompleted[index]['description']
                          : completed[index]['description'],
                      dateTime: isloaded == 'Todo'
                          ? uncompleted[index]['datetime']
                          : completed[index]['datetime'],
                      status: isloaded == 'Todo'
                          ? uncompleted[index]['status']
                          : completed[index]['status'],
                    );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 5,
              );
            },
            itemCount: uncompleted.length),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return CreateTodo();
            }));
          },
          child: const Icon(Icons.add),
          backgroundColor: customColor(date: 'appbarColor'),
        ),
        bottomNavigationBar: SafeArea(
            child: InkWell(
          onTap: () {
            showBarModalBottomSheet(
                context: context,
                builder: (context) {
                  return ListView.separated(
                      itemBuilder: (context, index) {
                        return todo_tile_widget(
                            title: completed[index]['title'],
                            description: completed[index]['description'],
                            dateTime: completed[index]['dateTime'],
                            status: completed[index]['status']);
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox();
                      },
                      itemCount: uncompleted.length);
                });
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: customColor(
                    date: 'appbarColor',
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.check_circle_rounded,
                      color: Colors.white,
                    ),
                    const Text(
                      'complete',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    const Spacer(),
                    Text('$count')
                  ],
                )),
          ),
        )));
  }
}
