# Community Health Appointment & Medicine Distribution System  
### **Group 11 – SDG 3 Project (Good Health & Well-Being)**

---

## Project Overview  
This project supports **UN SDG 3 – Good Health & Well-Being** by providing a database-driven system for community healthcare clinics.  
It manages:

- Patient Records  
- Health Worker Records  
- Appointments Scheduling  
- Medicine Inventory  
- Medicine Distribution with Transaction Handling  

The project demonstrates the required DBMS concepts such as **DDL, DML, Stored Logic, Transactions, Views, Constraints, and DCL**.

---

## Repository Structure  
```
Group11-SDG3-dbms
├── .gitignore
├── 1_SQL_SCRIPTS/
│   ├── 1.1_DDL_Schema.sql
│   ├── 1.2_DML_TestData.sql
│   ├── 1.3_StoredLogic.sql
│   └── 1.4_DCL_Users.sql
├── 2_DEMO_INTERFACE/
│   └── (Your Web/CLI Files Here)
├── 3_DOCUMENTATION/
│   ├── SDAD_Group11.pdf
│   ├── ERD_Final.pdf
│   ├── Transaction_Flowchart.png
└── README.md
```

---

## Installation / Setup Instructions

### **1. Install a MySQL/MariaDB Environment**
Use any of the following:
- XAMPP
- WAMP
- Laragon
- MySQL Workbench
- phpMyAdmin  

### **2. Run SQL Scripts in Order**
Evaluator must load SQL *in strict sequence*:

1. **1.1_DDL_Schema.sql**  
2. **1.2_DML_TestData.sql**  
3. **1.3_StoredLogic.sql**  
4. **1.4_DCL_Users.sql**

### **3. Launch the Demo Interface**
If you created a CLI or web interface, place it under:
```
/2_DEMO_INTERFACE/
```

---

## Usage Instructions

### **FR3 – Stored Procedure Demonstration**
Run the medicine distribution transactional stored procedure:

```sql
CALL process_medicine_distribution(1, 1, 5, 3);
```

This automatically:
- Checks stock  
- Updates medicine quantity  
- Inserts a distribution record  
- Rolls back if stock is insufficient  

---

## **FR4 – Required Report Queries**

### **1. Upcoming Appointments (View)**
```sql
SELECT * FROM vw_upcoming_appointments_7days;
```

### **2. Daily Medicine Distribution Report**
```sql
SELECT * FROM MedicineDistribution
WHERE DATE(distribution_date) = CURDATE();
```

### **3. Low-Stock Medicines**
```sql
SELECT * FROM Medicines
WHERE status = 'LOW STOCK';
```

---

## User Access (DCL)
A sample restricted user is created via:

```sql
CREATE USER 'clinic_user'@'localhost' IDENTIFIED BY '12345';
GRANT SELECT, INSERT, UPDATE ON health_care_system.* TO 'clinic_user'@'localhost';
```

---

## Contributors — Group 11
(Add your real names here)

| Member Name | Contribution |
|-------------|--------------|
| Climaco / Bongat | DDL + ERD |
| Climaco / Bongat | DML Test Records |
| Castro | Stored Procedure + Transactions |
| Melitante | Views + Reports |
| ALL MEMBERS | Demo Interface & Documentation |

---

## SDG Alignment
This system helps promote **SDG 3 – Good Health & Well-Being** by:
- Providing reliable medical record-keeping  
- Reducing manual errors in medicine distribution  
- Improving patient appointment scheduling  
- Ensuring safe and accurate medicine inventory management  

---

## Notes for Evaluators
- All SQL is original and created by Group 11.  
- Stored procedure clearly demonstrates **ACID-compliant transactions**.  
- Triggers/constraints prevent invalid data entries.  
- 50+ test records included as required.  

---

## License
This academic project is submitted as part of DBMS coursework and is not intended for commercial use.


