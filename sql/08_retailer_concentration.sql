-- Retailer ranking and cumulative revenue concentration.
-- The first ten rows support the Top-10 retailer table and concentration analysis.

WITH retailer_revenue AS (
  SELECT
    retailer_code,
    retailer_name,
    country,
    SUM(revenue) AS revenue
  FROM `your-project-id.goexplore.v_dashboard_sales`
  GROUP BY retailer_code, retailer_name, country
),
ranked AS (
  SELECT
    retailer_code,
    retailer_name,
    country,
    revenue,
    RANK() OVER (ORDER BY revenue DESC) AS revenue_rank,
    SAFE_DIVIDE(revenue, SUM(revenue) OVER ()) AS revenue_share,
    SAFE_DIVIDE(
      SUM(revenue) OVER (
        ORDER BY revenue DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
      ),
      SUM(revenue) OVER ()
    ) AS cumulative_revenue_share
  FROM retailer_revenue
)
SELECT
  retailer_code,
  retailer_name,
  country,
  ROUND(revenue, 2) AS revenue,
  revenue_rank,
  revenue_share,
  cumulative_revenue_share
FROM ranked
WHERE revenue_rank <= 10
ORDER BY revenue_rank;
