*** Settings ***
Documentation    Сьют позитивных тестов для проверки работы REST запросов методами GET и POST.
Metadata         Автор    Дауберт Максим
Force Tags       request
Test Timeout     2s
Suite Setup       Connection.Test Setup
Suite Teardown    Connection.Test Teardown
Resource         ../Resources_RF3/GET_POST_Requests.robot
Resource         ../Resources_RF3/Connection.robot


*** Test Cases ***
Check finding data from tables
    [Documentation]           Проверка корректности поиска данных из таблицы categories и inventory.
    [Tags]                    search    get
    Search Data from Categories и Inventory    ${table_1}    ${params_1}    ${table_2}    ${params_2}

Check data changes in a table
    [Documentation]           Проверка добавленных данных в таблицу Categories через REST запрос путём сверки с DB.
    [Tags]                    add data    post
    ${category}    ${name}    Post Category and Category Name From PostgRest    ${table_db}    ${body}    ${headers}
    @{result}                 Get Category and Category Name From DB
    Compare results    ${result}    ${name}    ${category}