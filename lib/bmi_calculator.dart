import 'package:bmi_calculator/bmi_result.dart';
import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {

  final _weightController = TextEditingController();
  final _heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48.0, vertical: 8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Your Weight (in kg)',
                prefixIcon: Icon(Icons.scale),
                border: OutlineInputBorder(),

              ),
            ),
            const SizedBox(height: 10.0,),
            TextField(
              controller: _heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter Your Height (on metter)',
                prefixIcon: Icon(Icons.numbers),
                border: OutlineInputBorder(),

              ),
            ),
            const SizedBox(height: 20.0,),
            OutlinedButton(
                onPressed: _calculateBmi,
                child: Text('Calculate'))
          ],
        ),
      ),
    );
  }

  void _calculateBmi() {
    if (_weightController.text.isEmpty) {
      showMsg(context, 'Pleace provide your Weght!!');
      return;
    }
    if (_heightController.text.isEmpty) {
      showMsg(context, 'Pleace provide your Heght!!');
      return;
    }

    final weight = double.parse(_weightController.text);
    final height = double.parse(_heightController.text);

    final bmi = weight / (height * height);

    Navigator.push(context, MaterialPageRoute(builder: (context) => BmiResult(bmi: bmi,)));

    // showMsg(context, bmi.toStringAsFixed(1));
  }
}

showMsg(BuildContext context, String msg) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(msg)));
}
