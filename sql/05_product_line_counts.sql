-- Number of products in each product line.

SELECT
  `Product line` AS product_line,
  COUNT(*) AS product_count
FROM `your-project-id.goexplore.products`
GROUP BY product_line
ORDER BY product_count DESC;
