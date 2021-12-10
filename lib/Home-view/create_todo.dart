import 'package:flutter/material.dart';
import 'package:todoapp/Home-view/utils.dart';

class CreateTodo extends StatelessWidget {
  CreateTodo({Key? key}) : super(key: key);
  final controllerTitle = TextEditingController();
  final controllerDescription = TextEditingController();
  final controllerDate = TextEditingController();
  final controllerTime = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Todo'),
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Title require';
                  }
                },
                controller: controllerTitle,
                decoration: InputDecoration(
                    labelText: 'Title',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: customColor(date: 'appbarColor')),
                    hintText: 'please type your event',
                    hintStyle: const TextStyle(color: Colors.black),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: customColor(date: 'Appbarcolor'),
                    )),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: customColor(date: 'Appbarcolor'),
                    )))),
            TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Discription require';
                  }
                },
                controller: controllerDescription,
                decoration: InputDecoration(
                    labelText: 'discription',
                    labelStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                        color: customColor(date: 'appbarColor')),
                    hintText: 'please type your event detail',
                    hintStyle: const TextStyle(color: Colors.black),
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: customColor(date: 'Appbarcolor'),
                    )),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                      color: customColor(date: 'Appbarcolor'),
                    )))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) return 'Date require';
                        },
                        controller: controllerDate,
                        onTap: () {
                          showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime.now(),
                                  lastDate: DateTime.now()
                                      .add(const Duration(days: 365)))
                              .then((selectDate) {
                            // final DateFormat dateFormat =
                            //     DateFormat('dd/MM/yyyy');
                            // controllerDate = dateFormat.DateFormat(selectDate);
                          });
                        },
                        decoration: InputDecoration(
                            labelText: 'Date',
                            labelStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: customColor(date: 'appbarColor')),
                            hintText: 'Event date',
                            hintStyle: const TextStyle(color: Colors.black),
                            border: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: customColor(date: 'Appbarcolor'),
                            )),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: customColor(date: 'Appbarcolor'),
                            )))),
                  ),
                  Expanded(
                      child: TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) return 'Time require';
                          },
                          controller: controllerTime,
                          maxLines: 1,
                          onTap: () {
                            showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay?.now())
                                .then((selectTime) {
                              controllerTime.text = selectTime!.format(context);
                            });
                          },
                          decoration: InputDecoration(
                              labelText: 'Time',
                              labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: customColor(date: 'appbarColor')),
                              hintText: 'Event Time',
                              hintStyle: const TextStyle(color: Colors.black),
                              border: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: customColor(date: 'Appbarcolor'),
                              )),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                color: customColor(date: 'Appbarcolor'),
                              ))))),
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor: customColor(date: 'appbarcolor'),
                ),
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    print('successful');
                    print(controllerTitle.text);
                    print(controllerDescription.text);
                    print(controllerDate.text);
                    print(controllerTime.text);
                  }
                },
                child: const Text(
                  'create',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
