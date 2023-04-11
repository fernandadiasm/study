# Mostrar todos os databases
$ sudo docker exec -it namenode bash
root@namenode:/# sqoop list-databases --connect jdbc:mysql://database --username root --password secret
information_schema
employees
hue
mysql
performance_schema
sakila
sys

# Mostrar todas as tabelas do bd employees
root@namenode:/# sqoop list-tables --connect jdbc:mysql://database/employees --username root --password secret
current_dept_emp
departments
dept_emp
dept_emp_latest_date
dept_manager
employees
employees_2
titles

# Inserir os valores ('d010', 'BI') na tabela departments do bd employees
root@namenode:/# sqoop eval --connect jdbc:mysql://database/employees --username root --password secret --query "select * from departments"
----------------------------------
| dept_no | dept_name            | 
----------------------------------
| d009    | Customer Service     | 
| d005    | Development          | 
| d002    | Finance              | 
| d003    | Human Resources      | 
| d001    | Marketing            | 
| d004    | Production           | 
| d006    | Quality Management   | 
| d008    | Research             | 
| d007    | Sales                | 
----------------------------------
root@namenode:/# sqoop eval --connect jdbc:mysql://database/employees --username root --password secret --query "insert into departments values('d010','BI')"

# Pesquisar todos os registros da tabela departments
root@namenode:/# sqoop eval --connect jdbc:mysql://database/employees --username root --password secret --query "select * from departments"
----------------------------------
| dept_no | dept_name            | 
----------------------------------
| d010    | BI                   | 
| d009    | Customer Service     | 
| d005    | Development          | 
| d002    | Finance              | 
| d003    | Human Resources      | 
| d001    | Marketing            | 
| d004    | Production           | 
| d006    | Quality Management   | 
| d008    | Research             | 
| d007    | Sales                | 
----------------------------------

# Criar a tabela benefits(cod int(2)  AUTO_INCREMENT PRIMARY KEY, name varchar(30)) no bd employees
root@namenode:/# sqoop eval --connect jdbc:mysql://database/employees --username root --password secret --query "create table benefits(cod int(2)  AUTO_INCREMENT PRIMARY KEY, name varchar(30))"
root@namenode:/# sqoop eval --connect jdbc:mysql://database/employees --username root --password secret --query "select * from benefits"
-----------------------------
| cod | name                 | 
-----------------------------
|----------------------------|

# Inserir os valores (null,'food vale') na tabela benefits
root@namenode:/# sqoop eval --connect jdbc:mysql://database/employees --username root --password secret --query "insert into benefits values(null,'food vale')"

# Pesquisar todos os registros da tabela benefits
root@namenode:/# sqoop eval --connect jdbc:mysql://database/employees --username root --password secret --query "select * from benefits"
------------------------------
| cod | name                 | 
------------------------------
| 1   | food vale            | 
------------------------------