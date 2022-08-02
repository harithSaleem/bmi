import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  const Result({
    Key? key,
    required this.reslut,
    required this.isMeal,
    required this.age,
  }) : super(key: key);

  final double reslut;
  final bool isMeal;
  final int age;

  String get reslutPhares {
    String resulttext = '';
    if (reslut >= 30) {
      resulttext = 'obese';
    } else if (reslut > 25 && reslut < 30) {
      resulttext = 'overweigth';
    } else if (reslut > 18.5 && reslut < 24.9) {
      resulttext = 'normal';
    } else {
      resulttext = 'thin';
    }

    return resulttext;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: const Text(
          'Result',
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Gender:${isMeal ? 'Meal' : 'Femal'}',
                style: Theme.of(context).textTheme.headline3,
              ),
              Text(
                'Result:${reslut.toStringAsFixed(1)}',
                style: Theme.of(context).textTheme.headline3,
              ),
              Text(
                'Age:$age',
                style: Theme.of(context).textTheme.headline3,
              ),
              Text(
                'Healthnisse:$reslutPhares',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline3,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bulidContainer() {
    return Container(
      child: const Text(''),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22.0),
        color: Colors.amber[700],
      ),
    );
  }
}
