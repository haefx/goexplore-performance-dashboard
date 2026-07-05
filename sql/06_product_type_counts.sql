-- Number of products in each product type.

SELECT
  `Product type` AS product_type,
  COUNT(*) AS product_type_count
FROM `your-project-id.goexplore.products`
GROUP BY product_type
ORDER BY product_type_count DESC;
