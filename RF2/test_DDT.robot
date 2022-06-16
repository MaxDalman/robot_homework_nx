*** Settings ***
Documentation    DDT по отработке функции поиска при передаче несуществующих данных в DB
Force Tags       DDT
Test Setup       finding_data_from_tables.Test Setup
Test Teardown    finding_data_from_tables.Test Teardown
Resource         ../resources/finding_data_from_tables.robot
Test Template    Get And Check Response


*** Test Cases ***
Check Search One Table 200    categories    select=category,categoryname*    200
Check Search One Table 404    categorie     select=category,categoryname*    404    does not exist
Check Search One Table 400    categories    select=category,categoryname+    400    does not exist
