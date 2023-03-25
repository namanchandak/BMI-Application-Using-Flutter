import 'package:flutter/material.dart';
import 'package:bmi_application/Result Page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI Calculator",
      theme: ThemeData.dark(),
      home: const LandingPage(),
    );
  }
}

enum Gender{male,female,other}


class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  double _height = 100.0;
  int weight =50;
  int age= 26;
  double bmi=0;
  Color color=Colors.white;
  String message="nothing is entered ";

  void increaseAge()
  {
    setState(() {
      age++;
    });
  }

  void decreaseAge()
  {
    setState(() {
      age--;
    });
  }


  void increaseW()
  {
    setState(() {
      weight++;
    });

  }

  void decreaseW()
  {
    setState(() {
      weight--;
    });

  }



  void calculateBMI()
  {
    setState(() {
      double heightM=_height/100;
      bmi=weight/(heightM * heightM);
      print('BMI Value : $bmi');
      if(bmi<18.5)
        {
          message="under Weight";
          color=Colors.blue;
        }
      else if(bmi<24.9)
        {
          message="you are doing good";
          color=Colors.green;
        }

      else
        {
          message="Over Weight";
          color=Colors.red;
        }

    });
  }


  Gender gender =Gender.other;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("BMI calculator"),
        ),
        body: Column(
          children: [
            Row(
              children: [
                ////male

                Expanded(
                  child: Container(
                    child: InkWell(
                      onTap: (){

                        setState(() {
                          gender=Gender.male;
                        });
                      },
                        child: Card(
                          color: gender==Gender.male ?Colors.blue:Colors.grey,
                          child: Column(
                            children: [
                              Icon(Icons.male,size: 100,),
                              Text(
                                "Male",
                                style: TextStyle (fontSize: 36,fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                    )
                  ),
                ),

                ///female
                ////////container has chile

                Expanded(
                    child: Container(
                  child: InkWell(
                    onTap: (){

                      setState(() {
                        gender=Gender.female;
                      });
                    },
                      child: Card(
                        color: gender==Gender.female ?Colors.pink:Colors.grey,
                        child: Column(
                          children: [
                            Icon(Icons.female,size: 100,),
                            Text(
                              "Female",
                              style: TextStyle (fontSize: 36,fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                  )
                ))
              ],
            ),
            ////////height
            Container(
              child: Card(
                child: Column(
                  children: [
                    const Text("Height",
    style: TextStyle (fontSize: 26,fontWeight: FontWeight.bold),),
                    Text('${_height.toStringAsFixed(0)} cm',
                      style: TextStyle (fontSize: 36,fontWeight: FontWeight.bold),),
                    Slider(
                      value: _height,
                      onChanged: (value) {
                        setState(() {
                          _height = value;
                        });
                      },
                      min: 50,
                      max: 300,
                    ),
                  ],
                ),
              ),
            ),

            Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        child: Container(
                      child: Card(
                        child: Column(
                          children: [
                            const Text("Age",
                              style: TextStyle (fontSize: 36,fontWeight: FontWeight.bold),),
                            Text( "$age",
                              style: TextStyle(fontSize: 30, color: Colors.blue),),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                    onPressed: increaseAge , child: Icon(Icons.add)),
                                ElevatedButton(
                                    onPressed: decreaseAge, child: Icon(Icons.remove))
                              ],
                            ),
                          ],
                        ),
                      ),
                    )),
                    Expanded(
                      child: Container(
                        child: Card(
                          child: Column(
                            children: [
                              const Text("Weight",
                                style: TextStyle (fontSize: 36,fontWeight: FontWeight.bold),),
                              Text( "$weight",
                                style: TextStyle(fontSize: 30, color: Colors.blue),),

                              Row(

                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                children: [
                                  ElevatedButton(
                                      onPressed: increaseW, child: Icon(Icons.add)),
                                  ElevatedButton(
                                      onPressed: decreaseW,
                                      child: Icon(Icons.remove))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),

            const Spacer(),
            ElevatedButton(

              onPressed: (){
              calculateBMI();
              Navigator.push(
                context,
                MaterialPageRoute(
                  ///////yellow

                builder:(context)=>  ResultPage(result: bmi.toStringAsFixed(2),message1: message, color1: color),
                )

            );
    },

              child: const Text('Calculate'),

              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(16),
                textStyle: const TextStyle(fontSize: 24),
                backgroundColor: Colors.green,
              ),
            )
          ],
        ));
  }
}
