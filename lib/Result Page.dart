import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({Key? key, required this.result, required this.color1, required this.message1}) : super(key: key);

  final String result;
  final Color color1;
  final String message1 ;



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

            Text(
              widget.result,
              style: TextStyle(fontSize: 70, color: Colors.green),
            ),
            //////sateful

            Expanded(child:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  widget.message1  ,
                    style:TextStyle(fontSize:  50, color: widget.color1)
                  ,
                )
              ],
            )
            ),

            ],
        ),
      ),
    );
  }
}
