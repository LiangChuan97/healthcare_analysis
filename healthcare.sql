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

-- Data cleaning-- 

-- Check for nulls
SELECT *
FROM clean_healthcare_dataset
WHERE name IS NULL OR age IS NULL OR gender is NULL OR blood_type IS NULL OR medical_condition IS NULL OR date_of_admission IS NULL OR doctor IS NULL OR
hospital IS NULL OR insurance_provider IS NULL OR billing_amount IS NULL OR room_number IS NULL OR admission_type IS NULL OR discharge_date iS NULL 
OR medication IS NULL or test_results IS NULL;

-- Check for duplicates
SELECT 
name, date_of_admission, COUNT(*) AS record_count
FROM clean_healthcare_dataset
GROUP BY name, date_of_admission
HAVING COUNT(*) > 1;

-- Remove duplicates 
DELETE FROM clean_healthcare_dataset
WHERE rn > 1

-- Patient Demographics & Revenue-- 

-- Count patients by age and gender
SELECT age, gender, COUNT(*) AS total_patients, AVG(billing_amount) AS avg_billing
FROM clean_healthcare_dataset
GROUP BY age, gender
ORDER BY total_patients DESC;

-- Revenue by insurance provider
SELECT insurance_provider, COUNT(*) AS total_patients, SUM(billing_amount) AS total_revenue, AVG(billing_amount) AS avg_billing
FROM clean_healthcare_dataset
GROUP BY insurance_provider
ORDER BY total_revenue DESC;

-- Hospital & Doctor Utilization-- 

-- Patients per hospital and admission type
SELECT hospital, admission_type, COUNT(*) AS patient_count, AVG(DATEDIFF(discharge_date, date_of_admission)) AS avg_stay
FROM clean_healthcare_dataset
GROUP BY hospital, admission_type
ORDER BY patient_count DESC;

-- Patients per doctor
SELECT doctor, COUNT(*) AS patient_count, AVG(DATEDIFF(discharge_date, date_of_admission)) AS avg_stay
FROM clean_healthcare_dataset
GROUP BY doctor
ORDER BY patient_count DESC;

-- Length of Stay Analysis-- 

-- Avg stay by medical condition
SELECT medical_condition, AVG(DATEDIFF(discharge_date, date_of_admission)) AS avg_stay, COUNT(*) AS patient_count
FROM clean_healthcare_dataset
GROUP BY medical_condition
ORDER BY avg_stay DESC;

-- Avg stay by medication
SELECT medication, AVG(DATEDIFF(discharge_date, date_of_admission)) AS avg_stay, COUNT(*) AS patient_count
FROM clean_healthcare_dataset
GROUP BY medication
ORDER BY avg_stay ASC;