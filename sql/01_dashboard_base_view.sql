-- Central semantic layer for the GoExplore dashboard.
-- Replace `your-project-id` with the ID of your Google Cloud project.

CREATE OR REPLACE VIEW `your-project-id.goexplore.v_dashboard_sales` AS
SELECT
  ds.`Date` AS sale_date,
  ds.`Retailer code` AS retailer_code,
  r.`Retailer name` AS retailer_name,
  r.`Country` AS country,
  ds.`Product number` AS product_number,
  p.`Product line` AS product_line,
  p.`Product type` AS product_type,
  ds.`Order method code` AS order_method_code,
  m.`Order method type` AS order_method_type,
  ds.`Quantity` AS quantity,
  ds.`Unit price` AS unit_price,
  ds.`Unit sale price` AS unit_sale_price,
  p.`Unit cost` AS unit_cost,
  ds.`Quantity` * ds.`Unit sale price` AS revenue,
  ds.`Quantity` * (ds.`Unit sale price` - p.`Unit cost`) AS gross_profit,
  SAFE_DIVIDE(
    ds.`Unit sale price` - p.`Unit cost`,
    ds.`Unit sale price`
  ) AS gross_margin_rate,
  ds.`Unit sale price` < ds.`Unit price` AS is_discounted
FROM `your-project-id.goexplore.daily_sales` AS ds
INNER JOIN `your-project-id.goexplore.retailers` AS r
  ON ds.`Retailer code` = r.`Retailer code`
INNER JOIN `your-project-id.goexplore.products` AS p
  ON ds.`Product number` = p.`Product number`
INNER JOIN `your-project-id.goexplore.methods` AS m
  ON ds.`Order method code` = m.`Order method code`;
