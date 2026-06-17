import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _navigateToColorScreen(BuildContext context, String colorName, Color backgroundColor, Color textColor) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ColorDetailScreen(
          colorName: colorName,
          backgroundColor: backgroundColor,
          textColor: textColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'BackGround App',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.grey[900],
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // 1. Pink Color Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pink[300]),
                onPressed: () => _navigateToColorScreen(
                    context,
                    'Pink',
                    Colors.pink[100]!,
                    Colors.pink[900]!
                ),
                child: const Text('Pink', style: TextStyle(color: Colors.white)),
              ),
              // 2. Royal Blue Color Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[800]),
                onPressed: () => _navigateToColorScreen(
                    context,
                    'Blue',
                    Colors.blue[900]!,
                    Colors.blue[100]!
                ),
                child: const Text('Blue', style: TextStyle(color: Colors.white)),
              ),
              // 3. Lavender Color Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.purple[300]),
                onPressed: () => _navigateToColorScreen(
                    context,
                    'Lavender',
                    Colors.purple[50]!,
                    Colors.purple[900]!
                ),
                child: const Text('Lavender', style: TextStyle(color: Colors.white)),
              ),
              // 4. Reset Button
              IconButton(
                style: IconButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                icon: const Icon(Icons.refresh),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                        (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ColorDetailScreen extends StatelessWidget {
  final String colorName;
  final Color backgroundColor;
  final Color textColor;

  const ColorDetailScreen({
    super.key,
    required this.colorName,
    required this.backgroundColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        title: Text(colorName, style: TextStyle(color: textColor, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: textColor),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Text(
          colorName,
          style: TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}