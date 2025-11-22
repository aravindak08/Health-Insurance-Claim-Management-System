USE health_insurance;

-- STORED PROCEDURE TO ADD A NEW CLAIM
DELIMITER $$

CREATE PROCEDURE add_new_claim(
    IN p_policy_id INT,
    IN p_hospital_id INT,
    IN p_amount DECIMAL(12,2)
)
BEGIN
    INSERT INTO claims (policy_id, hospital_id, claimed_amount)
    VALUES (p_policy_id, p_hospital_id, p_amount);
END $$

DELIMITER ;

-- CREATE VIEW FOR CLAIM SUMMARY
DROP VIEW IF EXISTS claim_summary;

CREATE VIEW claim_summary AS
SELECT 
    c.claim_id,
    p.policy_number,
    h.name AS hospital_name,
    c.claim_type,
    c.claimed_amount,
    c.approved_amount,
    c.current_status,
    c.is_cashless,
    c.created_at
FROM claims c
JOIN policies p ON c.policy_id = p.policy_id
JOIN hospital_details h ON c.hospital_id = h.hospital_id;
