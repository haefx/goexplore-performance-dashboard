-- Time series for the stacked channel chart in the Filter Board.
-- Add a predicate such as AND order_method_type = 'Web' for a single-channel view.

SELECT
  sale_date,
  order_method_type AS channel,
  SUM(quantity) AS units_sold,
  ROUND(SUM(revenue), 2) AS total_revenue,
  ROUND(SUM(gross_profit), 2) AS gross_profit
FROM `your-project-id.goexplore.v_dashboard_sales`
WHERE order_method_type IS NOT NULL
GROUP BY sale_date, channel
ORDER BY sale_date, channel;
