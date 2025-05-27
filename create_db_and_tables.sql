!pip install ipython-sql

-- Создаем бд
import psycopg2
from psycopg2 import sql
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

server_params = {
    "host": "localhost",
    "user": "postgres",
    "password": "1234", 
    "port": "5432" 
}

try:
  
    conn = psycopg2.connect(**server_params)
    conn.set_isolation_level(ISOLATION_LEVEL_AUTOCOMMIT)  
    
    with conn.cursor() as cur:
        
        cur.execute("SELECT 1 FROM pg_database WHERE datname='medical__db'")
        exists = cur.fetchone()
        
        if not exists:
          
            cur.execute(sql.SQL("CREATE DATABASE medical__db"))
            print("База данных medical__db успешно создана")
        else:
            print("База данных medical__db уже существует")
            
except psycopg2.Error as e:
    print(f"Ошибка при создании базы данных: {e}")
finally:
    if conn:
        conn.close()
        
-- Создаем таблицы 
%%sql

-- Создание таблицы докторов
CREATE TABLE IF NOT EXISTS DOCTOR (
    DOCTOR_ID SERIAL PRIMARY KEY,
    LAST_NAME VARCHAR(50) NOT NULL,
    POSITION VARCHAR(50) NOT NULL,
    EXPERIENCE_YEARS INTEGER NOT NULL CHECK (EXPERIENCE_YEARS >= 0)
);

-- Создание таблицы пациентов
CREATE TABLE IF NOT EXISTS PATIENT (
    PATIENT_ID SERIAL PRIMARY KEY,
    LAST_NAME VARCHAR(50) NOT NULL,
    DIAGNOSIS VARCHAR(100),
    AGE INTEGER NOT NULL CHECK (AGE > 0 AND AGE < 120)
);


CREATE TABLE IF NOT EXISTS Doctor_Patient (
    DOCTOR_ID INTEGER PRIMARY KEY,
    PATIENT_ID INTEGER UNIQUE NOT NULL,
    FOREIGN KEY (DOCTOR_ID) REFERENCES DOCTOR(DOCTOR_ID) ON DELETE CASCADE,
    FOREIGN KEY (PATIENT_ID) REFERENCES PATIENT(PATIENT_ID) ON DELETE CASCADE
);

--Заполняем таблицы
%%sql
-- Добавление врачей
INSERT INTO DOCTOR (LAST_NAME, POSITION, EXPERIENCE_YEARS) VALUES
    ('Иванов', 'Хирург', 10),
    ('Петрова', 'Терапевт', 5),
    ('Сидоров', 'Кардиолог', 15),
    ('Кузнецова', 'Невролог', 8);

-- Добавление пациентов
INSERT INTO PATIENT (LAST_NAME, DIAGNOSIS, AGE) VALUES
    ('Смирнов', 'Гастрит', 35),
    ('Васильев', 'Гипертония', 42),
    ('Николаева', 'Мигрень', 28),
    ('Федоров', 'Аппендицит', 19);

-- Соединение 
INSERT INTO Doctor_Patient (DOCTOR_ID, PATIENT_ID) VALUES
    (1, 4),  -- Иванов лечит Федорова
    (2, 1),  -- Петрова лечит Смирнова
    (3, 2),  -- Сидоров лечит Васильева
    (4, 3);  -- Кузнецова лечит Николаеву
        
