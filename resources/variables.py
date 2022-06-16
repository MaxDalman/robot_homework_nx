### Переменные для использования в test_cases, RF2

# Initial data for the first task
ROW = [1, 2, 3, 5, 1, 0, -1, 10]

#Users
proxy_URI = 'http://localhost:3000'

# DataBase
db = 'postgres'
db_user = 'app_user'
db_password = 'password'
db_port = 5432
server = 'localhost'


# Tables Data for second Homework
# For GET request
table_1 = 'categories'
params_1 = 'select=category,categoryname'
expected_result_1 = '200'

table_2 = 'inventory'
params_2 = 'select=sales,quan_in_stock'
expected_result_2 = '200'

# For POST request
table_db = 'categories'
body = {"category": 17 , "categoryname": "Serial"}
header = {"Content-Type": "application/json"}