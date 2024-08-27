import 'package:bmi_calculator/bmi_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BmiResult extends StatelessWidget {
  const BmiResult({super.key, });



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Result'),
      ),
      body: SingleChildScrollView(
        child: Consumer<BmiPeovider>(
          builder:(context, provider, child) =>  Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Your BMI',
                style: TextStyle(
                    fontSize: 24, fontWeight: FontWeight.bold, color: Colors.grey),
              ),
              Text(
                '${provider.bmi}',
                style: TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold),
              ),
              Text(
                'You Are',
                style: TextStyle(fontSize: 24, color: Colors.grey),
              ),
              Text(
                provider.getBmiStutas(),
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
              ),
              Text(
                'BMI Table',
                style: TextStyle(fontSize: 24, color: Colors.grey),
              ),
              Column(
                children: [
                  for (final key in provider.bmiSTUTAsMap.keys)
                    ListTile(
                      tileColor: provider.getTileColor(key),
                      title: Text(key),
                      trailing: Text(
                        '${provider.bmiSTUTAsMap[key]}',
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
      ),
    );
  }
}

