*** Settings ***
Documentation    Ресурсник сьюта по проверке REST запросов.
Library          RequestsLibrary                WITH NAME    Req
Library          Collections                    WITH NAME    Col
Library          get_categories.Categories      WITH NAME    gCat
Library          post_categories.Categories     WITH NAME    pCat
Library          JsonValidator                  WITH NAME    Js
Variables        variables_connect.py


*** Keywords ***
Search Data from Categories и Inventory
    [Documentation]    Поиск по таблицам Categories и Inventory через REST запрос.
    [Arguments]        ${table_1}    ${params_1}    ${table_2}    ${params_2}
    ${resp_1}    gCat.Get Data From Rest    alias    /${table_1}?    params=${params_1}    expected_status=200
    ${resp_2}    gCat.Get Data From Rest    alias    /${table_2}?    params=${params_2}    expected_status=200


Post Category and Category Name From PostgRest
    [Documentation]    Добавления данных в таблицу Categories через REST запрос.
    [Arguments]        ${table_db}    ${body}    ${headers}
    ${resp}     pCat.Post Data Categories    alias    ${body}    ${headers}    201
    ${category}    ${name}    gCat.Get Data Categories From Rest    alias    ${params_1}    200
    [Return]    ${category}    ${name}

Get Category and Category Name From DB
    [Documentation]    Поиск по таблице Categories через SQL-запрос.
    ${result}    gCat.Get Category By Name And Category
    [Return]    @{result}

Compare results
    [Documentation]    Сравнение результата PostRest запроса с SQL-запросом.
    [Arguments]        ${result_from_db}    ${name}    ${category}
    ${category_db}    ${name_db}    gCat.Get Categories And Names    ${result_from_db}
    Col.Lists Should Be Equal      ${category}    ${category_db}
    Col.Lists Should Be Equal      ${name}        ${name_db}