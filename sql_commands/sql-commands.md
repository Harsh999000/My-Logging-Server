SQL Login

- If MySql is installed on root system:
	* mysql -u root -p
- If MySql is installed in specific location:
	* Login from any directory: /location/mysql -u root -p
	* Move to directory where my sql is present: ./mysql -u root -p
- If a personal configuration is setup for mysql server:
	* Login from any directory: /location/mysql --defaults-file=/location/personal.cnf -u root -p
	* Move to directory where mysql is present: ./mysql --defaults-file=/location/personal.cnf -u root -p

Explanation: 

- If location of mysql is in environment path under normal installation you can login from anywhere
- If mysql is not installed for root but is present in specific location, you can either move to the location or specify the path for login
- If you move to location we add './' to mention start from current directory
- -u specify the user with which you want to login
- -p specify login via password
- --defaults-file tells mysql to read the custom config from personal.cnf, personal.cnf is the custom configuration file, you can specify ports, sockets etc where the mysql will run and other various configs

---------------------------------------------------------------------------------
 
Check User

- select user from mysql.user; - This will show the list of all the users

Explanation:

- Select is used to select the column I want to check in this case it user
- from i used to select the table from which I want get this column it is mysql.user in this case

- mysql.user is a table which has various information with regards to user such as:
	* host - on which host the user can connect
	* password - This stores password but will be empty as it is no longer in use after MariaDB 10.4 +
	* authentication_string - this stores the pass now after Mariadb 10.4, it stores passowrd in hash format
	* Privileges - There are columns to store privilages like can create, can delete, can insert etc.


---------------------------------------------------------------------------------

Create User

- Method 1: create user user_name;

Explanation:

- 'create' is used to specify creation
- 'user' is used to specify the creation is of user
- 'user_name' is the username for the user 
- There is no password for user and the host will be the user creating this, if you are root it will be %

- Method 2: create user 'user_name'@'host' identified by 'password@123';

Explanation:

- In 'user_name'@'host', here host specifies the where the user can connect from
- 'identified by' is the password which will be stored in authentication_string column in mysql.user table
 
----------------------------------------------------------------------------------

Grant Privileges to User

- Grant all privileges: grant all privileges on `*.*` to 'username'@'host' with grant option;

Explanation:

- 'grant' is used to give permission to user
- 'all privileges' to give every privilege like select, insert, update, delete, create etc.
- 'on' specifies on what do we want to apply these privileges like database or tables
- `*.*` means all databases first and then all tables
- 'username'@'host' specify the username to whom we are granting access, and host means where they can connect from
- 'with grant option' allows the user to pass on their privileges to other users
- Instead of 'all' you can specify what privileges you want to give like select, create, delete, update etc.
- We can not specify what privileges user can pass on by default 'with grant option' gives access to pass on all the privileges the user has

-----------------------------------------------------------------------------------

Delete User

- Method 1: drop USER 'username'@'host';

Explanation:

- drop means delete
- user means we want to delete user
- 'username' is the username of the user we want to delete
- @'host' means this user connects from host
- This basically translates to delete the user which has username as 'username' and connects from host
- This can produce an error if the user does not exist

Method 2: drop user if exists 'username'@'host';

- This delete the user if the user exists

------------------------------------------------------------------------------------

