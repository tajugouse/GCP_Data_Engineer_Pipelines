from pyspark.sql import SparkSession
from pyspark.sql import functions as f

spark = SparkSession.builder.appName("test").getOrCreate()

data_schema = "customer_id INTEGER, purchase_date STRING, product_id INTEGER, amount FLOAT"


df = spark.read.format('csv').schema(data_schema).load('/root/spark/order.csv')


filtered_df = df.filter((df.purchase_date>='2023-01-01') & (df.purchase_date <='2023-02-20')).cache()

revenue_df = filtered_df.select('customer_id','amount').groupBy("customer_id").sum("amount").withColumnRenamed('sum(amount)','revenue')
revenue_sorted =revenue_df.sort('revenue',ascending = False).show()



# Find the top 10 customers with maximum transaction amount for the same
# date range

top_10_customers = revenue_sorted.limit(10).show()
