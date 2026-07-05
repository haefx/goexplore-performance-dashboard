-- Revenue and sales activity by country.
-- sales_records represents rows in the sales table because no unique order ID is available.

SELECT
  country,
  COUNT(*) AS sales_records,
  SUM(quantity) AS units_sold,
  ROUND(SUM(revenue), 2) AS total_revenue,
  ROUND(SUM(gross_profit), 2) AS gross_profit,
  SAFE_DIVIDE(SUM(gross_profit), SUM(revenue)) AS gross_margin_rate
FROM `your-project-id.goexplore.v_dashboard_sales`
GROUP BY country
ORDER BY total_revenue DESC;
