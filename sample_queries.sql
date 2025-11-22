USE health_insurance;

-- See all policy holders
SELECT * FROM policy_holder;

-- See all policies with holder details
SELECT 
    p.policy_id,
    p.policy_number,
    p.product,
    p.sum_insured,
    ph.first_name,
    ph.last_name
FROM policies p
JOIN policy_holder ph ON p.holder_id = ph.holder_id;

-- See all claims with hospital & policy information
SELECT
    c.claim_id,
    p.policy_number,
    h.name AS hospital_name,
    c.claimed_amount,
    c.approved_amount,
    c.current_status
FROM claims c
JOIN policies p ON c.policy_id = p.policy_id
JOIN hospital_details h ON c.hospital_id = h.hospital_id;

-- See cashless claims only
SELECT * FROM claims WHERE is_cashless = TRUE;

-- See reimbursement details
SELECT * FROM reimbursement_details;

-- See all payments
SELECT * FROM payments;

-- Use the claim summary view
SELECT * FROM claim_summary;
