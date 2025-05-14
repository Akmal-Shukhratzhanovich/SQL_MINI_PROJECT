
# 🎓 Mini Project: University Database

This project contains a complete SQL script for creating and populating a **relational database** representing a simplified university system. It is designed for **educational purposes** — to help students and beginners learn how to design databases, write SQL queries, and understand data relationships in a realistic academic context.

## 📌 Project Overview

The script includes:

* Creation of a university database schema
* Definition of multiple related tables
* Insertion of sample data into each table
* Sample SQL queries for data retrieval and manipulation

### 📂 Key Database Tables

| Table Name   | Description                                                 |
| ------------ | ----------------------------------------------------------- |
| `STUDENT`    | Contains student details (ID, name, department, year, etc.) |
| `COURSE`     | Information about courses (course ID, title, credits)       |
| `INSTRUCTOR` | Faculty member details (ID, name, title, department)        |
| `SECTION`    | Course section data (semester, year, room, instructor)      |
| `ENROLLS`    | Tracks student enrollments in course sections               |

## 🧱 Script Contents

The SQL script (`MINI_PROJECT_2.sql`) includes:

1. **DDL (Data Definition Language)** statements to create tables with primary and foreign keys
2. **DML (Data Manipulation Language)** statements to insert realistic sample data
3. **Queries** to demonstrate how to retrieve and combine information using `SELECT`, `JOIN`, `WHERE`, etc.

## ✅ Example Queries

* List all students with their enrolled courses and instructors
* Filter students by major or department
* Show courses and which instructors teach them
* Find all students enrolled in a specific course or semester

## 🚀 How to Use

1. Clone this repository or download the `MINI_PROJECT_2.sql` file
2. Open it in any SQL-compatible environment (e.g., MySQL Workbench, DBeaver, DataGrip)
3. Execute the script step-by-step or all at once
4. Explore and customize queries as needed for your learning

## 🎯 Use Cases

* Academic exercises and lab assignments for database courses
* SQL practice for beginners and intermediate learners
* Portfolio building for students interested in backend or data roles
* Teaching aid for database design and querying

## 🛠️ Technologies Used

* SQL (Structured Query Language)
* Tested with MySQL, but adaptable to other RDBMS with minor changes

