from pyspark.sql import SparkSession
from pyspark import SparkContext 
from pyspark.sql.functions import *

spark = SparkSession.builder.appName('test').getOrCreate()

df_schema = 'booking_id long, guest_name string, checkin_date date, checkout_date date, room_type string,total_price double'
df = spark.read.format('csv').schema(df_schema).load('/root/spark/guests.csv')
total_bookings= df.count()
print(total_bookings)

groupped = df.groupBy('room_type').agg(avg('total_price').alias('average')).show()
