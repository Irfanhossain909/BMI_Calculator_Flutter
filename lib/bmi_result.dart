import 'package:flutter/material.dart';

class BmiResult extends StatelessWidget {
  const BmiResult({super.key, required this.bmi});

  final double bmi;

  String getBmiStutas() {
    if (bmi < 16) return underweightSeverethinness;
    if (bmi >= 16.0 && bmi <= 16.9) return underweightModeratethinness;
    if (bmi >= 17.0 && bmi <= 18.4) return underweightMildthinness;
    if (bmi >= 18.5 && bmi <= 24.9) return NormalRange;
    if (bmi >= 25.0 && bmi <= 29.9) return OverweightPreobese;
    if (bmi >= 30.0 && bmi <= 34.9) return ClassOne;
    if (bmi >= 35.0 && bmi <= 39.9) return ClassTwo;
    return ClassThree;
  }
  Color? getTileColor(String stutas){
    if(getBmiStutas() == stutas) {
      if(stutas == underweightSeverethinness) return Colors.red;
      if(stutas == underweightModeratethinness) return Colors.red[400];
      if(stutas == underweightMildthinness) return Colors.red[200];
      if(stutas == NormalRange) return Colors.green;
      if(stutas == OverweightPreobese) return Colors.green[400];
      if(stutas == ClassOne) return Colors.green[300];
      if(stutas == ClassTwo) return Colors.yellowAccent;
      return Colors.red;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Your BMI',
              style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey),
            ),
            Text(
              '${bmi.toStringAsFixed(1)}',
              style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'You Are',
              style: TextStyle(fontSize: 24, color: Colors.grey),
            ),
            Text(
              getBmiStutas(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'BMI Table',
              style: TextStyle(fontSize: 24, color: Colors.grey),
            ),
            Column(
              children: [
                for (final key in bmiSTUTAsMap.keys)
                  ListTile(
                    tileColor: getTileColor(key),
                    title: Text(key),
                    trailing: Text(
                      '${bmiSTUTAsMap[key]}',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}

const underweightSeverethinness = 'Underweight \n(Severe thinness)';
const underweightModeratethinness = 'Underweight \n(Moderate thinness)';
const underweightMildthinness = 'Underweight \n(Mild thinness)';
const NormalRange = 'Normal';
const OverweightPreobese = 'Overweight \n(Pre-obese)';
const ClassOne = 'Obese \n(Class I)';
const ClassTwo = 'Obese \n(Class II)';
const ClassThree = 'Obese \n(Class III)';

final bmiSTUTAsMap = {
  underweightSeverethinness: 'less then 16.0',
  underweightModeratethinness: '16.0 - 16.9',
  underweightMildthinness: '17.0 - 18.4',
  NormalRange: '18.5 - 24.9',
  OverweightPreobese: '25.0 - 29.9',
  ClassOne: '30.0 - 34.4',
  ClassTwo: '35.0 - 39.9',
  ClassThree: '40.0 and up'
};
