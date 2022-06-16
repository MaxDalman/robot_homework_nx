*** Settings ***
Documentation    Ресурсник для тест-сьютов
Library          RequestsLibrary    WITH NAME    Req
Library          PostgreSQLDB       WITH NAME    DB
Library          JsonValidator      WITH NAME    JS
Library          Collections        WITH NAME    Col
Variables        ../resources/variables.py

*** Variables ***
${SQL}                               SELECT category, categoryname
...                                  from bootcamp.categories

*** Keywords ***
Test Setup
    Req.Create session          alias    ${proxy_URI}
    DB.Connect To Postgresql    ${db}    ${db_user}    ${db_password}    ${server}    ${db_port}

Test Teardown
    Req.Delete All Sessions
    DB.Disconnect From Postgresql


Search Data from Categories и Inventory
    [Arguments]    ${table_1}    ${params_1}    ${table_2}    ${params_2}
    ${resp_1}    Req.GET On Session    alias    /${table_1}?    params=${params_1}
    ${resp_2}    Req.GET On Session    alias    /${table_2}?    params=${params_2}
    [Return]    ${resp_1}    ${resp_2}

Check Status Codes from Categories и Inventory
    [Arguments]    ${resp_1}    ${expected_result_1}    ${resp_2}    ${expected_result_2}
    ${status_code_1}=    Convert To String    ${resp_1.status_code}
    ${status_code_2}=    Convert To String    ${resp_2.status_code}
    Should Be Equal    ${status_code_1}    ${expected_result_1}
    Should Be Equal    ${status_code_2}    ${expected_result_2}


Post Category and Category Name From PostRest
    [Arguments]    ${table_db}    ${body}    ${header}
    ${resp}       Req.POST On Session    alias    /${table_db}    json=${body}    headers=${header}
    ${resp_cat}    Req.GET On Session    alias    /${table_db}    params=${params_1}
    ${category}    Js.get elements   ${resp_cat.json()}    $..category
    ${name}        Js.get elements   ${resp_cat.json()}    $..categoryname
    [Return]    ${category}    ${name}

Get Category and Category Name From DB
    @{result}      DB.Execute Sql String Mapped        ${SQL}
    [Return]    @{result}

Compare results
    [Arguments]    ${result_from_db}    ${name}    ${category}
    ${category_db}    Create List
    ${name_db}        Create List
    FOR   ${k}  IN  @{result_from_db}
        ${k2}   convert to number     ${k}[category]
        Col.Append To List     ${name_db}       ${k}[categoryname]
        Col.Append To List     ${category_db}           ${k2}
    END
    Col.Lists Should Be Equal      ${category}    ${category_db}
    Col.Lists Should Be Equal      ${name}        ${name_db}


Get And Check Response
    [Arguments]     ${table}     ${params}     ${expected result}     ${message}=‘’
    ${response}      Req.GET On Session     alias    /${table}?   params=${params}     expected_status=${expected result}

    run keyword if      ${expected result} != 200
    ...       should contain   ${response.json()}[message]      ${message}
