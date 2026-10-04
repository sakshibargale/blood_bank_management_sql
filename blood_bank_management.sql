CREATE DATABASE blood_bank;
USE blood_bank;

-- 1. Donors Table
CREATE TABLE Donors (
    donor_id INT PRIMARY KEY,
    donor_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10),
    age INT,
    blood_group VARCHAR(5) NOT NULL,
    city VARCHAR(50),
    phone VARCHAR(15) UNIQUE
);

-- 2. Blood Banks Table
CREATE TABLE Blood_Banks (
    bank_id INT PRIMARY KEY,
    bank_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    contact VARCHAR(15)
);

-- 3. Hospitals Table
CREATE TABLE Hospitals (
    hospital_id INT PRIMARY KEY,
    hospital_name VARCHAR(100) NOT NULL,
    city VARCHAR(50),
    contact VARCHAR(15)
);

-- 4. Donations Table
CREATE TABLE Donations (
    donation_id INT PRIMARY KEY,
    donor_id INT,
    bank_id INT,
    donation_date DATE,
    units INT,
    FOREIGN KEY (donor_id) REFERENCES Donors(donor_id),
    FOREIGN KEY (bank_id) REFERENCES Blood_Banks(bank_id)
);

-- 5. Blood Requests Table
CREATE TABLE Blood_Requests (
    request_id INT PRIMARY KEY,
    hospital_id INT,
    blood_group VARCHAR(5),
    units_required INT,
    request_date DATE,
    status VARCHAR(20),
    FOREIGN KEY (hospital_id) REFERENCES Hospitals(hospital_id)
);

-- DONOR DATA
INSERT INTO Donors
VALUES
(1, 'Sakshi', 'Female', 21, 'O+', 'Kolhapur', '9876543210'),
(2, 'Rahul', 'Male', 24, 'A+', 'Pune', '9876543211'),
(3, 'Sneha', 'Female', 22, 'B+', 'Kolhapur', '9876543212'),
(4, 'Amit', 'Male', 25, 'O-', 'Sangli', '9876543213'),
(5, 'Priya', 'Female', 23, 'AB+', 'Satara', '9876543214'),
(6, 'Rohan', 'Male', 26, 'A-', 'Pune', '9876543215'),
(7, 'Neha', 'Female', 20, 'B+', 'Sangli', '9876543216'),
(8, 'Akash', 'Male', 27, 'O+', 'Kolhapur', '9876543217'),
(9, 'Pooja', 'Female', 24, 'AB-', 'Satara', '9876543218'),
(10, 'Vikas', 'Male', 28, 'A+', 'Pune', '9876543219');

-- BLOOD BANK DATA
INSERT INTO Blood_Banks
VALUES
(101, 'City Blood Bank', 'Kolhapur', '9123456780'),
(102, 'LifeCare Blood Bank', 'Pune', '9123456781'),
(103, 'Sahyadri Blood Bank', 'Sangli', '9123456782'),
(104, 'Jeevan Blood Bank', 'Satara', '9123456783');

-- HOSPITAL DATA
INSERT INTO Hospitals
VALUES
(201, 'DYP Hospital', 'Kolhapur', '9000000001'),
(202, 'City Hospital', 'Pune', '9000000002'),
(203, 'Sahyadri Hospital', 'Sangli', '9000000003'),
(204, 'LifeCare Hospital', 'Satara', '9000000004');

-- DONATION DATA
INSERT INTO Donations
VALUES
(301, 1, 101, '2026-01-10', 1),
(302, 2, 102, '2026-01-15', 1),
(303, 3, 101, '2026-02-05', 1),
(304, 4, 103, '2026-02-12', 2),
(305, 5, 104, '2026-02-20', 1),
(306, 6, 102, '2026-03-01', 1),
(307, 7, 103, '2026-03-10', 1),
(308, 8, 101, '2026-03-15', 2),
(309, 9, 104, '2026-03-20', 1),
(310, 10, 102, '2026-04-01', 1);

