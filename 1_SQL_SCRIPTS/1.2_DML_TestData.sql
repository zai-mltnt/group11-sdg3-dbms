-- =============================================
-- 1.2 DML TEST DATA - Group 11 (SDG 3)
-- =============================================
USE health_care_system;

-- ==========================
-- Patients
-- ==========================
INSERT INTO Patients (patient_id, full_name, birth_date, contact_number, address) VALUES
(1, 'Maria Santos', '1985-03-12', '+639171234567', 'Manila, Philippines'),
(2, 'Juan Dela Cruz', '1990-07-25', '+639227654321', 'Quezon City, Philippines'),
(3, 'Ana Reyes', '1978-11-05', '+639338901234', 'Caloocan City, Philippines'),
(4, 'Luis Mendoza', '2000-01-18', '+639442345678', 'Pasig City, Philippines'),
(5, 'Sofia Lopez', '1965-09-30', '+639553456789', 'Makati City, Philippines'),
(6, 'Carlos Aquino', '1982-04-15', '+639664567890', 'Taguig City, Philippines'),
(7, 'Julia Ramos', '1995-06-22', '+639775678901', 'Mandaluyong City, Philippines'),
(8, 'Roberto Cruz', '1970-12-08', '+639886789012', 'Pasay City, Philippines'),
(9, 'Elena Bautista', '1988-02-14', '+639997890123', 'Marikina City, Philippines'),
(10, 'Miguel Torres', '2005-08-03', '+639188901234', 'Valenzuela City, Philippines');

-- ==========================
-- HealthWorkers
-- ==========================
INSERT INTO HealthWorkers (worker_id, full_name, position) VALUES
(1, 'Dr. Lisa Santos', 'General Practitioner'),
(2, 'Nurse Ana Cruz', 'Staff Nurse'),
(3, 'Dr. Mark Reyes', 'Pediatrician'),
(4, 'Nurse John Mendoza', 'Public Health Nurse'),
(5, 'Dr. Sarah Lopez', 'Pharmacist');

-- ==========================
-- Medicines
-- ==========================
INSERT INTO Medicines (medicine_id, medicine_name, category, quantity, status) VALUES
(1, 'Paracetamol 500mg', 'Analgesic', 50, 'OK'),
(2, 'Amoxicillin 250mg', 'Antibiotic', 30, 'OK'),
(3, 'Loratadine 10mg', 'Antihistamine', 20, 'OK'),
(4, 'Metformin 500mg', 'Antidiabetic', 15, 'OK'),
(5, 'Ibuprofen 200mg', 'Analgesic', 40, 'OK'),
(6, 'Cetirizine 10mg', 'Antihistamine', 12, 'OK'),
(7, 'Aspirin 81mg', 'Blood Thinner', 8, 'LOW STOCK'),
(8, 'Omeprazole 20mg', 'Antacid', 25, 'OK');

-- ==========================
-- Appointments
-- ==========================
INSERT INTO Appointments (appointment_id, patient_id, worker_id, appointment_date, purpose, status) VALUES
(1, 1, 1, '2025-12-08', 'Routine Check-up', 'Scheduled'),
(2, 2, 3, '2025-12-10', 'Child Vaccination', 'Scheduled'),
(3, 3, 2, '2025-12-12', 'Cold and Flu Consultation', 'Scheduled'),
(4, 4, 4, '2025-12-15', 'Diabetes Management', 'Scheduled'),
(5, 5, 1, '2025-12-18', 'Hypertension Check', 'Scheduled'),
(6, 6, 5, '2025-12-20', 'Medication Review', 'Scheduled'),
(7, 7, 3, '2025-12-22', 'Pediatric Consultation', 'Scheduled'),
(8, 8, 2, '2025-12-25', 'Arthritis Management', 'Scheduled'),
(9, 9, 4, '2025-12-28', 'Maternal Health Check', 'Scheduled'),
(10, 10, 3, '2025-12-30', 'Child Wellness Visit', 'Scheduled');

-- ==========================
-- Medicine Distribution
-- (ALL VALUES FROM YOUR SQL DUMP)
-- ==========================
INSERT INTO MedicineDistribution (distribution_id, patient_id, medicine_id, worker_id, quantity_given, distribution_date) VALUES
(1, 1, 1, 2, 2, '2025-12-08 23:31:08'),
(2, 2, 2, 3, 5, '2025-12-08 23:31:08'),
(3, 3, 3, 2, 3, '2025-12-08 23:31:08'),
(4, 4, 4, 4, 10, '2025-12-08 23:31:08'),
(5, 5, 5, 1, 4, '2025-12-08 23:31:08'),
(6, 6, 6, 5, 2, '2025-12-08 23:31:08'),
(7, 7, 2, 3, 3, '2025-12-08 23:31:08'),
(8, 8, 5, 2, 5, '2025-12-08 23:31:08'),
(9, 9, 8, 4, 2, '2025-12-08 23:31:08'),
(10, 10, 1, 3, 1, '2025-12-08 23:31:08'),
(11, 1, 6, 5, 2, '2025-12-08 23:31:08'),
(12, 2, 1, 3, 2, '2025-12-08 23:31:08'),
(13, 3, 5, 2, 3, '2025-12-08 23:31:08'),
(14, 4, 4, 4, 5, '2025-12-08 23:31:08'),
(15, 5, 3, 1, 2, '2025-12-08 23:31:08'),
(16, 6, 7, 5, 1, '2025-12-08 23:31:08'),
(17, 7, 8, 3, 2, '2025-12-08 23:31:08'),
(18, 8, 2, 2, 4, '2025-12-08 23:31:08'),
(19, 9, 1, 4, 3, '2025-12-08 23:31:08'),
(20, 10, 3, 3, 2, '2025-12-08 23:31:08'),
(21, 1, 4, 1, 2, '2025-12-08 23:31:08'),
(22, 2, 6, 3, 1, '2025-12-08 23:31:08'),
(23, 3, 7, 2, 1, '2025-12-08 23:31:08'),
(24, 4, 8, 4, 3, '2025-12-08 23:31:08'),
(25, 5, 2, 1, 2, '2025-12-08 23:31:08'),
(26, 6, 1, 5, 4, '2025-12-08 23:31:08'),
(27, 7, 5, 3, 2, '2025-12-08 23:31:08'),
(28, 8, 3, 2, 3, '2025-12-08 23:31:08'),
(29, 9, 6, 4, 1, '2025-12-08 23:31:08'),
(30, 10, 4, 3, 2, '2025-12-08 23:31:08');
