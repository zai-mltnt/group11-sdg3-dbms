-- =============================================
-- 1.4 DCL USERS & PERMISSIONS - Group 11 (SDG 3)
-- =============================================

USE health_care_system;

-- Create a limited-access clinic user
CREATE USER IF NOT EXISTS 'clinic_user'@'localhost' IDENTIFIED BY '12345';

-- Grant permissions
GRANT SELECT, INSERT, UPDATE ON health_care_system.* TO 'clinic_user'@'localhost';

-- Optional: revoke dangerous rights
REVOKE DELETE ON health_care_system.* FROM 'clinic_user'@'localhost';

FLUSH PRIVILEGES;