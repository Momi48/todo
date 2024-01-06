import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:todo/todo_containers/todo_new_items.dart';

class TodoItems extends StatefulWidget {
  const TodoItems({super.key});

  @override
  State<TodoItems> createState() => _TodoItemsState();
}

class _TodoItemsState extends State<TodoItems> {
  final Color colors = const Color(0xffcad1e0);
  final border = OutlineInputBorder(
      borderSide: BorderSide.none, borderRadius: BorderRadius.circular(16));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFf6f8fa),
      appBar: AppBar(
        leading: Icon(
          Icons.menu,
          color: colors,
          size: 29,
        ),
        backgroundColor:const Color(0xfff6f8fa),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: colors, size: 32),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_outlined,
              color: colors,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const SizedBox(
              height: 20,
            ),
          const  Text(
              'Hello Muzzammil',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              '25 Task Pending',
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  prefixIcon: const Icon(
                    Icons.search_outlined,
                    size: 30,
                  ),
                  suffixIcon: const Icon(Icons.key_outlined),
                  suffixIconColor: Colors.red,
                  hintText: 'Search',
                  prefixIconColor: colors,
                  focusedBorder: border,
                  enabledBorder: border),
            ),
         const   SizedBox(
              height: 20,
            ),
         const   Text(
              'Ongoing Task',
              style: TextStyle(fontSize: 15),
            ),
         const   SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 12.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(19.0),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircularPercentIndicator(
                                radius: 18,
                                percent: 0.19,
                                backgroundWidth: 0.0,
                                lineWidth: 3.6,
                                center: const Text(
                                  '19%',
                                  style: TextStyle(color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        const  SizedBox(
                            height: 10,
                          ),
                         const Padding(
                            padding:
                                 EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text(
                              'Space App Design',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      const    SizedBox(
                            height: 15,
                          ),
                       const   Padding(
                            padding:
                                 EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text('Team Members'),
                          ),
                       const   Padding(
                            padding:
                                 EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 12,
                                  backgroundImage: NetworkImage(
                                      'https://images.pexels.com/photos/733872/pexels-photo-733872.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 12,
                                  backgroundImage: NetworkImage(
                                      'https://images.pexels.com/photos/1239291/pexels-photo-1239291.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                                ),
                                CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 12,
                                  backgroundImage: NetworkImage(
                                      'https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                                ),
                              ],
                            ),
                          ),
                        const  SizedBox(
                            height: 20,
                          ),
                      const    Padding(
                            padding:
                                 EdgeInsets.symmetric(horizontal: 10.0),
                            child: Row(
                              children: [
                                Icon(Icons.access_time_filled,
                                    size: 20, color: Color(0xffff7563)),
                                Text('\t\t10:30 am to 01:30 pm'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      // Use a Column to move the image down
                      // This aligns the Column content to the bottom
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          width: 120,
                          height: 150,
                          child: Image.asset('assets/rocketss.png'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
           const SizedBox(
              height: 40,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Today's  Task",
                  style: TextStyle(
                      color: Color(0xffaab4cc),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
                Text(
                  'See All',
                  style: TextStyle(color: Colors.red, fontSize: 15),
                ),
              ],
            ),
         const   SizedBox(height: 20,),
           const TodoListContainersDesign(),
          ],
        ),
      ),
    );
  }
}
