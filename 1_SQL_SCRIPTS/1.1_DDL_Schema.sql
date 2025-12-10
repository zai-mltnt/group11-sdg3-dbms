-- =============================================
-- 1.1 DDL SCHEMA - Group 11 (SDG 3)
-- =============================================

CREATE DATABASE IF NOT EXISTS health_care_system;
USE health_care_system;

-- ==========================
-- TABLE: Patients
-- ==========================
CREATE TABLE Patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    contact_number VARCHAR(20),
    address VARCHAR(255)
);

-- ==========================
-- TABLE: HealthWorkers
-- ==========================
CREATE TABLE HealthWorkers (
    worker_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    position VARCHAR(100) NOT NULL
);

-- ==========================
-- TABLE: Medicines
-- ==========================
CREATE TABLE Medicines (
    medicine_id INT AUTO_INCREMENT PRIMARY KEY,
    medicine_name VARCHAR(100) NOT NULL,
    category VARCHAR(100),
    quantity INT DEFAULT 0 CHECK (quantity >= 0),
    status VARCHAR(20)
);

-- ==========================
-- TABLE: Appointments
-- ==========================
CREATE TABLE Appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    worker_id INT NOT NULL,
    appointment_date DATE NOT NULL,
    purpose VARCHAR(255),
    status VARCHAR(50),

    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (worker_id) REFERENCES HealthWorkers(worker_id)
);

-- ==========================
-- TABLE: MedicineDistribution
-- ==========================
CREATE TABLE MedicineDistribution (
    distribution_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    medicine_id INT NOT NULL,
    worker_id INT NOT NULL,
    quantity_given INT NOT NULL CHECK (quantity_given > 0),
    distribution_date DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (medicine_id) REFERENCES Medicines(medicine_id),
    FOREIGN KEY (worker_id) REFERENCES HealthWorkers(worker_id)
);
