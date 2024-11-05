#### 1. Write a query to fetch the total count of hotel bookings in the hotel_bookings table and compare the duration it took to determine the impact of caching.

#### 2. Calculate the average total price of bookings grouped by room_type for the first 100 records in the hotel_bookings table without caching. Execute the same query after caching the table and compare the duration.

#### Schema: booking_id, guest_name, checkin_date, checkout_date, room_type, and total_price.


### Output:

        +----------+----------------+------------+-------------+---------+-----------+  
        |booking_id|      guest_name|checkin_date|checkout_date|room_type|total_price|
        +----------+----------------+------------+-------------+---------+-----------+
        |         1|        John Doe|  2024-10-01|   2024-10-05|   Single|      500.0|
        |         2|      Jane Smith|  2024-10-02|   2024-10-06|   Double|      800.0|
        |         3| Michael Johnson|  2024-10-03|   2024-10-04|    Suite|     1200.0|
        |         4|     Emily Davis|  2024-10-10|   2024-10-15|   Single|      600.0|
        |         5|       Chris Lee|  2024-10-05|   2024-10-10|   Double|      900.0|
        |         6|     Kate Wilson|  2024-10-11|   2024-10-12|    Suite|     1300.0|
        |         7|     David Brown|  2024-10-06|   2024-10-07|   Single|      450.0|
        |         8|     Susan Green|  2024-10-12|   2024-10-14|   Double|      750.0|
        |         9|    Robert Clark|  2024-10-09|   2024-10-11|    Suite|     1000.0|
        |        10|     Linda Lewis|  2024-10-08|   2024-10-13|   Single|      550.0|
        |        11|   William White|  2024-10-01|   2024-10-03|   Double|      700.0|
        |        12|  Jessica Martin|  2024-10-02|   2024-10-07|    Suite|     1350.0|
        |        13|  Matthew Garcia|  2024-10-04|   2024-10-08|   Single|      500.0|
        |        14|    Amy Martinez|  2024-10-06|   2024-10-10|   Double|      850.0|
        |        15|Andrew Hernandez|  2024-10-10|   2024-10-14|    Suite|     1250.0|
        |        16|  Patricia Young|  2024-10-11|   2024-10-13|   Single|      480.0|
        |        17|     James Allen|  2024-10-12|   2024-10-14|   Double|      780.0|
        |        18|      Nancy King|  2024-10-03|   2024-10-05|    Suite|     1150.0|
        |        19|    Daniel Scott|  2024-10-07|   2024-10-09|   Single|      550.0|
        |        20|   Barbara Adams|  2024-10-01|   2024-10-06|   Double|      950.0|
        +----------+----------------+------------+-------------+---------+-----------+
        only showing top 20 rows
        
        +--------+
        |count(1)|
        +--------+
        |      50|
        +--------+
        
        +---------+------------------+
        |room_type|  avg(total_price)|
        +---------+------------------+
        |   Double| 802.3529411764706|
        |    Suite|          1246.875|
        |   Single|506.47058823529414|
        +---------+------------------+