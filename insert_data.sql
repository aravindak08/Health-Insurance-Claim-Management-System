USE health_insurance;

INSERT INTO policy_holder (first_name, last_name, date_of_birth, gender, mobile_num, email, address)
VALUES ('Ravi', 'Kumar', '1988-03-12', 'male', '9876543210', 'ravi@example.com', 'Chennai, Tamil Nadu');

INSERT INTO hospital_details (name, address, phone, city)
VALUES ('Apollo Hospital', 'Greams Road, Chennai', '044-22223333', 'Chennai');

INSERT INTO policies (holder_id, policy_number, product, sum_insured, start_date, end_date, premium_amount)
VALUES (1, 'POL1001', 'Family Floater', 500000, '2025-01-01', '2025-12-31', 12000);

INSERT INTO claims (policy_id, hospital_id, admission_date, discharge_date, diagnosis, claimed_amount, approved_amount, is_cashless)
VALUES (1, 1, '2025-10-01', '2025-10-05', 'Appendicitis', 150000, 90000, TRUE);

INSERT INTO claim_documents (claim_id, doc_type, file_name, uploaded_by)
VALUES (1, 'bill', 'bill_01.pdf', 'Ravi');

INSERT INTO reimbursement_details (claim_id, submission_date, reimbursement_amount, approved_amount, documents_submitted)
VALUES (1, '2025-10-10', 150000, 90000, TRUE);

INSERT INTO cashless_authorization (claim_id, auth_number, auth_status, authorized_amount)
VALUES (1, 'AUTH0001', 'approved', 90000);

INSERT INTO payments (claim_id, payee, amount, payment_method, transaction_status, reference_no)
VALUES (1, 'Apollo Hospital', 90000, 'bank_transfer', 'success', 'UTR12345');
