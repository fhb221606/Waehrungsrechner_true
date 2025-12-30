import 'package:flutter/material.dart';
import 'currency.dart';
import 'info_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Controller für das Texteingabefeld
  final TextEditingController controller = TextEditingController();
  // Default Währung
  String selectedCurrency = 'USD';
  // Ergebnistext
  String result = '';

  // Führt die Umrechnung durch
  void convert() {
    // Text aus dem Feld in eine Zahl umwandeln
    final value = double.tryParse(controller.text) ?? 0;
    
    // Currency-Objekt mit Euro-Betrag erstellen
    final currency = Currency(value);

    double converted;

    // Dropdownmenu Auswahl
    switch (selectedCurrency) {
      case 'USD':
        converted = currency.toUSD();
        break;
      case 'JPY':
        converted = currency.toJPY();
        break;
      case 'GBP':
        converted = currency.toGBP();
        break;
      case 'CHF':
        converted = currency.toCHF();
        break;
      default:
        converted = value;
    }

    // UI aktualisieren
    setState(() {
      result = currency.toUSD().toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Währungsrechner'),
        actions: [
          // Navigation zum Info_screen
          IconButton(
            icon: const Icon(Icons.info),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => InfoScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Eingabefeld links
            Expanded(
              flex: 3,
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'EUR'),
              ),
            ),
            const SizedBox(width: 10),

            // Dropdownmenu center
            Expanded(
              flex: 2,
              child: DropdownButtonFormField<String>(
                initialValue: selectedCurrency,
                decoration: const InputDecoration(labelText: 'Währung'),
                items: const [
                  DropdownMenuItem(value: 'USD', child: Text('USD')),
                  DropdownMenuItem(value: 'JPY', child: Text('JPY')),
                  DropdownMenuItem(value: 'GBP', child: Text('GBP')),
                  DropdownMenuItem(value: 'CHF', child: Text('CHF')),
                ],
                onChanged: (value) {
                  setState(() {
                    selectedCurrency = value!;
                  });
                },
              ),
            ),
            const SizedBox(width: 10),

            // Button und Ergebnis rechts
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: convert,
                    child: const Text('Umrechnen'),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    result.isEmpty
                        ? 'Ergebnis'
                        : '$result $selectedCurrency',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
