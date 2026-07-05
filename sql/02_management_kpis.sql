-- Management KPIs used in the dashboard scorecards.
-- Optional filters can be added to the WHERE clause and will affect all KPIs consistently.

SELECT
  ROUND(SUM(revenue), 2) AS total_revenue,
  ROUND(SUM(gross_profit), 2) AS total_gross_profit,
  SAFE_DIVIDE(SUM(gross_profit), SUM(revenue)) AS gross_margin_rate,
  SUM(quantity) AS units_sold,
  COUNT(DISTINCT retailer_code) AS active_retailers,
  ROUND(
    SAFE_DIVIDE(SUM(revenue), COUNT(DISTINCT retailer_code)),
    2
  ) AS average_revenue_per_retailer
FROM `your-project-id.goexplore.v_dashboard_sales`
-- WHERE sale_date BETWEEN DATE('2015-01-01') AND DATE('2017-12-31')
;
