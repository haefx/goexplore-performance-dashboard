# Projektworkflow

## 1. Datenprüfung in Excel

Vor dem Import wurden Tabellenstruktur, Spaltentypen und Schlüssel geprüft. Excel diente für erste Summen, Stichproben und Plausibilitätsvergleiche.

Wichtige Prüfungen:

- Sind Produkt-, Händler- und Methodencodes vollständig?
- Lassen sich Fremdschlüssel eindeutig den Dimensionstabellen zuordnen?
- Sind Mengen und Preise numerisch importierbar?
- Stimmen Testberechnungen für Umsatz und Bruttogewinn?
- Gibt es leere oder auffällige Werte in zentralen Feldern?

## 2. Import nach BigQuery

Die Tabellen wurden getrennt importiert, damit Fakten und Dimensionen unabhängig gepflegt und geprüft werden können.

Empfohlene Datentypen:

| Feldtyp | BigQuery-Typ |
|---|---|
| Datum | `DATE` |
| Codes und Namen | `STRING` |
| Menge | `INT64` |
| Preise und Kosten | `NUMERIC` |

## 3. SQL-Modellierung

Die SQL-Schicht trennt technische Quelldaten von den Dashboard-Kennzahlen. Eine zentrale View verhindert, dass Umsatz oder Marge in mehreren Diagrammen unterschiedlich definiert werden.

Die Analysen umfassen:

- Management-KPIs
- Umsatz und Profitabilität nach Land
- rabattierte und reguläre Verkäufe
- Produktportfolio
- zeitliche Entwicklung nach Verkaufskanal
- Händler-Ranking und kumulierte Konzentration

## 4. Looker Studio

Die BigQuery-Abfragen wurden als Datenquellen verwendet. Im Dashboard wurden die Kennzahlen nach Managementrelevanz geordnet:

1. Gesamtzustand des Geschäfts
2. Konzentrations- und Strukturrisiken
3. Produktmix
4. Rabatt- und Kanalstruktur
5. Filterbare Detailanalyse

## 5. Validierung

Die wichtigsten KPI-Werte wurden zwischen Excel, BigQuery und Looker Studio abgeglichen. Abweichungen wurden auf Aggregationsebene geprüft - insbesondere beim durchschnittlichen Händlerumsatz und bei Zählkennzahlen.
