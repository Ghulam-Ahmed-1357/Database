CREATE DATABASE Healthcare;
use Healthcare;
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentName VARCHAR(100) NOT NULL,
    HeadOfDepartment VARCHAR(100)
);

CREATE TABLE Patients (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DateOfBirth DATE,
    Gender CHAR(1),
    Address VARCHAR(255),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100),
    InsuranceDetails VARCHAR(255),
    EmergencyContact VARCHAR(100),
    AdmissionDate DATE,
    DischargeDate DATE
);

CREATE TABLE Finance (
    FinanceID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    TotalCharges DECIMAL(10, 2),
    PaymentsMade DECIMAL(10, 2),
    OutstandingBalance DECIMAL(10, 2),
    PaymentMethod VARCHAR(50),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

CREATE TABLE Bills (
    BillID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    FinanceID INT,
    BillDate DATE,
    Amount DECIMAL(10, 2),
    Description VARCHAR(255),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (FinanceID) REFERENCES Finance(FinanceID)
);

CREATE TABLE Salary (
    SalaryID INT PRIMARY KEY AUTO_INCREMENT,
    EmployeeID INT,
    Amount DECIMAL(10, 2),
    PayDate DATE,
    TaxDeducted DECIMAL(10, 2),
    NetPay DECIMAL(10, 2),
    FOREIGN KEY (EmployeeID) REFERENCES Management(ManagerID) 
    -- assuming EmployeeID refers to ManagerID in Management
);

CREATE TABLE Available_Beds (
    BedID INT PRIMARY KEY AUTO_INCREMENT,
    DepartmentID INT,
    RoomNumber VARCHAR(50),
    BedStatus VARCHAR(10),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Management (
    ManagerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15),
    Role VARCHAR(50),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Specialty VARCHAR(100),
    PhoneNumber VARCHAR(15),
    Email VARCHAR(100),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Medical (
    MedicalRecordID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    DoctorID INT,
    Diagnosis VARCHAR(255),
    Treatment VARCHAR(255),
    Prescription VARCHAR(255),
    VisitDate DATE,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

CREATE TABLE Nurses (
    NurseID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    DepartmentID INT,
    Email VARCHAR(100),
    PhoneNumber VARCHAR(15),
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);
