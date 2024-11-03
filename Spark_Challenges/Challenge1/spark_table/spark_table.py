from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("test").getOrCreate()
data_schema = "customer_id INTEGER, purchase_date STRING, product_id INTEGER, amount FLOAT"

df = spark.read.format('csv').schema(data_schema).option("header", "true").load('/root/spark/order.csv')

spark.sql("CREATE DATABASE IF NOT EXISTS db")

df.write.saveAsTable("db.revenues")

spark.sql("SHOW TABLES IN db").show()

df_table = spark.sql("SELECT * FROM db.revenues").show()

spark.sql("SELECT customer_id, SUM(amount) AS revenue FROM db.revenues WHERE purchase_date >= '2023-01-01' AND purchase_date <= '2023-06-30' GROUP BY customer_id ORDER BY revenue DESC LIMIT 10").show()