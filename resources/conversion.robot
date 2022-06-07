*** Settings ***
Library    SeleniumLibrary
Variables    ../resources/variables.py


*** Keywords ***
Conversion from Celsius to Fahrenheit
    [Arguments]    ${celsius}
    ${conversion_fahrenheit} =    Evaluate    9/5 * ${celsius} + 32
    Set Test Variable    ${celsius}
    Set Test Variable    ${conversion_fahrenheit}
    [Teardown]    Log    Вычисление завершено!