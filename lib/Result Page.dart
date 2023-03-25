import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key, required this.result}) : super(key: key);

  final String result;



  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(
              'Result',
              style: TextStyle(fontSize: 50, color: Colors.blue),
            ),

            Text(
              'The Gift Of Health Is Keeping Me Alive',
              style: TextStyle(fontSize: 50, color: Colors.green),
            ),

            // Text(
            //   widget.result,
            //   style: TextStyle(fontSize: 70, color: Colors.green),
            // ),
            ////////sateful
            if(widget.result=="1")
            Text("You should have a healthy diet as you low on BMI ,Please have daily exercise and yoga!" , style: TextStyle(fontSize: 35),),
            if(widget.result=="2r")
              Text("You Are Perfect Keep it up and have daily exercise and yoga" , style: TextStyle(fontSize: 35),),
            if(widget.result=="3")
              Text("You should have a healthy diet as you high on BMI ,Please have daily exercise and yoga!" , style: TextStyle(fontSize: 35),)
          ],
        ),
      ),
    );
  }
}
