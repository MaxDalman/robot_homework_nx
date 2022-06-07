*** Settings ***
Documentation    Вторая часть домашнего задания по Robot Framework #1
Force Tags    Formula
Library    SeleniumLibrary
Library    OperatingSystem
Library    Collections
Resource    ../resources/conversion.robot


*** Test Cases ***
Checking the conversion formula from Celsius to Fahrenheit
    [Documentation]    Проверка перевода градусов из Цельсия в Фаренгейт
    [Tags]    Conversion
    Wait Until Keyword Succeeds    6s    1s
...    Conversion from Celsius to Fahrenheit    45
    Should Not Be Empty    ${celsius}    Значение переменной по Цельсию не введено!
    Log    При ${celsius} по Цельсию будет ${conversion_fahrenheit} по Фаренгейту.
