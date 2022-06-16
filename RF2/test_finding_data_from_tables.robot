*** Settings ***
Documentation    Второе домашнее задание по занятию Robot Framework 2!
Force Tags       request    table
Test Setup       finding_data_from_tables.Test Setup
Test Teardown    finding_data_from_tables.Test Teardown
Resource         ../resources/finding_data_from_tables.robot


*** Test Cases ***
Check finding data from tables
    [Documentation]           Поиск данных из таблицы categories и inventory с последующей проверкой
    [Tags]                    get
    ${resp_1}    ${resp_2}    Search Data from Categories и Inventory    ${table_1}    ${params_1}    ${table_2}    ${params_2}
    Check Status Codes from Categories и Inventory    ${resp_1}    ${expected_result_1}    ${resp_2}    ${expected_result_2}

Check data changes in a table
    [Documentation]           Проверка добавленных данных в таблице Categories через API путём сверки с DataBase
    [Tags]                    post
    ${category}    ${name}    Post Category and Category Name From PostRest    ${table_db}    ${body}    ${header}
    @{result}    Get Category and Category Name From DB
    Compare results    ${result}    ${name}    ${category}