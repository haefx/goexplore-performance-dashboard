-- Category performance for product-mix and portfolio decisions.

SELECT
  product_line,
  SUM(quantity) AS units_sold,
  ROUND(SUM(revenue), 2) AS total_revenue,
  ROUND(SUM(gross_profit), 2) AS gross_profit,
  SAFE_DIVIDE(SUM(gross_profit), SUM(revenue)) AS gross_margin_rate,
  SAFE_DIVIDE(SUM(revenue), SUM(SUM(revenue)) OVER ()) AS revenue_share
FROM `your-project-id.goexplore.v_dashboard_sales`
GROUP BY product_line
ORDER BY total_revenue DESC;
