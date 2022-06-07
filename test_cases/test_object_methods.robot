*** Settings ***
Documentation    Первая часть домашнего задания по Robot Framework #1
Force Tags    python_function
Library    SeleniumLibrary
Variables    ../resources/variables.py


*** Test Cases ***
Test search for the maximum and minimum value of a row
    [Documentation]    Тест на поиск минимального и максимального значения
    [Tags]    max    min
    ${row_max} =    Evaluate    max(@{ROW})
    ${row_min} =    Evaluate    min(@{ROW})
    Log    Maximum value of a row is "${row_max}" and minimum value of a row is "${row_min}".


Test for displaying unique values of a row
    [Documentation]    Тест по выводу только уникальных значений ряда
    [Tags]    set
    ${unique_values} =    Evaluate    list(set(@{ROW}))
    Log    Unique value(s) of a row: ${unique_values}.


Test for search the sum of all values
    [Documentation]    Тест по поиску суммы всех значений
    [Tags]    sum
    ${row_int} =    Evaluate    list(map(int, @{ROW}))
    ${row_sum} =    Evaluate    sum(@{row_int})
    Log    Sum of all values is "${row_sum}".

