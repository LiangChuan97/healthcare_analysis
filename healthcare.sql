-- Data cleaning-- 

-- Rule for rectification for records with same name but different age or gender: Earliest record

-- Identify which names have demographic conflicts and adding running ID to name
ALTER TABLE healthcare_dataset
ADD COLUMN row_id INT AUTO_INCREMENT PRIMARY KEY;

CREATE TABLE conflict_names AS
SELECT 
    name,
    COUNT(DISTINCT age) AS age_variation,
    COUNT(DISTINCT gender) AS gender_variation,
    CASE 
        WHEN COUNT(DISTINCT age) > 1 OR COUNT(DISTINCT gender) > 1 
        THEN 1 ELSE 0 
    END AS conflict_flag
FROM healthcare_dataset
GROUP BY name;

CREATE TABLE healthcare_with_rn AS
SELECT 
    h.*,
    c.conflict_flag,
    ROW_NUMBER() OVER (PARTITION BY h.name ORDER BY h.date_of_admission ASC, h.row_id ASC
    ) AS rn
FROM healthcare_dataset h
JOIN conflict_names c ON h.name = c.name;

CREATE TABLE clean_healthcare_dataset AS
SELECT 
    sub.*,
    DENSE_RANK() OVER (ORDER BY name) AS patient_id
FROM healthcare_with_rn sub
WHERE 
  (conflict_flag = 1 AND rn = 1)
    OR conflict_flag = 0;