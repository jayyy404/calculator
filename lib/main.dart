import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // manage the results for each operation
  double additionResult = 0;
  double subtractionResult = 0;
  double multiplicationResult = 0;
  double divisionResult = 0;

  // Controllers for input fields
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();

  // Store input values
  int firstNum = 0;
  int secondNum = 0;

  // Clear inputs and reset the results
  void clearInputs() {
    firstController.clear();
    secondController.clear();
    setState(() {
      additionResult = 0;
      subtractionResult = 0;
      multiplicationResult = 0;
      divisionResult = 0;
      firstNum = 0;
      secondNum = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unit 5 Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Addition Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: TextField(
                    controller: firstController,
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(labelText: "First Number"),
                    onChanged: (value) {
                      setState(() {
                        firstNum = int.tryParse(value) ?? 0;
                      });
                    },
                  ),
                ),
                const Text(" + "),
                Expanded(
                  child: TextField(
                    controller: secondController,
                    keyboardType: TextInputType.number,
                    decoration:
                        const InputDecoration(labelText: "Second Number"),
                    onChanged: (value) {
                      setState(() {
                        secondNum = int.tryParse(value) ?? 0;
                      });
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      additionResult = (firstNum + secondNum) as double;
                    });
                  },
                ),
                Text(' = ${additionResult.toStringAsFixed(2)}'),
              ],
            ),

            // Subtraction Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: TextField(
                    decoration:
                        const InputDecoration(labelText: "First Number"),
                    onChanged: (value) {
                      setState(() {
                        firstNum = int.tryParse(value) ?? 0;
                      });
                    },
                  ),
                ),
                const Text(" - "),
                Expanded(
                  child: TextField(
                    decoration:
                        const InputDecoration(labelText: "Second Number"),
                    onChanged: (value) {
                      setState(() {
                        secondNum = int.tryParse(value) ?? 0;
                      });
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: () {
                    setState(() {
                      subtractionResult = (firstNum - secondNum) as double;
                    });
                  },
                ),
                Text(' = ${subtractionResult.toStringAsFixed(2)}'),
              ],
            ),

            // Multiplication Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: TextField(
                    decoration:
                        const InputDecoration(labelText: "First Number"),
                    onChanged: (value) {
                      setState(() {
                        firstNum = int.tryParse(value) ?? 0;
                      });
                    },
                  ),
                ),
                const Text(" * "),
                Expanded(
                  child: TextField(
                    decoration:
                        const InputDecoration(labelText: "Second Number"),
                    onChanged: (value) {
                      setState(() {
                        secondNum = int.tryParse(value) ?? 0;
                      });
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    setState(() {
                      multiplicationResult = (firstNum * secondNum) as double;
                    });
                  },
                ),
                Text(' = ${multiplicationResult.toStringAsFixed(2)}'),
              ],
            ),

            // Division Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: TextField(
                    decoration:
                        const InputDecoration(labelText: "First Number"),
                    onChanged: (value) {
                      setState(() {
                        firstNum = int.tryParse(value) ?? 0;
                      });
                    },
                  ),
                ),
                const Text(" / "),
                Expanded(
                  child: TextField(
                    decoration:
                        const InputDecoration(labelText: "Second Number"),
                    onChanged: (value) {
                      setState(() {
                        secondNum = int.tryParse(value) ?? 0;
                      });
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(FontAwesomeIcons.divide),
                  onPressed: () {
                    setState(() {
                      if (secondNum != 0) {
                        divisionResult = firstNum / secondNum;
                      } else {
                        divisionResult = 0; // Handle division by zero
                      }
                    });
                  },
                ),
                Text(' = ${divisionResult.toStringAsFixed(2)}'),
              ],
            ),

            // Clear Button
            TextButton(
              onPressed: clearInputs,
              child: const Text("Clear"),
            ),
          ],
        ),
      ),
    );
  }
}
