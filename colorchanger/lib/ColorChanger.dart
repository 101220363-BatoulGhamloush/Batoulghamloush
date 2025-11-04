import 'dart:math';
import 'package:flutter/material.dart';
import 'GradientContainer.dart';

class ColorChanger extends StatefulWidget {
  const ColorChanger({super.key});

  @override
  State<ColorChanger> createState() => _ColorChangerState();
}

class _ColorChangerState extends State<ColorChanger> {
  Color currentColor = Colors.blue;
  int directionIndex = 0;

  // List of gradient directions (begin, end)
  final List<List<Alignment>> directions = [
    [Alignment.topCenter, Alignment.bottomCenter], // Vertical
    [Alignment.centerLeft, Alignment.centerRight], // Horizontal
    [Alignment.topLeft, Alignment.bottomRight], // Left-Right
    [Alignment.topRight, Alignment.bottomLeft], // Right-Left
  ];

  // Generate random color
  void changeColor() {
    final random = Random();
    setState(() {
      currentColor = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );
    });
  }

  // Change gradient direction
  void changeDirection() {
    setState(() {
      directionIndex = (directionIndex + 1) % directions.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final directionNames = ["Vertical", "Horizontal", "Left Right", "Right Left"];

    return Scaffold(
      body: GradientContainer(
       color:currentColor,
        begin: directions[directionIndex][0],
        end: directions[directionIndex][1],
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Red: ${currentColor.red}  Green: ${currentColor.green}  Blue: ${currentColor.blue}",
                 style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: changeColor,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Change Color"),
                
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: changeDirection,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Change Direction"),
              ),
              const SizedBox(height: 20),
              Text(
                "Direction: ${directionNames[directionIndex]}",
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
 
