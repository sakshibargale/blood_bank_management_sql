# blood_bank_management_sql
# Blood Bank & Donor Management System

## 📌 Project Overview

The Blood Bank & Donor Management System is a SQL-based database project developed using MySQL.

The main purpose of this project is to manage blood donors, blood banks, hospitals, blood requests, and blood donations efficiently.

This project demonstrates how SQL can be used to store, manage, and analyze real-world blood bank data.

---

## 🎯 Objectives

- Manage blood donor information
- Store blood bank details
- Track blood donations
- Manage hospital blood requests
- Find donors based on blood group
- Analyze blood availability and demand
- Generate useful reports using SQL queries

---

## 🛠️ Technologies Used

- MySQL
- SQL
- MySQL Workbench

---

## 🗃️ Database Tables

The project contains the following main tables:

1. Donors
2. Blood_Banks
3. Blood_Requests
4. Donations
5. Hospitals

---

## 🔑 SQL Concepts Used

- CREATE DATABASE
- CREATE TABLE
- INSERT
- UPDATE
- DELETE
- Primary Key
- Foreign Key
- Constraints
- JOIN
- GROUP BY
- HAVING
- COUNT()
- SUM()
- AVG()
- MAX()
- Subqueries
- Views

---

## 📊 Sample Analysis

The project can answer questions such as:

- How many donors are available for each blood group?
- Which city has the most donors?
- Which hospitals have requested blood?
- Which blood group has the highest demand?
- How many units has each donor donated?
- Which donors are above the average age?
- Which donor has the maximum age?
- Which blood requests are still pending?

---

## 🔍 Example SQL Query

```sql
SELECT
    blood_group,
    COUNT(*) AS Total_Donors
FROM Donors
GROUP BY blood_group;
