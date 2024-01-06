import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TodoListItems extends StatefulWidget {
  TodoListItems({
    super.key,
    required this.title,
    required this.description,
    required this.isDone,
  });
  String title;
  String description;
  bool isDone; //check if task is done or not

  @override
  State<TodoListItems> createState() => _TodoListItemsState();
}

class _TodoListItemsState extends State<TodoListItems> {
  @override
  void initState() {
    super.initState();
  
  }

  

  TextEditingController editTitleController = TextEditingController();
  TextEditingController editDesController = TextEditingController();
  void editTodoItem() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          editTitleController.text = widget.title; //display the given title
          editDesController.text =
              widget.description; //display the given discription
          return AlertDialog(
            
            title: const Text('Edit task'),
            content: Column(
              children: [
                TextField(
                  controller: editTitleController,
                  decoration:const  InputDecoration(hintText: "Enter task here"),
                ),
                TextField(
                  controller: editDesController,
                  decoration:const InputDecoration(hintText: "Enter Description"),
                ),
              ],
            ),
            actions: <Widget>[
              TextButton(
                child:const Text('CANCEL'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child:const Text('UPDATE'),
                onPressed: () {
                  setState(() {
                    widget.title = editTitleController.text;
                    widget.description = editDesController.text;
                  });
                  
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  bool isChecked = true;
  Color activeColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            children: [
              widget.isDone == true && isChecked == true
                  ? Container(
                      width: 250,
                      height: 70,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.center,
                            colors: [Color(0xffb7a9fb), Color(0xff9984fb)],
                          ),
                          borderRadius: BorderRadius.circular(19),
                          //
                          color: const Color(0xff9984fb)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text(
                              widget.title,
                              textAlign: TextAlign.start,
                              style:
                               const   TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text(
                              widget.description,
                              textAlign: TextAlign.start,
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      width: 250,
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(19),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text(
                              widget.title,
                              textAlign: TextAlign.start,
                              style:
                               const   TextStyle(fontSize: 20, color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Text(
                              widget.description,
                              textAlign: TextAlign.start,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isChecked = !isChecked;
                            activeColor =
                                isChecked ? Colors.deepPurple : Colors.white;
                          });
                        },
                        icon: Icon(
                          isChecked
                              ? Icons.check_box
                              : Icons.check_box_outline_blank_outlined,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            editTodoItem();
                          },
                          icon: const Icon(Icons.edit))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
