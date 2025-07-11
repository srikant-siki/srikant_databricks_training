# Databricks notebook source
# MAGIC %sql
# MAGIC SELECT * FROM `jpmc`.`naval_silver`.`sales_cleaned`;

# COMMAND ----------

spark.sql("delete from `jpmc`.`naval_silver`.`sales_cleaned` where order_id='30'")

# COMMAND ----------

# MAGIC %sql
# MAGIC
# MAGIC select * from jpmc.naval_gold.agg_heartrate;
