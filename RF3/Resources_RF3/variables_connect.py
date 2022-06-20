#Users
proxy_URI = 'http://localhost:3000'

# DataBase connect
db = 'postgres'
db_user = 'app_user'
db_password = 'password'
db_port = 5432
server = 'localhost'


# Tables Data for second Homework
# For GET request
table_1 = 'categories'
params_1 = 'select=category,categoryname'

table_2 = 'inventory'
params_2 = 'select=sales,quan_in_stock'

# For POST request
table_db = 'categories'
body = {"category": 17 , "categoryname": "Serial"}
headers = {"Content-Type": "application/json"}