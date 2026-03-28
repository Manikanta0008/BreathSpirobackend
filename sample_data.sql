-- Realistic medical sample data for BreathSpiro
-- MIP/MEP values based on published clinical reference ranges:
-- Adults: MIP 80-120 cmH2O, MEP 100-150 cmH2O (healthy)
-- COPD patients: MIP 40-70 cmH2O, MEP 50-90 cmH2O
-- Values decline with age and disease severity

USE breathspiro_db;

-- Delete old sample rows (keep real users like varun, cheta)
DELETE FROM api_userprofile WHERE username IN ('priya','arjun','kavitha','deepak','ananya','vikram','meera','sanjay','lakshmi');
DELETE FROM api_trainingsession WHERE username IN ('priya','arjun','kavitha','deepak','ananya','vikram','meera','sanjay','lakshmi');

-- Insert patients with realistic clinical data
INSERT INTO api_userprofile 
(device_id, username, password, name, age, gender, height, weight, `condition`, smoking_status, pack_years, respiratory_rate, spo2_level, dyspnea_score, dyspnea_description, muscle_strength_level, muscle_strength_title, mip_value, mep_value, baseline_hold_time_sec, created_at, updated_at) 
VALUES
-- COPD patient, heavy smoker, significantly reduced MIP/MEP
('web_arjun', 'arjun', 'pass123', 'Arjun Reddy', 45, 'Male', 170.0, 80.0, 
 'COPD', 'Current', '15 pack-years', 24, 91, '3', 'Stops after walking 100 meters or a few minutes on level ground',
 'Moderate Weakness', 'Moderate', 52.0, 64.0, 12,
 NOW(), NOW()),

-- Mild COPD, ex-smoker, slightly reduced values
('web_priya', 'priya', 'pass123', 'Priya Nair', 34, 'Female', 162.0, 58.0, 
 'COPD', 'Former', '5 pack-years', 22, 94, '2', 'Walks slower than most people on the level, or stops after 15 minutes',
 'Mild Weakness', 'Mild', 68.0, 82.0, 18,
 NOW(), NOW()),

-- ILD patient, never smoked, moderate reduction
('web_kavitha', 'kavitha', 'pass123', 'Kavitha Balaji', 52, 'Female', 158.0, 65.0, 
 'ILD', 'Never', NULL, 20, 93, '2', 'Walks slower than most people on the level',
 'Mild Weakness', 'Mild', 62.0, 76.0, 15,
 NOW(), NOW()),

-- Post-COVID recovery, improving values
('web_deepak', 'deepak', 'pass123', 'Deepak Kumar', 38, 'Male', 180.0, 85.0, 
 'Post-COVID', 'Former', '3 pack-years', 19, 96, '1', 'Breathless when hurrying or walking up a slight hill',
 'Normal', 'Normal Strength', 78.0, 98.0, 22,
 NOW(), NOW()),

-- Healthy asthma, young female, good values
('web_ananya', 'ananya', 'pass123', 'Ananya Iyer', 29, 'Female', 165.0, 55.0, 
 'Asthma', 'Never', NULL, 16, 98, '0', 'No breathlessness except on strenuous exercise',
 'Normal', 'Normal Strength', 88.0, 112.0, 30,
 NOW(), NOW()),

-- Elderly COPD + bronchiectasis, severe weakness
('web_vikram', 'vikram', 'pass123', 'Vikram Singh', 60, 'Male', 168.0, 75.0, 
 'Bronchiectasis', 'Former', '20 pack-years', 26, 89, '3', 'Stops after walking 100 meters or a few minutes',
 'Severe Weakness', 'Severe', 38.0, 42.0, 8,
 NOW(), NOW()),

-- Moderate COPD, current smoker female
('web_meera', 'meera', 'pass123', 'Meera Joshi', 42, 'Female', 160.0, 62.0, 
 'COPD', 'Current', '10 pack-years', 23, 92, '2', 'Walks slower than most people',
 'Moderate Weakness', 'Moderate', 54.0, 66.0, 14,
 NOW(), NOW()),

-- ILD, middle-aged male
('web_sanjay', 'sanjay', 'pass123', 'Sanjay Patel', 50, 'Male', 172.0, 78.0, 
 'ILD', 'Never', NULL, 21, 94, '2', 'Walks slower than most people on the level',
 'Mild Weakness', 'Mild', 65.0, 80.0, 16,
 NOW(), NOW()),

-- Post-COVID elderly female, recovering
('web_lakshmi', 'lakshmi', 'pass123', 'Lakshmi Devi', 55, 'Female', 155.0, 68.0, 
 'Post-COVID', 'Never', NULL, 20, 95, '1', 'Breathless when hurrying or walking up a slight hill',
 'Normal', 'Normal Strength', 72.0, 88.0, 20,
 NOW(), NOW());


-- Training sessions with realistic durations
INSERT INTO api_trainingsession 
(device_id, username, session_duration_sec, breath_count, completed_cycles, total_cycles, created_at) 
VALUES
-- Healthy users complete full sessions (120s = 10 cycles × 12s/cycle)
('web_ananya', 'ananya', 120, 30, 10, 10, '2026-02-22 18:00:00'),
('web_ananya', 'ananya', 120, 30, 10, 10, '2026-02-26 18:30:00'),
('web_ananya', 'ananya', 122, 31, 10, 10, '2026-03-01 19:00:00'),

-- COPD patients do fewer cycles
('web_arjun', 'arjun', 72, 18, 6, 10, '2026-02-19 11:00:00'),
('web_arjun', 'arjun', 84, 20, 7, 10, '2026-02-23 10:00:00'),

-- Post-COVID improving over time
('web_deepak', 'deepak', 96, 24, 8, 10, '2026-02-21 07:00:00'),
('web_deepak', 'deepak', 108, 27, 9, 10, '2026-02-25 07:30:00'),
('web_deepak', 'deepak', 120, 30, 10, 10, '2026-03-02 08:00:00'),

-- Severe patient struggles
('web_vikram', 'vikram', 60, 14, 5, 10, '2026-02-20 12:00:00'),
('web_vikram', 'vikram', 72, 16, 6, 10, '2026-02-25 12:30:00'),

-- Other sessions
('web_priya', 'priya', 96, 22, 8, 10, '2026-02-18 14:00:00'),
('web_meera', 'meera', 84, 20, 7, 10, '2026-02-24 17:30:00'),
('web_sanjay', 'sanjay', 96, 24, 8, 10, '2026-02-27 10:30:00'),
('web_kavitha', 'kavitha', 84, 20, 7, 10, '2026-02-24 16:30:00'),
('web_lakshmi', 'lakshmi', 108, 26, 9, 10, '2026-02-26 15:30:00');
