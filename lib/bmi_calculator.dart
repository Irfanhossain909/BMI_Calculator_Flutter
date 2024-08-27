import 'package:bmi_calculator/bmi_provider.dart';
import 'package:bmi_calculator/bmi_result.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
        child: Consumer<BmiPeovider>(
          builder:(context, provider, child) =>  Column(
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
              const SizedBox(
                height: 10.0,
              ),
              TextField(
                controller: _heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Enter Your Height (on metter)',
                  prefixIcon: Icon(Icons.numbers),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              OutlinedButton(
                  onPressed: _onCalculateButtonPreesed,
                  child: Text('Calculate'))
            ],
          ),
        ),
      ),
    );
  }

  void _onCalculateButtonPreesed() {
    if (_weightController.text.isEmpty) {
      showMsg(context, 'Pleace provide your Weght!!');
      return;
    }
    if (_heightController.text.isEmpty) {
      showMsg(context, 'Pleace provide your Heght!!');
      return;
    }
    context
        .read<BmiPeovider>()
        .calculateBmi(_weightController.text, _heightController.text);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const BmiResult()));
  }
}

showMsg(BuildContext context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
}
