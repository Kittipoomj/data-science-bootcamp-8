## HW 2 - Create database on Postgresql ⇒ create a few table about pizza restaurants

# [0] load library
library(RSQLite)
library(RPostgreSQL)
library(tidyverse)


# [1] create connect
con <- dbConnect(PostgreSQL(),
                 host = "arjuna.db.elephantsql.com",
                 port = 5432, 
                 user = "geezavjt",
                 password = "Z59TrQAbvLZc9mbzO8sLCG0yYZWO2Bc3",
                 dbname = "geezavjt")


# [2] create data
menu <- data.frame(
  menu_name = c("pizza","pasta","salad","dessert","drink"),
  price = c(10,12,8,6,3)
)

order <- data.frame(
  order_id = 1:5,
  payment_type = c("Cash","Cash","Credit Card","Credit Card","Cash")
)

customer <- data.frame(
  order_id = 1:5,
  customer_name = c("John","Jane","Mike","David","Sarah")
)


# [3] write table
dbWriteTable(con, "menu", menu)
dbWriteTable(con, "order", order)
dbWriteTable(con, "customer", customer)


# [4] check database
dbListTables(con)

dbListFields(con, "menu")
dbListFields(con, "order")
dbListFields(con, "customer")


# [5] query data
dbGetQuery(con, "select * from menu")

dbGetQuery(con, "select * from customer where customer_name ~*'^J'")


# [6] close connection
dbDisconnect(con)


# [7] delete table
dbRemoveTable(con, "menu")
dbRemoveTable(con, "order")
dbRemoveTable(con, "customer")
