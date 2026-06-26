/*
=========================================
Healthcare Claims Analysis SQL Queries
Author: Alexis Nailing
Project: Healthcare Claims Analysis Dashboard
=========================================
*/

--------------------------------------------------
-- 1. Claims by Payer Type
--------------------------------------------------

SELECT
    payer_type,
    COUNT(*) AS total_claims
FROM claims_main
GROUP BY payer_type
ORDER BY total_claims DESC;


--------------------------------------------------
-- 2. Average Claim Amount by Payer
--------------------------------------------------

SELECT
    payer_type,
    ROUND(AVG(claim_amount_usd), 2) AS avg_claim_amount
FROM claims_main
GROUP BY payer_type
ORDER BY avg_claim_amount DESC;


--------------------------------------------------
-- 3. Top Denial Categories
--------------------------------------------------

SELECT denial_category,
    COUNT(*) AS denied_claims
FROM claims_main
WHERE outcome = 'denied'
GROUP BY denial_category
ORDER BY denied_claims DESC;

--------------------------------------------------
-- 4. Claim Outcomes
--------------------------------------------------

SELECT
    outcome,
    COUNT(*) AS total_claims
FROM claims_main
GROUP BY outcome
ORDER BY total_claims DESC;

--------------------------------------------------
-- 5. Claims by Provider Specialty
--------------------------------------------------

SELECT
    provider_specialty,
    COUNT(*) AS total_claims
FROM claims_main
GROUP BY provider_specialty
ORDER BY total_claims DESC;

--------------------------------------------------
-- 6. Monthly Claim Trend
--------------------------------------------------

SELECT
    YEAR(claim_submission_date) AS claim_year,
    MONTH(claim_submission_date) AS claim_month,
    COUNT(*) AS total_claims
FROM claims_main
GROUP BY
    YEAR(claim_submission_date),
    MONTH(claim_submission_date)
ORDER BY
    claim_year,
    claim_month;

    --------------------------------------------------
-- 7. Average Claim Amount by Provider Specialty
--------------------------------------------------

SELECT
    provider_specialty,
    ROUND(AVG(claim_amount_usd), 2) AS avg_claim_amount
FROM claims_main
GROUP BY provider_specialty
ORDER BY avg_claim_amount DESC;