import 'package:bmi/result.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMale = true;
  double heightval = 170;
  int weight = 55;
  int age = 18;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.teal,
        title: const Text(
          'BMI',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    bulidbox(context, 'meal'),
                    const SizedBox(
                      width: 10,
                    ),
                    bulidbox(context, 'female'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17.0),
                    color: Colors.blueGrey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            heightval.toStringAsFixed(1),
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Text(
                            'CM',
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                      Slider(
                          activeColor: Colors.white,
                          min: 80,
                          max: 230,
                          value: heightval,
                          onChanged: (newvalue) {
                            setState(() {
                              heightval = newvalue;
                            });
                          }),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    bulidbox1(context, 'weight'),
                    const SizedBox(
                      width: 10,
                    ),
                    bulidbox1(context, 'age'),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.teal,
              height: MediaQuery.of(context).size.height / 14,
              width: double.infinity,
              child: TextButton(
                onPressed: () {
                  var result = weight / pow(heightval / 100, 2);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Result(reslut: result, isMeal: isMale, age: age);
                  }));
                },
                child: const Text(
                  'Calculate',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Expanded bulidbox(BuildContext context, String teyp) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = (teyp == 'meal') ? true : false;
          });
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22.9),
            color: (isMale && teyp == 'meal') || (!isMale && teyp == 'female')
                ? Colors.teal
                : Colors.blueGrey,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                teyp == 'meal' ? Icons.male : Icons.female,
                size: 85.7,
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                teyp == 'meal' ? 'meal' : 'female',
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Expanded bulidbox1(BuildContext context, String teyp) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22.9),
          color: Colors.blueGrey,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              teyp == 'age' ? 'Age' : 'weigth',
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              teyp == 'age' ? '$age' : '$weight',
              style: Theme.of(context).textTheme.headline1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: teyp == 'age' ? 'age--' : 'weight--',
                  onPressed: () {
                    setState(() {
                      teyp == 'age' ? age-- : weight--;
                    });
                  },
                  child: const Icon(Icons.remove),
                  mini: true,
                ),
                const SizedBox(
                  width: 10,
                ),
                FloatingActionButton(
                  heroTag: teyp == 'age' ? 'age++' : 'weight++',
                  onPressed: () {
                    setState(() {
                      teyp == 'age' ? age++ : weight++;
                    });
                  },
                  child: const Icon(Icons.add),
                  mini: true,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
