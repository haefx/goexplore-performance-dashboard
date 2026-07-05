# Hinweise zu den SQL-Abfragen

Die Abfragen im Repository wurden gegenüber den ersten Analyseentwürfen fachlich bereinigt und vereinheitlicht.

## Durchschnittlicher Umsatz je Händler

Nicht korrekt für diese Kennzahl:

```sql
AVG(Quantity * Unit_sale_price)
```

Das ergibt den durchschnittlichen Umsatz einer Verkaufszeile.

Verwendete Definition:

```sql
SAFE_DIVIDE(SUM(revenue), COUNT(DISTINCT retailer_code))
```

Damit entspricht die KPI dem Gesamtumsatz pro aktivem Händler im jeweils gefilterten Zeitraum.

## Verkaufskanal

Der Verkaufskanal ist nicht direkt in `daily_sales` enthalten, sondern wird über `Order method code` aus der Tabelle `methods` ergänzt. Filter wie `Web` werden deshalb auf `order_method_type` angewendet.

## Rabattstatus

Der Rabattstatus wird einheitlich in der Basis-View berechnet:

```sql
unit_sale_price < unit_price
```

So verwenden Diagramme und KPI-Karten dieselbe Definition.

## Zählkennzahlen

Ohne Bestell-ID ist `COUNT(*)` eine Anzahl von Verkaufsdatensätzen. Im Repository wird sie deshalb als `sales_records` bezeichnet und nicht als eindeutige Anzahl von Bestellungen.
