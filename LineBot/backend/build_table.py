import psycopg2
import pandas as pd
from sqlalchemy import create_engine

# 此py檔案是本地做資料庫連線、建table、存爬蟲資料進table用的
# 僅供本地用，放上來給大家參考，主程式並沒有用到


# Postgres DB 連線
# 依照render上的參數輸入
conn = psycopg2.connect(
    dbname='',
    user='',
    password='',
    host='dpg--a.singapore-postgres.render.com',
    port='5432'
)

cursor = conn.cursor()

# Create table (if it doesn't exist)
create_table_query = '''
CREATE TABLE IF NOT EXISTS tb_kktix (
    id SERIAL PRIMARY KEY,
    EventName VARCHAR(255) NOT NULL,
    EventTime VARCHAR(255),
    Venue VARCHAR(255),
    Address VARCHAR(255),
    Artists VARCHAR(255),
    ImageURL VARCHAR(1000),
    PageURL VARCHAR(1000),
    StartTime TIMESTAMP,
    EndTime TIMESTAMP
);
'''
cursor.execute(create_table_query)
conn.commit()

# 利用SQLAlchemy將爬蟲資料放入Postgres DB (因Postgres非內建資料庫，需要SQLAlchemy去方便管理及簡化code)

# PostgreSQL connection details
DATABASE_TYPE = 'postgresql'
DBAPI = 'psycopg2'
ENDPOINT = 'dpg--a.singapore-postgres.render.com'
USER = ''
PASSWORD = ''
PORT = 5432
DATABASE = ''

# Create SQLAlchemy engine
engine = create_engine(f'{DATABASE_TYPE}+{DBAPI}://{USER}:{PASSWORD}@{ENDPOINT}:{PORT}/{DATABASE}')

# Insert the data into the PostgreSQL table
# 此假設df已經儲存爬蟲爬下來並且用pandas整理過的dataframe
df.to_sql('tb_kktix', engine, if_exists='replace', index=False)


print("Data inserted successfully.")

conn.close()