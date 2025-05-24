# Library-Management-System-Using-SQL-Database
Overview:
This project presents a database-driven library management system designed to efficiently track books, materials, authors, members, and borrowing records. The system simplifies routine library operations such as lending, returning, and reporting overdue materials. It also supports advanced features like overdue alerts and automated membership status updates based on borrowing behavior. The database is built using MySQL Workbench.

Requirements

Prerequisites:

1. MySQL Workbench:
   A working installation of MySQL Workbench for executing SQL queries.

2. Environment Configuration:
   - MySQL version: 8.0 or higher recommended
   - Storage engine: InnoDB (default for foreign key support)

3. Dataset:
   All data used in this project is defined and inserted within the SQL file provided:
   `CS504_Project_Code.sql`

Steps to Set Up and Run

1. Launch MySQL Workbench:
   - Open MySQL Workbench and connect to your local or cloud MySQL server.

2. Execute the SQL Script:
   - Open the `CS504_Project_Code.sql` file.
   - Run the script to:
     - Create the database and tables.
     - Insert sample data for genres, materials, authors, members, and staff.
     - Execute queries for library operations and extended features.

3. View Outputs:
   - Execute the final SELECT queries to verify table creation and data insertions.
   - Use the final queries to answer questions like:
     - Available and overdue materials
     - Most borrowed materials
     - Author and genre insights
     - Date-range based borrow analysis

Key Features Implemented

- Material Management: Tracks books, authors, genres, and catalog placement.
- Member and Staff Tables: Maintains detailed records for users and library workers.
- Borrowing System: Supports checkouts, due dates, and return tracking.
- Advanced SQL Queries: Includes JOINs, subqueries, aggregates, and conditionals.
- Extended Features:
   - Alert staff about overdue items
   - Deactivate membership after repeated overdue behavior
   - Reactivate membership upon penalty resolution
