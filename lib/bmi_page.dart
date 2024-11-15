import 'package:flutter/material.dart';

class CalculatorBMIPage extends StatefulWidget {
  @override
  _CalculatorBMIPageState createState() => _CalculatorBMIPageState();
}

class _CalculatorBMIPageState extends State<CalculatorBMIPage> {
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double? _bmiResult;
  String? _bmiCategory;

  void _calculateBMI() {
    double height = double.tryParse(_heightController.text) ?? 0;
    double weight = double.tryParse(_weightController.text) ?? 0;

    if (height > 0 && weight > 0) {
      // Mengonversi tinggi dari sentimeter ke meter jika diperlukan
      if (height > 10) {
        height = height / 100;
      }
      setState(() {
        _bmiResult = weight / (height * height);
        _bmiCategory = _getBMICategory(_bmiResult!);
      });
    }
  }

  String _getBMICategory(double bmi) {
    if (bmi < 18.5) return "Kekurangan Berat Badan";
    if (bmi < 24.9) return "Normal";
    if (bmi < 29.9) return "Kelebihan Berat Badan";
    return "Obesitas";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator BMI", style: TextStyle(fontFamily: 'Poppins')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _heightController,
              decoration: InputDecoration(
                labelText: "Tinggi Badan (cm atau m)",
                labelStyle: TextStyle(fontFamily: 'Poppins'),
              ),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _weightController,
              decoration: InputDecoration(
                labelText: "Berat Badan (kg)",
                labelStyle: TextStyle(fontFamily: 'Poppins'),
              ),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: Text("Hitung BMI", style: TextStyle(fontFamily: 'Poppins')),
            ),
            if (_bmiResult != null)
              Column(
                children: [
                  Text(
                    "BMI Anda adalah ${_bmiResult!.toStringAsFixed(2)}",
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 18),
                  ),
                  Text(
                    "Kategori: $_bmiCategory",
                    style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
