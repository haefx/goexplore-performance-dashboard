-- Discount analysis for the Web channel.
-- A record is discounted when the actual sale price is below the regular unit price.

SELECT
  product_line,
  COUNTIF(is_discounted) AS discounted_sales_records,
  COUNTIF(NOT is_discounted) AS regular_sales_records,
  ROUND(SUM(IF(is_discounted, revenue, 0)), 2) AS discounted_revenue,
  ROUND(SUM(IF(NOT is_discounted, revenue, 0)), 2) AS regular_revenue,
  ROUND(SUM(IF(is_discounted, gross_profit, 0)), 2) AS discounted_gross_profit,
  SAFE_DIVIDE(
    SUM(IF(is_discounted, gross_profit, 0)),
    SUM(IF(is_discounted, revenue, 0))
  ) AS discounted_gross_margin_rate
FROM `your-project-id.goexplore.v_dashboard_sales`
WHERE order_method_type = 'Web'
GROUP BY product_line
ORDER BY discounted_sales_records DESC;
