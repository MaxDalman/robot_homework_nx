<p><em>'resources' </em>- источник входных данных и Keywords для 1 и 2 д\з.</p>
<p><em>'test_cases'</em> - расположены тест-сьюты по первому домашнему заданию.</p>
<p>'RF2' - расположены тест-сьюты по второму домашнему заданию.</p>
<p>&nbsp;</p>
<p><strong>Первое Д\З:</strong></p>
<p>В файле <em>test_object_methods.robot</em> расположены кейсы по всем трём заданиям. Исходный ряд импортируется через подсоединённый <em>variables.py</em>.</p>
<p>В файле <em>test_conversion_from_celsius_to_fahrenheit.robot</em> находится кейс по проверке формулы. Тестовые данные берутся из директивы <span style="text-decoration: underline;">Test Cases</span>.</p>
<p>Вычисление происходит в директиве <span style="text-decoration: underline;">Keywords</span> в импортируемом файле <em>conversion.robot</em>.</p>
<p>Дополнительно были добавлены проверки на значение Цельсия, WUKS и <span style="text-decoration: underline;">Teardown</span>.</p>
<p>&nbsp;</p>
<p><strong>Второе Д\З:</strong></p>
<p>В файле <em>'test_finding_data_from_tables.robot'</em> расположны кейсы по всем заданиям. Переменные берутся из <em>variables.py</em> (из папки <em>resources</em>).</p>
<p>В файле <em>'test_DDT.robot'</em> кейсы в стиле <span style="text-decoration: underline;">DDT</span> (задание со звёздочкой).</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>Для удобства прочтения отчётов, были добавлены <span style="text-decoration: underline;">Tags</span> и <span style="text-decoration: underline;">Documentation</span> к каждому кейсу.</p>
<p><em>Данная структура директивы проекта выбрана с расчётом на дальнейшее добавление проверок в проект.</em></p>
