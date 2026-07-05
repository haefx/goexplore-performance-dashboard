# Datenmodell

Das Projekt verwendet ein einfaches Sternschema. `daily_sales` bildet die Faktentabelle; Händler, Produkte und Verkaufsmethoden liefern die beschreibenden Dimensionen.

```mermaid
erDiagram
    DAILY_SALES }o--|| RETAILERS : "Retailer code"
    DAILY_SALES }o--|| PRODUCTS : "Product number"
    DAILY_SALES }o--|| METHODS : "Order method code"

    DAILY_SALES {
        date Date
        string Retailer_code
        string Product_number
        string Order_method_code
        integer Quantity
        numeric Unit_price
        numeric Unit_sale_price
    }

    RETAILERS {
        string Retailer_code
        string Retailer_name
        string Country
    }

    PRODUCTS {
        string Product_number
        string Product_line
        string Product_type
        numeric Unit_cost
    }

    METHODS {
        string Order_method_code
        string Order_method_type
    }
```

## Faktentabelle

### `daily_sales`

Enthält die verkaufsbezogenen Messwerte. Jede Zeile wird als Verkaufsdatensatz behandelt. Da keine eindeutige Bestell-ID vorliegt, darf `COUNT(*)` nicht ohne Einschränkung als Anzahl vollständiger Bestellungen interpretiert werden.

## Dimensionstabellen

### `retailers`

Ergänzt Händlername und Land. Die Tabelle ermöglicht Händler-Rankings, Länderanalysen und die Berechnung aktiver Händler.

### `products`

Ergänzt Produktkategorie, Produkttyp und Stückkosten. Daraus werden Produktmix, Bruttogewinn und Bruttomarge abgeleitet.

### `methods`

Ordnet technische Methodencodes den lesbaren Verkaufskanälen zu.

## Semantische View

`v_dashboard_sales` führt die Tabellen zusammen und berechnet wiederverwendbare Felder:

- `revenue`
- `gross_profit`
- `gross_margin_rate`
- `is_discounted`

Damit verwenden alle Dashboard-Seiten dieselben KPI-Definitionen.
