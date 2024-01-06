import 'package:flutter/material.dart';
import 'package:todo/screens/todo_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFFfffefe),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 100,
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.play_arrow_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
              //change the color for each text//
              RichText(
                text: const TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: 'How it ',
                      style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff868485),
                          fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                        text: 'works',
                        style:
                            TextStyle(fontSize: 16, color: Color(0xffe28743)))
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          const Center(
            child: SizedBox(
              width: 300,
              height: 300,
              child: Image(
                image: AssetImage('assets/people_list.png'),
              ),
            ),
          ),
          const Center(
            child: Text(
              'Manage Your ',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Center(
            child: Text(
              'Everyday Task List',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 7.0),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Lorem Ipsum is simply dummy text of the printing  ',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'typesetting industry standard dummy text since',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 15),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                  child: Text(
                    'When an unknown printer took a galley ',
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xfff5968e), Color(0xfffc5c48)]),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const TodoItems()));
                  },
                  child:const Text(
                    'Get Started',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
        const  SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              height: 7,
              width: 15,
              color: const Color(0xff414041),
            ),
          )
        ],
      ),
    );
  }
}