-- BLOOD REQUEST DATA
INSERT INTO Blood_Requests
VALUES
(401, 201, 'O+', 3, '2026-04-05', 'Completed'),
(402, 202, 'A+', 2, '2026-04-07', 'Pending'),
(403, 203, 'B+', 4, '2026-04-10', 'Completed'),
(404, 204, 'O-', 2, '2026-04-12', 'Pending'),
(405, 201, 'AB+', 1, '2026-04-15', 'Completed'),
(406, 202, 'A-', 3, '2026-04-18', 'Pending');

-- BASIC QUERIES

SELECT * FROM Donors;

SELECT * FROM Blood_Banks;

SELECT * FROM Hospitals;

SELECT * FROM Donations;

SELECT * FROM Blood_Requests;

-- WHERE

SELECT *
FROM Donors
WHERE blood_group = 'O+';

-- ORDER BY

SELECT *
FROM Donors
ORDER BY age DESC;

-- COUNT

SELECT COUNT(*) AS Total_Donors
FROM Donors;

-- GROUP BY

SELECT blood_group, COUNT(*) AS Total_Donors
FROM Donors
GROUP BY blood_group;

-- CITY-WISE DONORS

SELECT city, COUNT(*) AS Total_Donors
FROM Donors
GROUP BY city;

-- AVERAGE AGE

SELECT AVG(age) AS Average_Age
FROM Donors;

-- MINIMUM AGE

SELECT MIN(age) AS Minimum_Age
FROM Donors;

-- MAXIMUM AGE

SELECT MAX(age) AS Maximum_Age
FROM Donors;

-- TOTAL BLOOD UNITS

SELECT SUM(units) AS Total_Units
FROM Donations;

-- JOIN DONORS AND DONATIONS

SELECT
    Donors.donor_name,
    Donors.blood_group,
    Donations.donation_date,
    Donations.units
FROM Donors
JOIN Donations
ON Donors.donor_id = Donations.donor_id;

-- JOIN HOSPITALS AND BLOOD REQUESTS

SELECT
    Hospitals.hospital_name,
    Blood_Requests.blood_group,
    Blood_Requests.units_required,
    Blood_Requests.status
FROM Hospitals
JOIN Blood_Requests
ON Hospitals.hospital_id = Blood_Requests.hospital_id;

-- HAVING

SELECT blood_group, COUNT(*) AS Total_Donors
FROM Donors
GROUP BY blood_group
HAVING COUNT(*) > 1;

-- PENDING REQUESTS

SELECT *
FROM Blood_Requests
WHERE status = 'Pending';

-- VIEW

CREATE VIEW O_Positive_Donors AS
SELECT donor_id, donor_name, city, phone
FROM Donors
WHERE blood_group = 'O+';

SELECT * FROM O_Positive_Donors;

SELECT
    d.donor_name,
    d.blood_group,
    dn.donation_date,
    dn.units
FROM Donors d
JOIN Donations dn
ON d.donor_id = dn.donor_id;

SELECT
    h.hospital_name,
    h.city,
    br.blood_group,
    br.units_required,
    br.status
FROM Hospitals h
JOIN Blood_Requests br
ON h.hospital_id = br.hospital_id;

SELECT
    b.bank_name,
    b.city,
    d.donation_date,
    d.units
FROM Blood_Banks b
JOIN Donations d
ON b.bank_id = d.bank_id;
SELECT
    b.bank_name,
    b.city,
    d.donation_date,
    d.units
FROM Blood_Banks b
JOIN Donations d
ON b.bank_id = d.bank_id;

SELECT
    d.donor_name,
    SUM(dn.units) AS Total_Units
FROM Donors d
JOIN Donations dn
ON d.donor_id = dn.donor_id
GROUP BY d.donor_id, d.donor_name;

SELECT donor_name, age, blood_group
FROM Donors
WHERE age > (
    SELECT AVG(age)
    FROM Donors
);

SELECT donor_name, age, blood_group
FROM Donors
WHERE age = (
    SELECT MAX(age)
    FROM Donors
);