import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stateful Lab',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CounterWidget(),
    );
  }
}

class CounterWidget extends StatefulWidget {
  @override
  _CounterWidgetState createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int _counter = 0; 

Color getCounterColor() {
  if (_counter == 0) return Colors.red;    // Level 2: Red at 0
  if (_counter > 50) return Colors.green;  // Level 2: Green above 50
  return Colors.black;                     // Default
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Interactive Counter')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              color: Colors.blue.shade100,
              padding: EdgeInsets.all(20),
              child: Text(
                '$_counter',
                style: TextStyle(
                  fontSize: 50.0,
                  color: getCounterColor(),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_counter < 100) _counter++; // Increment logic
                  });
                },
                child: Text("+"),
              ),
              SizedBox(width: 10),
              // Decrement Button
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (_counter > 0) _counter--; 
                  });
                },
                child: Text("-"),
              ),
              SizedBox(width: 20), // Spacing between buttons
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _counter = 0; // Reset logic
                  });
                },
                child: Text("Reset"),
              ),
            ],
          ),
          Slider(
            min: 0, max: 100,
            value: _counter.toDouble(),
            onChanged: (double value) {
              // 👇 This triggers the UI rebuild
              setState(() {
                _counter = value.toInt();
              });
            },
          ),
        ],
      ),
    );
  }
}