Prerequisites
Docker installed on your machine.
Basic knowledge of SQL and Docker commands.
Setup Instructions

1. Clone the Repository
   Start by cloning this repository to your local machine:

sh

git clone https://github.com/yourusername/your-repository-name.git
cd your-repository-name
Replace yourusername/your-repository-name with the actual path to your GitHub repository.

2. Running a MySQL Container
   Create and run a MySQL container named mysql-company:

sh

docker run --name mysql-company -e MYSQL_ROOT_PASSWORD=yourpassword -e MYSQL_DATABASE=company -d -p 3306:3306 mysql:latest
Replace yourpassword with a strong password of your choice.

3. Importing the Database Schema and Data
   Copy the company.sql file to the running container:

sh

docker cp company.sql mysql-company:/company.sql
Import the company.sql file into the company database:

sh

docker exec -i mysql-company mysql -uroot -pyourpassword company < company.sql 4. Accessing the MySQL Shell
Access the MySQL command line interface as the root user:

sh

docker exec -it mysql-company mysql -uroot -pyourpassword 5. Querying the Database
Once inside the MySQL shell, select the company database:

sql

USE company;
Execute the query to find the average salary for each department:

sql

SELECT d.department_name, AVG(e.salary) AS average_salary
FROM employees e
JOIN departments d ON e.department = d.department_id
GROUP BY e.department;
Bonus: Data Persistence
To ensure data persistence across container restarts, mount a volume when running the MySQL container:

sh

docker run --name mysql-company -v /path/to/local/directory:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=yourpassword -e MYSQL_DATABASE=company -d -p 3306:3306 mysql:latest
Replace /path/to/local/directory with the path to a directory on your host machine.
