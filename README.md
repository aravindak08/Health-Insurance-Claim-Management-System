# 🏥 Health Insurance Claim Management System (MySQL Project)

This project is a complete **MySQL Workbench database system** designed for managing health insurance claims, including policy holders, hospitals, policies, claims, documents, reimbursements, cashless authorization, and payments.

The database follows a fully normalized structure and demonstrates real-world MySQL features such as:
- Table creation with constraints  
- Foreign key relationships  
- Stored procedures  
- Views  
- Sample data insertion  
- Reporting queries  
- ER Diagram documentation  

---

## 📊 Entity Relationship Diagram (ERD)

The ERD below illustrates the complete data model for the Health Insurance Claim Management System.

![ER Diagram](health_insurance_erd.png)

---

## 📂 Project Structure

```
Health-Insurance-Claim-Management-System/
│── database_creation.sql         # All tables, constraints, and relationships
│── insert_data.sql               # Sample test data for all tables
│── procedures_and_views.sql      # Stored procedure and reporting view
│── sample_queries.sql            # Useful SELECT queries for testing
│── health_insurance_erd.png      # ER diagram image
└── README.md                     # Project documentation
```

---

## 🧱 Database Overview

### 1. policy_holder  
Stores personal & contact details of the policyholder.

### 2. hospital_details  
Contains empanelled hospital information for claim processing.

### 3. policies  
Links policy holders with their insurance details, coverage, and status.

### 4. claims  
Core table for claims made under policies — includes diagnosis, cashless/reimbursement type, approval, and current status.

### 5. claim_documents  
Holds uploaded documents like bills, discharge summary, etc.

### 6. reimbursement_details  
Tracks reimbursement workflow, approval, and rejection details.

### 7. cashless_authorization  
Manages cashless authorization requests and approved amounts.

### 8. payments  
Records final claim settlement payments.

---

## ⚙️ How to Run This Project in MySQL Workbench

1. Open **MySQL Workbench**  
2. Run `database_creation.sql`  
3. Run `insert_data.sql`  
4. Run `procedures_and_views.sql`  
5. Run `sample_queries.sql` to test outputs  

---

## 🧪 Features Included

- Fully designed MySQL relational schema  
- Complete normalization  
- Proper foreign key constraints  
- Stored procedure for adding new claims  
- Claim summary view for reporting  
- Cashless & reimbursement workflows  
- Timestamp-based tracking  
- Professional ERD representation  
- Clean GitHub structure  

---

## 📌 Technologies Used

- MySQL Workbench  
- SQL  
- ER Modeling  
- GitHub for version control  

---

## 👤 Developer  
**Aravind**

---

## 📄 License  
You may add a license if needed (MIT recommended).

