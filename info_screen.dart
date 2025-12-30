import 'package:flutter/material.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Info')),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'Diese App rechnet Eurobeträge in anderen Währungen um.\n\n'
          'Verwendete Währungen:\n'
          '- USD\n- JPY\n- GBP\n- CHF',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
