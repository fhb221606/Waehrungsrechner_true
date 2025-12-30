/// Diese Klasse enthält die Umrechnungslogik
class Currency {
  double amountInEur;

  // Konstruktor bekommt den Euro-Betrag
  Currency(this.amountInEur);

  // Umrechnung von EUR in USD
  double toUSD() => amountInEur * 1.09;

  // Umrechnung von EUR in JPY
  double toJPY() => amountInEur * 160.0;

  // Umrechnung von EUR in GBP
  double toGBP() => amountInEur * 0.86;

  // Umrechnung von EUR in CHF
  double toCHF() => amountInEur * 0.97;
}
