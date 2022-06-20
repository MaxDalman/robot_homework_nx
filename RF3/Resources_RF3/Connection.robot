*** Settings ***
Documentation    Создание сессий и подключения к внешним системам.
Library          RequestsLibrary            WITH NAME    Req
Library          PostgreSQLDB               WITH NAME    DB
Variables        variables_connect.py


*** Keywords ***
Test Setup
    [Documentation]             Создание сессии PostgRest и подключение к PostgreSQL.
    Req.Create session          alias    ${proxy_URI}
    DB.Connect To Postgresql    ${db}    ${db_user}    ${db_password}    ${server}    ${db_port}


Test Teardown
    [Documentation]             Завершение сессии PostgRest и отключение от PostgreSQL.
    Req.Delete All Sessions
    DB.Disconnect From Postgresql