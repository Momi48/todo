import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:todo/todo_containers/todo_list_items.dart';
import 'package:todo/todo_elements_varaibles/class_todolist.dart';

class TodoListContainersDesign extends StatefulWidget {
  const TodoListContainersDesign({super.key});

  @override
  State<TodoListContainersDesign> createState() => _TodoListContainersState();
}

class _TodoListContainersState extends State<TodoListContainersDesign> {
  

  final List<TodoListclass> todolist = [];
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  void _addTodoItem() {
    String title = titleController.text;
    String description = descriptionController.text;

    setState(() {
      if (title.isNotEmpty && description.isNotEmpty) {
        setState(() {
          todolist.add(
            TodoListclass(
              name: title,
              disc: description,
            ),
          );
        });
        titleController.clear();
        descriptionController.clear();
      }
    });

    Navigator.of(context).pop(); // Close the dialog after adding the item
  }

  @override
  void dispose() {
   
    super.dispose();
    titleController.dispose();
    descriptionController.dispose();
  }

  void deletedItems(int index) {
    todolist.removeAt(index);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          SingleChildScrollView(
             
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Column(
                children: [
                  ListView.builder(
                      shrinkWrap: true,
                      physics:const  NeverScrollableScrollPhysics(),
                      itemCount: todolist.length,
                      itemBuilder: (context, index) {
                        final todo = todolist[index];

                        return TimelineTile(
                          isFirst: index == 0,
                          isLast: index == todolist.length - 1,
                          indicatorStyle: IndicatorStyle(
                            color: Colors.deepPurple,
                            iconStyle: IconStyle(
                              iconData: Icons.circle_rounded,
                              fontSize:
                                  0, // Set the fontSize to 0 to remove the black background
                            ),
                          ),
                          beforeLineStyle: const LineStyle(color: Colors.deepPurple),
                          endChild: Padding(
                            padding:const EdgeInsets.symmetric(horizontal: 15.0),
                            child: GestureDetector(
                              onTap: () {
                                
                                deletedItems(index);
                              },
                              child: TodoListItems(
                                title: todo.name,
                                description: todo.disc,
                                isDone: true,
                              ),
                            ),
                          ),
                        );
                      })
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 5, // You can adjust the position as needed
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: Colors.transparent,
                    backgroundColor: Colors.transparent,
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return  SizedBox(
                            child: AlertDialog(
                              title: const Text('Enter Your Task'),
                              actions: [
                                TextField(
                                  controller: titleController,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter Title',
                                  ),
                                ),
                                TextField(
                                  controller: descriptionController,
                                  decoration: const InputDecoration(
                                      hintText: 'Enter Description'),
                                ),
                                TextButton(
                                  onPressed: _addTodoItem,
                                  child: const Text('Add'),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Cancel'))
                              ],
                            ),
                          );
                        });
                  },
                  child: Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xfff5968e), Color(0xfffc5c48)]),
                      borderRadius: BorderRadius.circular(25),
                    ),
                    
                    child: const Center(
                      child: Text(
                        'Add A Task',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
