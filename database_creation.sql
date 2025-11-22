
-- HEALTH INSURANCE CLAIM MANAGEMENT SYSTEM – Database Creation (MySQL)

CREATE DATABASE IF NOT EXISTS health_insurance;
USE health_insurance;

-- TABLE 1 - policy_holder
CREATE TABLE IF NOT EXISTS policy_holder (
    holder_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100),
    date_of_birth DATE,
    gender ENUM('male','female','other'),
    mobile_num VARCHAR(50),
    email VARCHAR(159),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- TABLE 2 - hospital_details
CREATE TABLE IF NOT EXISTS hospital_details (
    hospital_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    address TEXT,
    phone VARCHAR(30),
    city VARCHAR(100),
    is_empanelled BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- TABLE 3 - policies
CREATE TABLE IF NOT EXISTS policies (
    policy_id INT AUTO_INCREMENT PRIMARY KEY,
    holder_id INT NOT NULL,
    policy_number VARCHAR(100) NOT NULL UNIQUE,
    product VARCHAR(100) NOT NULL,
    sum_insured DECIMAL(12,2) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    premium_amount DECIMAL(10,2) NOT NULL,
    policy_status ENUM('active','expired','cancelled') DEFAULT 'active',
    agent_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_policies_holder FOREIGN KEY (holder_id) REFERENCES policy_holder(holder_id)
);

-- TABLE 4 - claims
CREATE TABLE IF NOT EXISTS claims (
    claim_id INT AUTO_INCREMENT PRIMARY KEY,
    policy_id INT NOT NULL,
    hospital_id INT NOT NULL,
    admission_date DATE,
    discharge_date DATE,
    diagnosis VARCHAR(500),
    claimed_amount DECIMAL(12,2),
    approved_amount DECIMAL(12,2),
    is_cashless BOOLEAN DEFAULT FALSE,
    claim_type ENUM('cashless','reimbursement') DEFAULT 'reimbursement',
    current_status ENUM('initiated','processing','approved','rejected','paid') DEFAULT 'initiated',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (policy_id) REFERENCES policies(policy_id),
    FOREIGN KEY (hospital_id) REFERENCES hospital_details(hospital_id)
);

-- TABLE 5 - claim_documents
CREATE TABLE IF NOT EXISTS claim_documents (
    document_id INT AUTO_INCREMENT PRIMARY KEY,
    claim_id INT NOT NULL,
    doc_type VARCHAR(100),
    file_name VARCHAR(255),
    uploaded_by VARCHAR(100),
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (claim_id) REFERENCES claims(claim_id)
);

-- TABLE 6 - reimbursement_details
CREATE TABLE IF NOT EXISTS reimbursement_details (
    reimbursement_id INT AUTO_INCREMENT PRIMARY KEY,
    claim_id INT NOT NULL,
    submission_date DATE,
    reimbursement_amount DECIMAL(12,2),
    approved_amount DECIMAL(12,2),
    documents_submitted BOOLEAN DEFAULT FALSE,
    reimbursement_status ENUM('submitted','under_review','approved','rejected') DEFAULT 'submitted',
    rejection_reason VARCHAR(500),
    processed_at TIMESTAMP NULL,
    FOREIGN KEY (claim_id) REFERENCES claims(claim_id)
);

-- TABLE 7 - cashless_authorization
CREATE TABLE IF NOT EXISTS cashless_authorization (
    auth_id INT AUTO_INCREMENT PRIMARY KEY,
    claim_id INT NOT NULL,
    auth_number VARCHAR(100) UNIQUE,
    auth_status ENUM('requested','approved','rejected','expired') DEFAULT 'requested',
    authorized_amount DECIMAL(12,2),
    requested_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    responded_at TIMESTAMP NULL,
    FOREIGN KEY (claim_id) REFERENCES claims(claim_id)
);

-- TABLE 8 - payments
CREATE TABLE IF NOT EXISTS payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    claim_id INT NOT NULL,
    payee VARCHAR(200),
    amount DECIMAL(12,2),
    payment_method ENUM('upi','bank_transfer','cheque'),
    transaction_status ENUM('pending','success','failed') DEFAULT 'pending',
    reference_no VARCHAR(150),
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (claim_id) REFERENCES claims(claim_id)
);
