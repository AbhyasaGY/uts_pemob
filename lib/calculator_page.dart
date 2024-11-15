import 'package:uts_087/constant.dart';
import 'package:uts_087/my_button.dart';
import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  var userInput = '';
  var result = '';
  bool isDarkModeEnabled = false;
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Calculator',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 50,
              width: 75,
              child: DayNightSwitcher(
                dayBackgroundColor: Colors.blue,
                isDarkModeEnabled: isDarkModeEnabled,
                onStateChanged: (isDarkModeEnabled) {
                  setState(() {
                    this.isDarkModeEnabled = isDarkModeEnabled;
                  });
                },
              ),
            ),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.bottomRight,
                color: isDarkModeEnabled ? Colors.black : Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
                  child: SingleChildScrollView(
                    child: TextField(
                      controller: _textEditingController,
                      style: TextStyle(fontSize: 50, color: isDarkModeEnabled ? Colors.white : Colors.black),
                      readOnly: true,
                      textAlign: TextAlign.right,
                      autofocus: true,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: isDarkModeEnabled ? Colors.grey[900] : Colors.grey[200],
                child: Row(
                  children: [
                    // Kolom tombol kalkulator (seperti pada kode sebelumnya)
                    Expanded(
                      child: Column(
                        children: [
                          MyButton(
                            title: 'C',
                            onPress: () {
                              userInput = '';
                              result = '';
                              _textEditingController.text = '';
                            },
                          ),
                          MyButton(
                            title: '7',
                            onPress: () {
                              userInput += '7';
                              _textEditingController.text = userInput;
                            },
                          ),
                          MyButton(
                            title: '4',
                            onPress: () {
                              userInput += '4';
                              _textEditingController.text = userInput;
                            },
                          ),
                          MyButton(
                            title: '1',
                            onPress: () {
                              userInput += '1';
                              _textEditingController.text = userInput;
                            },
                          ),
                          MyButton(
                            title: '%',
                            onPress: () {
                              userInput += '%';
                              _textEditingController.text = userInput;
                            },
                          ),
                        ],
                      ),
                    ),
                    // Kolom lainnya tetap sama seperti pada referensi Anda...
                    Expanded(
                      child: Column(
                        children: [
                          MyButton(
                            title: '/',
                            onPress: () {
                              userInput += '/';
                              _textEditingController.text = userInput;
                            },
                          ),
                          MyButton(
                            title: '8',
                            onPress: () {
                              userInput += '8';
                              _textEditingController.text = userInput;
                            },
                          ),
                          MyButton(
                            title: '5',
                            onPress: () {
                              userInput += '5';
                              _textEditingController.text = userInput;
                            },
                          ),
                          MyButton(
                            title: '2',
                            onPress: () {
                              userInput += '2';
                              _textEditingController.text = userInput;
                            },
                          ),
                          MyButton(
                            title: '0',
                            onPress: () {
                              userInput += '0';
                              _textEditingController.text = userInput;
                            },
                          ),
                        ],
                      ),
                    ),
                    // Lanjutkan untuk kolom lainnya...
                    Expanded(
                      child: Column(
                        children: [
                          MyButton(
                            title: 'x',
                            onPress: () {
                              userInput += '*';
                              _textEditingController.text = userInput;
                            },
                          ),
                          MyButton(
                            title: '9',
                            onPress: () {
                              userInput += '9';
                              _textEditingController.text = userInput;
                            },
                          ),
                          MyButton(
                            title: '6',
                            onPress: () {
                              userInput += '6';
                              _textEditingController.text = userInput;
                            },
                          ),
                          MyButton(
                            title: '3',
                            onPress: () {
                              userInput += '3';
                              _textEditingController.text = userInput;
                            },
                          ),
                          MyButton(
                            title: '.',
                            onPress: () {
                              userInput += '.';
                              _textEditingController.text = userInput;
                            },
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          MyButton(
                            title: 'DEL',
                            onPress: () {
                              userInput = userInput.substring(0, userInput.length - 1);
                              _textEditingController.text = userInput;
                            },
                          ),
                          MyButton(
                            title: '-',
                            onPress: () {
                              userInput += '-';
                              _textEditingController.text = userInput;
                            },
                          ),
                          MyButton(
                            title: '+',
                            onPress: () {
                              userInput += '+';
                              _textEditingController.text = userInput;
                            },
                          ),
                          Expanded(
                            flex: 2,
                            child: Column(
                              children: [
                                MyButton(
                                  title: '=',
                                  onPress: () {
                                    equalPressed();
                                    _textEditingController.text = result;
                                    userInput = _textEditingController.text;
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Fungsi untuk mengevaluasi ekspresi
  void equalPressed() {
    Parser p = Parser();
    Expression expression = p.parse(userInput); // Parsing ekspresi
    ContextModel contextModel = ContextModel();
    double eval = expression.evaluate(EvaluationType.REAL, contextModel); // Evaluasi ekspresi
    result = eval.toString(); // Menyimpan hasil
  }
}
