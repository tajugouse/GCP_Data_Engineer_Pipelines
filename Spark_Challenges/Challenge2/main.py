from pyspark.sql import SparkSession
from pyspark.sql.functions import month,year,count_distinct
from pyspark.sql.storagelevel import StorageLevel

spark = SparkSession.builder.appName('ordes_transformation').getOrCreate()


orders_schema = 'customer_id long,purchase_date date,product_id long,transaction_amount double'

orders_df = spark.read.format('csv').schema(orders_schema).load('/root/spark/orders.csv')

# orders_df.show()

df_months = orders_df.withColumn('purchased_year',year('purchase_date')).withColumn('purchased_mon',month('purchase_date'))

# df_months.show()


agg_df = df_months.groupBy('customer_id','purchased_year','purchased_mon').agg(count_distinct('purchase_date').alias('distinct_months')).orderBy(['customer_id','purchased_year','purchased_mon'],ascending =
[True,True,True]).persist(StorageLevel.Memory_Only)
# agg_df.show()

ordered_df = agg_df.filter('distinct_months ==1').groupBy('customer_id').count().orderBy('count',ascending=False)

ordered_df.show(20)