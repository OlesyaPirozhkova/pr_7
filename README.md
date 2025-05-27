# pr_7
# Цель практической работы:
Научиться импортировать и экспортировать данные в базу данных SQL. Работа включает в себя загрузку данных из внешних источников в таблицы базы данных, а также экспорт данных из базы данных в различные форматы. Научиться работать с внешними данными, преобразовывать их в нужный формат и интегрировать с существующими таблицами в базе данных.
# Ход работы:


1. Установить соединение с PostgreSQL и подключена база данных «medical_db» и таблицы.



![2025-05-27_23-27-35](https://github.com/user-attachments/assets/fc2b7e51-4e7e-47c6-aa17-3eff42b1caab)



![image](https://github.com/user-attachments/assets/5990162c-cd9d-4096-b12d-c71266773706)





Добавляем таблицы DOCTOR_ID, PATIENT_ID и Doctor_Patient 

![image](https://github.com/user-attachments/assets/03a3d636-3c99-4cfe-acd7-ad84997b0a67)



![image](https://github.com/user-attachments/assets/1dd4cc7f-7536-45eb-accf-e367bf40a798)

Добавляем данные в таблицы 

![image](https://github.com/user-attachments/assets/22d597e8-4085-440f-b14b-146abfd13ef6)


create_db_and_tables.sql — SQL скрипт для создания базы данных и таблиц, файл находится в репозитории.

2. Создадим er-диаграмму


![image](https://github.com/user-attachments/assets/ab381641-dff5-4423-aa1c-d23171cd1b44)
erd_diagram.png - находится в репозитории 


Экспорт данных из базы данных SQL в файлы, чтобы получить информацию опациентах возрастом > 10.

![image](https://github.com/user-attachments/assets/bbb343ec-a9e1-45fb-a68a-425d2df19c45)

patient10.csv - файл CSV можно найти в репозитории.


Вариант №18

1. Создаем нужные таюблицы, заполняем их данными 
![image](https://github.com/user-attachments/assets/8d26bb49-82ce-4b69-84d4-8bdad3e9fb20)

2. Добавить 5 записей для отображения врачей и их пациентов.
![image](https://github.com/user-attachments/assets/a0803679-76b7-44ac-9542-e78cc7a48d3e)


3. Запрос для получения пациентов врача с ID=101.

![image](https://github.com/user-attachments/assets/fe856c4c-a8fa-46bc-bd47-78ef5fdf27af)

4. Выполните запрос для получения всех больниц с количеством мест > 1000.

   ![image](https://github.com/user-attachments/assets/58a52344-e879-4eb8-963f-01cbb9acd6f8)

5. Построить столбчатую диаграмму для анализа зарплат врачей по специализациям.

   
![image](https://github.com/user-attachments/assets/eebaf9f5-a79b-42b8-8c2e-0d4cc8a48a3a)



