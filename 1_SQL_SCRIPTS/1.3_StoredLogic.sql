-- =============================================
-- 1.3 STORED LOGIC - Group 11 (SDG 3)
-- =============================================
USE health_care_system;

DELIMITER $$

-- ===============================
-- STORED PROCEDURE - Transaction
-- ===============================
CREATE PROCEDURE process_medicine_distribution 
(
    IN p_patient_id INT, 
    IN p_medicine_id INT, 
    IN p_worker_id INT,
    IN p_quantity INT
)  
BEGIN
    DECLARE current_stock INT;

    START TRANSACTION;

    SELECT quantity INTO current_stock
    FROM Medicines
    WHERE medicine_id = p_medicine_id;

    IF current_stock < p_quantity THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Insufficient stock for selected medicine';
    ELSE
        UPDATE Medicines
        SET quantity = quantity - p_quantity
        WHERE medicine_id = p_medicine_id;

        INSERT INTO MedicineDistribution(patient_id, medicine_id, worker_id, quantity_given)
        VALUES (p_patient_id, p_medicine_id, p_worker_id, p_quantity);

        COMMIT;
    END IF;
END$$

DELIMITER ;


-- ===============================
-- VIEW: Upcoming Appointments
-- ===============================
CREATE OR REPLACE VIEW vw_upcoming_appointments_7days AS
SELECT 
    a.appointment_id,
    p.full_name AS patient_name,
    h.full_name AS health_worker_name,
    a.appointment_date,
    a.purpose,
    a.status
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN healthworkers h ON a.worker_id = h.worker_id
WHERE a.appointment_date BETWEEN CURDATE() AND CURDATE() + INTERVAL 7 DAY

ORDER BY a.appointment_date ASC;

-- ===============================
-- TRIGGER: Low Stock Alert
-- ===============================
DELIMITER $$

CREATE TRIGGER trg_low_stock_alert
AFTER UPDATE ON Medicines
FOR EACH ROW
BEGIN
    IF NEW.quantity <= 5 THEN
        UPDATE Medicines
        SET status = 'LOW STOCK'
        WHERE medicine_id = NEW.medicine_id;
    ELSE
        UPDATE Medicines
        SET status = 'OK'
        WHERE medicine_id = NEW.medicine_id;
    END IF;
END$$

DELIMITER ;
