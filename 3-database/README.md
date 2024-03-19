# Prerequisites

Docker installed on your machine.
SQL and Docker.

## Running a MySQL Container

Create and run a MySQL container named mysql-company:

```bash
docker run --name mysql-company -e MYSQL_ROOT_PASSWORD=yourpassword -e MYSQL_DATABASE=company -d -p 3306:3306 mysql:latest
```

Replace yourpassword with a strong password of your choice.

## Importing the Database Schema and Data

Copy the company.sql file to the running container:

```bash
docker cp company.sql mysql-company:/company.sql
```

## Import the company.sql file into the company database:

```bash
docker exec -i mysql-company mysql -uroot -pyourpassword company < company.sql
```

## Accessing the MySQL Shell

Access the MySQL command line interface as the root user:

```bash
docker exec -it mysql-company mysql -uroot -pyourpassword
```

# Querying the Database

Once inside the MySQL shell, select the company database:

```sql

USE company;
Execute the query to find the average salary for each department:


SELECT d.department_name, AVG(e.salary) AS average_salary
FROM employees e
JOIN departments d ON e.department = d.department_id
GROUP BY e.department;
Bonus: Data Persistence
To ensure data persistence across container restarts, mount a volume when running the MySQL container:

```

# bonus

```bash
docker run --name mysql-company -v /path/to/local/directory:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=yourpassword -e MYSQL_DATABASE=company -d -p 3306:3306 mysql:latest
Replace /path/to/local/directory with the path to a directory on your host machine.
```

# Issue I've encounter and fix

```bash
ERROR 1366 (HY000) at line 12: Incorrect integer value: 'Consulting' for column 'department' at row 41
```

# fix

I locate the entry for user Murphy in data source, change the 'department' value from 'Consulting' to the correct integer ID (7 for Consulting), and then re-import the database with the corrected data.
