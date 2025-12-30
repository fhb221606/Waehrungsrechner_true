import 'package:flutter/material.dart';
import 'currency.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Controller für das Texteingabefeld
  final TextEditingController controller = TextEditingController();
    
  // Ergebnis-Text
  String result = '';

  // Führt die Umrechnung durch
  void convert() {
    // Text aus dem Feld in eine Zahl umwandeln
    final value = double.tryParse(controller.text) ?? 0;
    // Currency-Objekt mit Euro-Betrag erstellen
    final currency = Currency(value);


    // UI aktualisieren
    setState(() {
      result = currency.toUSD().toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Währungsrechner')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Eingabe des Euro-Betrags
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Betrag in Euro',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: convert,
              child: const Text('In USD umrechnen'),
            ),
            const SizedBox(height: 20),
            Text(
              'Ergebnis: $result USD',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
