import 'package:flutter/material.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: const Text("Calculator"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const SizedBox(height: 30),
          const Text("0", style: TextStyle(fontSize: 40, color: Colors.pink)),
          const SizedBox(height: 50),

          // Row 1:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("1", style: TextStyle(fontSize: 30, color: Colors.pink)),
              const Text("2", style: TextStyle(fontSize: 30, color: Colors.pink)),
              const Text("3", style: TextStyle(fontSize: 30, color: Colors.pink)),
            ],
          ),
          const SizedBox(height: 40),

          // Row 2:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("4", style: TextStyle(fontSize: 30, color: Colors.pink)),
              const Text("5", style: TextStyle(fontSize: 30, color: Colors.pink)),
              const Text("6", style: TextStyle(fontSize: 30, color: Colors.pink)),
            ],
          ),
          const SizedBox(height: 40),

          // Row 3:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("7", style: TextStyle(fontSize: 30, color: Colors.pink)),
              const Text("8", style: TextStyle(fontSize: 30, color: Colors.pink)),
              const Text("9", style: TextStyle(fontSize: 30, color: Colors.pink)),
            ],
          ),
          const SizedBox(height: 40),

          // Row 4:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("0", style: TextStyle(fontSize: 30, color: Colors.pink)),
              const Text("+", style: TextStyle(fontSize: 30, color: Colors.pink)),
              const Text("-", style: TextStyle(fontSize: 30, color: Colors.pink)),
            ],
          ),
          const SizedBox(height: 40),

          // Row 5:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("*", style: TextStyle(fontSize: 30, color: Colors.pink)),
              const Text("/", style: TextStyle(fontSize: 30, color: Colors.pink)),
              const Text("DEL", style: TextStyle(fontSize: 25, color: Colors.pink)),
              const Text("=", style: TextStyle(fontSize: 30, color: Colors.pink)),
            ],
          ),
        ],
      ),
    );
  }
}