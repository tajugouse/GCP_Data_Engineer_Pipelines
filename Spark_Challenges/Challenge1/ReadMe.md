#### Your marketing team wants to identify the top-selling products based on revenue for a given time period. The query is expected to be executed frequently, and the results need to be returned quickly. Design a caching strategy that efficiently retrieves the top-selling products by revenue

#### Schema = customer ID, purchase date, product id, and amount



##### output:

      +-----------+------------------+                                                
      |customer_id|           revenue|
      +-----------+------------------+
      |         43|             100.0|
      |          5| 99.98999786376953|
      |         17|              90.0|
      |         30| 88.80000305175781|
      |         39|              82.0|
      |          8|              75.0|
      |         34|              70.0|
      |         25| 67.88999938964844|
      |         45|             60.25|
      |         15|              60.0|
      |         19|             55.25|
      |         32|              54.5|
      |         22|  49.9900016784668|
      |         28|              48.0|
      |          3|             45.75|
      |         47|44.900001525878906|
      |         10|              40.0|
      |         40|  39.9900016784668|
      |         37|             38.25|
      |         50|             37.75|
      +-----------+------------------+
