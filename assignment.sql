-- create database
CREATE DATABASE myClinic;

USE myClinic;

-- Patient Table
CREATE TABLE Patient (
    patient_id INT PRIMARY KEY,
    patientName VARCHAR(100) NOT NULL,
    DOB DATE NOT NULL,
    gender VARCHAR(10),
    contact VARCHAR(255)
);

-- Medication Table
CREATE TABLE Medication (
    medication_id INT PRIMARY KEY,
    medicineName VARCHAR(100) NOT NULL UNIQUE,
    description TEXT
);

-- Department Table
CREATE TABLE Department (
    department_id INT PRIMARY KEY,
    deptName VARCHAR(100) NOT NULL UNIQUE
);

-- Doctor Table
CREATE TABLE Doctor (
    doctor_id INT PRIMARY KEY,
    doctorName VARCHAR(100) NOT NULL,
    specialization VARCHAR(100),
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);


-- Appointment Table
CREATE TABLE Appointment (
    appointment_id INT PRIMARY KEY,
    patient_id INT ,
    doctor_id INT ,
    appointment_date DATE ,
	reviews TEXT,
    FOREIGN KEY (patient_id) REFERENCES Patient(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES Doctor(doctor_id)
);

-- Treatment Table
CREATE TABLE Treatment (
    treatment_id INT PRIMARY KEY,
    appointment_id INT ,
    treatment_description TEXT NOT NULL,
    cost DECIMAL(10,2),
    FOREIGN KEY (appointment_id) REFERENCES Appointment(appointment_id)
);


-- Prescription_Medication table
CREATE TABLE Prescription_Medication (
    prescription_id INT PRIMARY KEY,
    medication_id INT,
    dosage VARCHAR(50),
    duration VARCHAR(50),
    FOREIGN KEY (medication_id) REFERENCES Medication(medication_id)
);