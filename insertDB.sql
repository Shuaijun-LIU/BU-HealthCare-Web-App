-- appointment_type
INSERT INTO appointment_type (appointment_type_id, type, description) VALUES (1, 'physical examination', 'Comprehensive examination to assess overall health');
INSERT INTO appointment_type (appointment_type_id, type, description) VALUES (2, 'child care', 'Routine check-up and care for children');
INSERT INTO appointment_type (appointment_type_id, type, description) VALUES (3, 'follow-up visit', 'Visit to monitor progress and follow up on previous treatment');
INSERT INTO appointment_type (appointment_type_id, type, description) VALUES (4, 'urgent visit', 'Immediate attention required due to urgent medical needs');


-- appointment_status
INSERT INTO appointment_status (appointment_status_id, status, description) VALUES (1, 'scheduled', 'Appointment is scheduled and confirmed');
INSERT INTO appointment_status (appointment_status_id, status, description) VALUES (2, 'cancelled', 'Appointment has been cancelled by the patient or provider');
INSERT INTO appointment_status (appointment_status_id, status, description) VALUES (3, 'no show', 'Patient did not show up for the scheduled appointment');
INSERT INTO appointment_status (appointment_status_id, status, description) VALUES (4, 'completed', 'Appointment has been successfully completed');


-- diagnosis
INSERT INTO diagnosis (diagnosis_code, diagnosis) VALUES (1, 'Common Cold');
INSERT INTO diagnosis (diagnosis_code, diagnosis) VALUES (2, 'Influenza');
INSERT INTO diagnosis (diagnosis_code, diagnosis) VALUES (3, 'Bronchitis');
INSERT INTO diagnosis (diagnosis_code, diagnosis) VALUES (4, 'Pneumonia');
INSERT INTO diagnosis (diagnosis_code, diagnosis) VALUES (5, 'Gastroenteritis');
INSERT INTO diagnosis (diagnosis_code, diagnosis) VALUES (6, 'Urinary Tract Infection');
INSERT INTO diagnosis (diagnosis_code, diagnosis) VALUES (7, 'Strep Throat');
INSERT INTO diagnosis (diagnosis_code, diagnosis) VALUES (8, 'Sinusitis');
INSERT INTO diagnosis (diagnosis_code, diagnosis) VALUES (9, 'Allergies');
INSERT INTO diagnosis (diagnosis_code, diagnosis) VALUES (10, 'Migraine');
INSERT INTO diagnosis (diagnosis_code, diagnosis) VALUES (11, 'Asthma');
INSERT INTO diagnosis (diagnosis_code, diagnosis) VALUES (12, 'Diabetes');
INSERT INTO diagnosis (diagnosis_code, diagnosis) VALUES (13, 'Hypertension');
INSERT INTO diagnosis (diagnosis_code, diagnosis) VALUES (14, 'Hyperlipidemia');
INSERT INTO diagnosis (diagnosis_code, diagnosis) VALUES (15, 'Depression');
INSERT INTO diagnosis (diagnosis_code, diagnosis) VALUES (16, 'Anxiety Disorder');
INSERT INTO diagnosis (diagnosis_code, diagnosis) VALUES (17, 'Arthritis');
INSERT INTO diagnosis (diagnosis_code, diagnosis) VALUES (18, 'Back Pain');
INSERT INTO diagnosis (diagnosis_code, diagnosis) VALUES (19, 'Migraine');
INSERT INTO diagnosis (diagnosis_code, diagnosis) VALUES (20, 'Acne');
INSERT INTO diagnosis (diagnosis_code, diagnosis) VALUES (21, 'Food poisoning');
INSERT INTO diagnosis (diagnosis_code, diagnosis) VALUES (22, 'Food poisoning');
INSERT INTO diagnosis (diagnosis_code, diagnosis) VALUES (23, 'Gastritis');
INSERT INTO diagnosis (diagnosis_code, diagnosis) VALUES (24, 'Viral infection');
INSERT INTO diagnosis (diagnosis_code, diagnosis) VALUES (25, 'Angina');
INSERT INTO diagnosis (diagnosis_code, diagnosis) VALUES (26, 'Other (Emergency surgery)');
INSERT INTO diagnosis (diagnosis_code, diagnosis) VALUES (27, 'Cardiac Arrest');
INSERT INTO diagnosis (diagnosis_code, diagnosis) VALUES (28, 'Meniere disease');
INSERT INTO diagnosis (diagnosis_code, diagnosis) VALUES (29, 'Anemia');
INSERT INTO diagnosis (diagnosis_code, diagnosis) VALUES (30, 'Eye Infection');
INSERT INTO diagnosis (diagnosis_code, diagnosis) VALUES (31, 'Ear Infection');
INSERT INTO diagnosis (diagnosis_code, diagnosis) VALUES (32, 'Post-surgery discomfort');



-- department
INSERT INTO department (department_id, name, phone, email)
VALUES (1, 'Cardiology', '111-111-1111', 'cardiology@hospital.bu.edu');

INSERT INTO department (department_id, name, phone, email)
VALUES (2, 'Family Medicine', '222-222-2222', 'family.medicine@hospital.bu.edu');

INSERT INTO department (department_id, name, phone, email)
VALUES (3, 'Orthopedics', '333-333-3333', 'orthopedics@hospital.bu.edu');

INSERT INTO department (department_id, name, phone, email)
VALUES (4, 'Ophthalmology', '444-444-4444', 'ophthalmology@hospital.bu.edu');

INSERT INTO department (department_id, name, phone, email)
VALUES (5, 'Gastroenterology', '555-555-5555', 'gastroenterology@hospital.bu.edu');

INSERT INTO department (department_id, name, phone, email)
VALUES (6, 'Dermatology', '666-666-6666', 'dermatology@hospital.bu.edu');

INSERT INTO department (department_id, name, phone, email)
VALUES (7, 'Urology', '777-777-7777', 'urology@hospital.bu.edu');

INSERT INTO department (department_id, name, phone, email)
VALUES (8, 'Endocrinology', '888-888-8888', 'endocrinology@hospital.bu.edu');

INSERT INTO department (department_id, name, phone, email)
VALUES (9, 'Pulmonology', '999-999-9999', 'pulmonology@hospital.bu.edu');

INSERT INTO department (department_id, name, phone, email)
VALUES (10, 'Family Medicine', '101-101-1010', 'family.medicine@hospital.bu.edu');

INSERT INTO department (department_id, name, phone, email)
VALUES (11, 'Pediatrics', '202-202-2020', 'pediatrics@hospital.bu.edu');

INSERT INTO department (department_id, name, phone, email)
VALUES (12, 'Otolaryngology', '303-303-3030', 'otolaryngology@hospital.bu.edu');

INSERT INTO department (department_id, name, phone, email)
VALUES (13, 'Gynecology', '404-404-4040', 'gynecology@hospital.bu.edu');

INSERT INTO department (department_id, name, phone, email)
VALUES (14, 'Oncology', '505-505-5050', 'oncology@hospital.bu.edu');

INSERT INTO department (department_id, name, phone, email)
VALUES (15, 'Nephrology', '606-606-6060', 'nephrology@hospital.bu.edu');

INSERT INTO department (department_id, name, phone, email)
VALUES (16, 'Allergy and Immunology', '707-707-7070', 'allergy@hospital.bu.edu');

INSERT INTO department (department_id, name, phone, email)
VALUES (17, 'Emergency Medicine', '808-808-8080', 'emergency@hospital.bu.edu');

INSERT INTO department (department_id, name, phone, email)
VALUES (18, 'Psychiatry', '909-909-9090', 'psychiatry@hospital.bu.edu');

INSERT INTO department (department_id, name, phone, email)
VALUES (19, 'General Surgery', '010-010-0101', 'surgery@hospital.bu.edu');

INSERT INTO department (department_id, name, phone, email)
VALUES (20, 'Hematology', '111-111-0000', 'hematology@hospital.bu.edu');

INSERT INTO department (department_id, name, phone, email)
VALUES (21, 'Obstetrics', '212-212-2121', 'obstetrics@hospital.bu.edu');

INSERT INTO department (department_id, name, phone, email)
VALUES (22, 'Rheumatology', '313-313-3131', 'rheumatology@hospital.bu.edu');

INSERT INTO department (department_id, name, phone, email)
VALUES (23, 'Neurosurgery', '414-414-4141', 'neurosurgery@hospital.bu.edu');

INSERT INTO department (department_id, name, phone, email)
VALUES (24, 'Plastic Surgery', '515-515-5151', 'plasticsurgery@hospital.bu.edu');

INSERT INTO department (department_id, name, phone, email)
VALUES (25, 'Mental Health Counseling', '616-616-6161', 'counseling@hospital.bu.edu');

INSERT INTO department (department_id, name, phone, email)
VALUES (26, 'Psychopharmacology', '717-717-7171', 'psychopharmacology@hospital.bu.edu');

INSERT INTO department (department_id, name, phone, email)
VALUES (27, 'Behavior Analysis', '818-818-8181', 'behavior@hospital.bu.edu');

INSERT INTO department (department_id, name, phone, email)
VALUES (28, 'Developmental Pediatrics', '919-919-9191', 'developmental@hospital.bu.edu');

INSERT INTO department (department_id, name, phone, email)
VALUES (29, 'Pain Management', '020-020-0202', 'painmanagement@hospital.bu.edu');

INSERT INTO department (department_id, name, phone, email)
VALUES (30, 'Physical Therapy', '121-121-1212', 'physicaltherapy@hospital.bu.edu');

INSERT INTO department (department_id, name, phone, email)
VALUES (31, 'Geriatrics', '222-222-1111', 'geriatrics@hospital.bu.edu');

INSERT INTO department (department_id, name, phone, email)
VALUES (32, 'Family Medicine', '323-323-3232', 'familymedicine@hospital.bu.edu');

INSERT INTO department (department_id, name, phone, email)
VALUES (33, 'Nursing', '222-000-0002', 'nursing@hospital.bu.edu');

INSERT INTO department (department_id, name, phone, email)
VALUES (34, 'Nursing', '101-000-0001', 'nursing@hospital.bu.edu');


-- student
INSERT INTO student (student_id, first_name, last_name, dob, phone, email, sex, marital_status, ethnicity, nationality, blood_type, height, weight, blood_pressure, bmi, last_updated_at, password)
VALUES
(8123456, 'John', 'Doe', '1996-05-15', '700-111-1111', 'john.doe@bu.edu', 'Male', 'Married', 'Caucasian', 'United States of America', 'B-', 170.5, 75.2, '120/80', 24.8, '2024-07-30', '12345'),
(8123457, 'Jane', 'Smith', '1999-09-21', '700-222-2222', 'jane.smith@bu.edu', 'Female', 'Single', 'Hispanic', 'United States of America', 'A-', 165.0, 68.9, '118/78', 25.1, '2024-07-30', '12345'),
(8123458, 'Michael', 'Brown', '2003-07-03', '700-333-3333', 'michael.brown@bu.edu', 'Male', 'Divorced', 'African American', 'United States of America', 'O+', 165.0, 70.5, '122/82', 26.9, '2024-07-30', '12345'),
(8123459, 'Sarah', 'Johnson', '2001-12-10', '700-444-4444', 'sarah.johnson@bu.edu', 'Female', 'Married', 'Asian', 'United States of America', 'A+', 165.0, 65.1, '115/75', 23.6, '2024-07-30', '12345'),
(8123460, 'David', 'Wilson', '1995-03-28', '700-555-5555', 'david.wilson@bu.edu', 'Male', 'Single', 'Caucasian', 'United States of America', 'B+', 175.1, 70.7, '120/80', 22.9, '2024-07-30', '12345'),
(8123461, 'Emily', 'Thomas', '1997-11-07', '700-666-6666', 'emily.thomas@bu.edu', 'Female', 'Divorced', 'Hispanic', 'United States of America', 'O-', 169.4, 73.8, '118/78', 25.8, '2024-07-30', '12345'),
(8123462, 'Michaela', 'Nguyen', '2000-08-18', '700-777-7777', 'michaela.nguyen@bu.edu', 'Female', 'Single', 'Asian', 'United States of America', 'AB+', 181.6, 88.4, '122/82', 26.8, '2024-07-30', '12345'),
(8123463, 'Alexander', 'Johnson', '2002-06-02', '700-888-8888', 'alexander.johnson@bu.edu', 'Male', 'Married', 'African American', 'United States of America', 'AB-', 172.7, 67.2, '115/75', 23.8, '2024-07-30', '12345'),
(8123464, 'Natalie', 'Garcia', '1998-04-09', '700-999-9999', 'natalie.garcia@bu.edu', 'Female', 'Single', 'Caucasian', 'United States of America', 'O+', 172.7, 67.5, '120/80', 26.3, '2024-07-30', '12345'),
(8123465, 'Matthew', 'Harris', '2004-10-25', '700-123-4567', 'matthew.harris@bu.edu', 'Male', 'Divorced', 'Hispanic', 'Canada', 'B+', 164.2, 65.8, '118/78', 24.4, '2024-07-30', '12345'),
(8123466, 'Olivia', 'Jackson', '1996-07-14', '700-234-5678', 'olivia.jackson@bu.edu', 'Female', 'Married', 'Asian', 'United States of America', 'O-', 177.3, 83.2, '122/82', 26.5, '2024-07-30', '12345'),
(8123467, 'William', 'Davis', '2005-01-31', '700-345-6789', 'william.davis@bu.edu', 'Male', 'Single', 'African American', 'United States of America', 'A+', 160.7, 60.4, '115/75', 23.4, '2024-07-30', '12345'),
(8123468, 'Sophia', 'Nguyen', '1999-09-05', '700-456-7890', 'sophia.nguyen@bu.edu', 'Female', 'Divorced', 'Caucasian', 'United States of America', 'B-', 173.9, 76.1, '120/80', 25.1, '2024-07-30', '12345'),
(8123469, 'Benjamin', 'Wilson', '1995-05-20', '700-567-8901', 'benjamin.wilson@bu.edu', 'Male', 'Single', 'Hispanic', 'United States of America', 'AB-', 168.6, 71.5, '118/78', 25.2, '2024-07-30', '12345'),
(8123470, 'Olivia', 'Thomas', '2001-12-01', '700-678-9012', 'olivia.thomas@bu.edu', 'Female', 'Married', 'Asian', 'United States of America', 'A+', 180.2, 87.9, '122/82', 26.7, '2024-07-30', '12345'),
(8123471, 'Jacob', 'Garcia', '1997-02-17', '700-789-0123', 'jacob.garcia@bu.edu', 'Male', 'Single', 'African American', 'United States of America', 'O+', 166.5, 66.7, '115/75', 24.1, '2024-07-30', '12345'),
(8123472, 'Ava', 'Harris', '1995-10-10', '700-890-1234', 'ava.harris@bu.edu', 'Female', 'Divorced', 'Caucasian', 'United States of America', 'B+', 171.8, 77.8, '120/80', 26.4, '2024-07-30', '12345'),
(8123473, 'Ethan', 'Johnson', '1996-07-27', '700-901-2345', 'ethan.johnson@bu.edu', 'Male', 'Married', 'Hispanic', 'United States of America', 'O-', 163.5, 63.9, '118/78', 23.8, '2024-07-30', '12345'),
(8123474, 'Mia', 'Brown', '2003-03-12', '700-012-3456', 'mia.brown@bu.edu', 'Female', 'Single', 'Asian', 'United States of America', 'A+', 176.4, 82.6, '122/82', 26.3, '2024-07-30', '12345'),
(8123475, 'Jackson', 'Davis', '1998-11-29', '700-123-4560', 'jackson.davis@bu.edu', 'Male', 'Divorced', 'African American', 'United States of America', 'B-', 176.4, 80.7, '115/75', 23.2, '2024-07-30', '12345'),
(8123476, 'Amelia', 'Johnson', '1996-08-05', '700-234-5671', 'amelia.johnson@bu.edu', 'Female', 'Single', 'Caucasian', 'United States of America', 'B+', 176.4, 81.9, '120/80', 25.7, '2024-07-30', '12345'),
(8123477, 'Daniel', 'Anderson', '2004-05-22', '700-345-6782', 'daniel.anderson@bu.edu', 'Male', 'Married', 'Hispanic', 'United States of America', 'O-', 176.4, 83.2, '118/78', 25.4, '2024-07-30', '12345'),
(8123478, 'Victoria', 'Miller', '2002-01-07', '700-456-7893', 'victoria.miller@bu.edu', 'Female', 'Single', 'Asian', 'United States of America', 'AB+', 179.7, 86.1, '122/82', 26.9, '2024-07-30', '12345'),
(8123479, 'Lucas', 'Garcia', '2001-09-23', '700-567-8904', 'lucas.garcia@bu.edu', 'Male', 'Divorced', 'African American', 'United States of America', 'AB-', 165.2, 64.6, '115/75', 23.5, '2024-07-30', '12345'),
(8123480, 'Madison', 'Martinez', '1999-06-10', '700-678-9015', 'madison.martinez@bu.edu', 'Female', 'Married', 'Caucasian', 'Mexico', 'O+', 170.9, 74.3, '120/80', 25.6, '2024-07-30', '12345'),
(8123481, 'Emma', 'Smith', '2000-08-03', '710-111-1111', 'emma.smith@bu.edu', 'Female', 'Single', 'Caucasian', 'United States of America', 'B-', 165.5, 70.2, '120/80', 25.6, '2024-07-30', '12345'),
(8123482, 'Noah', 'Johnson', '2005-02-17', '710-222-2222', 'noah.johnson@bu.edu', 'Male', 'Single', 'African American', 'United States of America', 'B+', 172.8, 67.9, '118/76', 22.0, '2024-07-30', '12345'),
(8123483, 'Olivia', 'Wilson', '1997-06-10', '710-333-3333', 'olivia.wilson@bu.edu', 'Female', 'Single', 'Hispanic', 'United States of America', 'O-', 172.8, 67.5, '122/82', 28.3, '2024-07-30', '12345'),
(8123484, 'Liam', 'Davis', '2001-12-25', '710-444-4444', 'liam.davis@bu.edu', 'Male', 'Single', 'Asian', 'United States of America', 'AB+', 175.3, 68.7, '116/78', 22.3, '2024-07-30', '12345'),
(8123485, 'Ava', 'Jones', '1998-09-08', '710-555-5555', 'ava.jones@bu.edu', 'Female', 'Single', 'Caucasian', 'United States of America', 'A+', 170.2, 71.1, '120/80', 24.5, '2024-07-30', '12345'),
(8123486, 'Mason', 'Thomas', '2003-11-20', '710-666-6666', 'mason.thomas@bu.edu', 'Male', 'Single', 'African American', 'United States of America', 'B+', 162.9, 66.5, '118/76', 24.9, '2024-07-30', '12345'),
(8123487, 'Sophia', 'Brown', '1999-07-14', '710-777-7777', 'sophia.brown@bu.edu', 'Female', 'Single', 'Hispanic', 'United States of America', 'O-', 168.4, 73.8, '122/82', 26.0, '2024-07-30', '12345'),
(8123488, 'David', 'Wilson', '1995-03-28', '710-888-8888', 'david.wilson@bu.edu', 'Male', 'Single', 'Caucasian', 'United States of America', 'B+', 173.7, 69.4, '116/78', 23.0, '2024-07-30', '12345'),
(8123489, 'Emily', 'Thomas', '2002-11-07', '710-999-9999', 'emily.thomas@bu.edu', 'Female', 'Divorced', 'Hispanic', 'United States of America', 'O-', 160.5, 74.1, '120/80', 28.9, '2024-07-30', '12345'),
(8123490, 'Ari', 'Lee', '2000-08-18', '710-123-4567', 'ari.lee@bu.edu', 'Female', 'Single', 'Asian', 'South Korea', 'A+', 178.2, 67.8, '118/76', 21.4, '2024-07-30', '12345'),
(8123491, 'Alexander', 'Johnson', '1997-06-02', '710-234-5678', 'alexander.johnson@bu.edu', 'Male', 'Married', 'African American', 'United States of America', 'AB-', 166.7, 75.3, '122/82', 27.2, '2024-07-30', '12345'),
(8123492, 'Natalie', 'Garcia', '1998-04-09', '710-345-6789', 'natalie.garcia@bu.edu', 'Female', 'Single', 'Caucasian', 'United States of America', 'O+', 171.9, 70.6, '116/78', 21.8, '2024-07-30', '12345'),
(8123493, 'Matthew', 'Harris', '2004-10-25', '710-456-7890', 'matthew.harris@bu.edu', 'Male', 'Divorced', 'Hispanic', 'United States of America', 'B+', 167.8, 76.9, '120/80', 26.9, '2024-07-30', '12345'),
(8123494, 'Olivia', 'Jackson', '2000-07-14', '710-567-8901', 'olivia.jackson@bu.edu', 'Female', 'Married', 'Asian', 'United States of America', 'A+', 163.6, 72.3, '118/76', 27.3, '2024-07-30', '12345'),
(8123495, 'William', 'Davis', '2005-01-31', '710-678-9012', 'william.davis@bu.edu', 'Male', 'Single', 'African American', 'United States of America', 'O+', 169.1, 68.9, '122/82', 24.1, '2024-07-30', '12345'),
(8123496, 'Sophia', 'Nguyen', '1999-09-05', '710-789-0123', 'sophia.nguyen@bu.edu', 'Female', 'Divorced', 'Caucasian', 'United States of America', 'B-', 174.4, 74.2, '116/78', 23.5, '2024-07-30', '12345'),
(8123497, 'Ethan', 'Wilson', '2002-05-20', '710-890-1234', 'ethan.wilson@bu.edu', 'Male', 'Single', 'Hispanic', 'United States of America', 'AB-', 161.2, 69.7, '120/80', 25.0, '2024-07-30', '12345'),
(8123498, 'Mia', 'Johnson', '1998-10-01', '710-901-2345', 'mia.johnson@bu.edu', 'Female', 'Single', 'Asian', 'United Kingdom', 'O-', 177.5, 66.3, '118/76', 20.8, '2024-07-30', '12345'),
(8123499, 'Daniel', 'Smith', '2003-07-03', '710-012-3456', 'daniel.smith@bu.edu', 'Male', 'Single', 'African American', 'United States of America', 'B+', 165.8, 73.6, '122/82', 26.7, '2024-07-30', '12345'),
(8123500, 'Ava', 'Martinez', '1995-06-15', '710-123-4560', 'ava.martinez@bu.edu', 'Female', 'Single', 'Caucasian', 'United States of America', 'A+', 170.6, 68.2, '116/78', 22.1, '2024-07-30', '12345'),
(8123501, 'Lucas', 'Anderson', '2001-04-30', '710-234-5671', 'lucas.anderson@bu.edu', 'Male', 'Single', 'Hispanic', 'United States of America', 'O-', 175.9, 76.5, '120/80', 27.9, '2024-07-30', '12345'),
(8123502, 'Madison', 'Brown', '1998-01-14', '710-345-6782', 'madison.brown@bu.edu', 'Female', 'Single', 'Asian', 'United States of America', 'AB+', 162.3, 71.9, '118/76', 27.7, '2024-07-30', '12345'),
(8123503, 'Mia', 'Johnson', '1999-09-29', '710-456-7893', 'mia.johnson@bu.edu', 'Female', 'Single', 'African American', 'United States of America', 'AB-', 168.8, 67.5, '122/82', 23.2, '2024-07-30', '12345'),
(8123504, 'Jacob', 'Martinez', '2000-08-13', '710-567-8904', 'jacob.martinez@bu.edu', 'Male', 'Single', 'Caucasian', 'United States of America', 'O+', 135.4, 32.5, '100/60', 17.8, '2024-07-30', '12345'),
(8123505, 'Sophia', 'Garcia', '2005-07-30', '710-678-9015', 'sophia.garcia@bu.edu', 'Female', 'Single', 'Hispanic', 'United States of America', 'B-', 123.8, 28.9, '95/55', 19.0, '2024-07-30', '12345'),
(8123506, 'Noah', 'Wilson', '1997-06-14', '710-789-0126', 'noah.wilson@bu.edu', 'Male', 'Single', 'Asian', 'United States of America', 'A+', 140.2, 36.4, '102/62', 18.6, '2024-07-30', '12345'),
(8123507, 'Ava', 'Davis', '1998-03-29', '710-890-1237', 'ava.davis@bu.edu', 'Female', 'Single', 'African American', 'United States of America', 'B+', 128.5, 31.7, '97/57', 18.9, '2024-07-30', '12345'),
(8705785, 'Shuaijun', 'Liu', '2001-06-01', '857-340-9534', 'shuaijun@bu.edu', 'Male', 'Single', 'Asian', 'United States of America', 'B+', 145.7, 40.2, '102/57', 20.8, '2024-07-30', '12345');


-- doctor
INSERT INTO doctor (doctor_id, first_name, last_name, specialty, office, phone, email, department_id, password) 
VALUES
(1, 'John', 'Doe', 'Emergency and Urgent Care', '330B', '700-111-1111', 'john.doe@bu.edu', 24, '12345'),
(2, 'Sarah', 'Johnson', 'General Internal Care', '100E', '700-444-4444', 'sarah.johnson@bu.edu', 29, '12345'),
(3, 'Michaela', 'Nguyen', 'Surgery', '750W', '700-777-7777', 'michaela.nguyen@bu.edu', 27, '12345'),
(4, 'Sophia', 'Nguyen', 'Surgery', '320C', '700-456-7890', 'sophia.nguyen@bu.edu', 17, '12345'),
(5, 'Benjamin', 'Wilson', 'General Pediatrics', '345P', '700-567-8901', 'benjamin.wilson@bu.edu', 2, '12345'),
(6, 'Jackson', 'Davis', 'General Practice', '404Y', '700-123-4560', 'jackson.davis@bu.edu', 30, '12345'),
(7, 'Amelia', 'Johnson', 'Emergency and Urgent Care', '315B', '700-234-5671', 'amelia.johnson@bu.edu', 17, '12345'),
(8, 'Daniel', 'Anderson', 'General Internal Care', '350G', '700-345-6782', 'daniel.anderson@bu.edu', 5, '12345'),
(9, 'Victoria', 'Miller', 'Colorectal Surgery', '200Y', '700-456-7893', 'victoria.miller@bu.edu', 28, '12345'),
(10, 'Lucas', 'Garcia', 'General Internal Care', '500G', '700-567-8904', 'lucas.garcia@bu.edu', 22, '12345'),
(11, 'Jennifer', 'Jones', 'ACL and MCL Reconstruction', '125Z', '400-111-1111', 'jennifer.jones@bu.edu', 18, '12345'),
(12, 'Robert', 'Davis', 'ACL and MCL Reconstruction', '127W', '400-222-2222', 'robert.davis@bu.edu', 5, '12345'),
(13, 'Lisa', 'Miller', 'Brain Blunt Trauma', '293F', '400-333-3333', 'lisa.miller@bu.edu', 20, '12345'),
(14, 'Emily', 'Taylor', 'Esophagus Surgery', '840Q', '400-555-5555', 'emily.taylor@bu.edu', 27, '12345'),
(15, 'Jason', 'Anderson', 'Emergency and Urgent Care', '330B', '400-666-6666', 'jason.anderson@bu.edu', 7, '12345'),
(16, 'Olivia', 'Thompson', 'General Internal Care', '100E', '400-777-7777', 'olivia.thompson@bu.edu', 9, '12345'),
(17, 'Michael', 'James', 'Surgery', '750W', '400-888-8888', 'michael.james@bu.edu', 1, '12345'),
(18, 'Sophia', 'Baker', 'Surgery', '320C', '400-999-9999', 'sophia.baker@bu.edu', 13, '12345'),
(19, 'Ethan', 'Green', 'General Pediatrics', '345P', '400-123-4560', 'ethan.green@bu.edu', 21, '12345'),
(20, 'Ava', 'Hill', 'General Practice', '404Y', '400-234-5671', 'ava.hill@bu.edu', 24, '12345');


-- administrator
INSERT INTO administrator (administrator_id, first_name, last_name, phone, email, password) 
VALUES
(1, 'Shuaijun', 'Liu', '857-340-9534', 'shuaijun@bu.edu', '12345');


-- patient_vitals
INSERT INTO patient_vitals (patient_vitals_id, height, weight, blood_pressure, bmi) 
VALUES
(1, 170.5, 75.2, '120/80', 24.8),
(2, 165.0, 68.9, '118/78', 25.1),
(3, 165.0, 70.5, '122/82', 26.9),
(4, 165.0, 65.1, '115/75', 23.6),
(5, 175.1, 70.7, '120/80', 22.9),
(6, 169.4, 73.8, '118/78', 25.8),
(7, 181.6, 88.4, '122/82', 26.8),
(8, 172.7, 67.2, '115/75', 23.8),
(9, 172.7, 67.5, '120/80', 26.3),
(10, 164.2, 65.8, '118/78', 24.4),
(11, 177.3, 83.2, '122/82', 26.5),
(12, 160.7, 60.4, '115/75', 23.4),
(13, 173.9, 76.1, '120/80', 25.1),
(14, 168.6, 71.5, '118/78', 25.2),
(15, 180.2, 87.9, '122/82', 26.7),
(16, 166.5, 66.7, '115/75', 24.1),
(17, 171.8, 77.8, '120/80', 26.4),
(18, 163.5, 63.9, '118/78', 23.8),
(19, 176.4, 82.6, '122/82', 26.3),
(20, 176.4, 80.7, '115/75', 23.2),
(21, 176.4, 81.9, '120/80', 25.7),
(22, 176.4, 83.2, '118/78', 25.4),
(23, 179.7, 86.1, '122/82', 26.9),
(24, 165.2, 64.6, '115/75', 23.5),
(25, 170.9, 74.3, '120/80', 25.6),
(26, 165.5, 70.2, '120/80', 25.6),
(27, 172.8, 67.9, '118/76', 22.0),
(28, 172.8, 67.5, '122/82', 28.3),
(29, 175.3, 68.7, '116/78', 22.3),
(30, 170.2, 71.1, '120/80', 24.5),
(31, 162.9, 66.5, '118/76', 24.9),
(32, 168.4, 73.8, '122/82', 26.0),
(33, 173.7, 69.4, '116/78', 23.0),
(34, 160.5, 74.1, '120/80', 28.9),
(35, 178.2, 67.8, '118/76', 21.4),
(36, 166.7, 75.3, '122/82', 27.2),
(37, 171.9, 70.6, '116/78', 21.8),
(38, 167.8, 76.9, '120/80', 26.9),
(39, 163.6, 72.3, '118/76', 27.3),
(40, 169.1, 68.9, '122/82', 24.1),
(41, 174.4, 74.2, '116/78', 23.5),
(42, 161.2, 69.7, '120/80', 25.0),
(43, 177.5, 66.3, '118/76', 20.8),
(44, 165.8, 73.6, '122/82', 26.7),
(45, 170.6, 68.2, '116/78', 22.1),
(46, 175.9, 76.5, '120/80', 27.9),
(47, 162.3, 71.9, '118/76', 27.7),
(48, 168.8, 67.5, '122/82', 23.2),
(49, 135.4, 32.5, '100/60', 17.8),
(50, 123.8, 28.9, '95/55', 19.0),
(51, 140.2, 36.4, '102/62', 18.6),
(52, 128.5, 31.7, '97/57', 18.9),
(53, 145.7, 40.2, '102/57', 20.8);


-- medicine
INSERT INTO medicine (medicine_id, diagnosis_code, name, active_ingredient, price, description, dose)
VALUES
(1, 1, 'Cold-X', 'Acetaminophen, Phenylephrine', 9.99, 'Relieves common cold symptoms', 'Take 2 tablets every 4-6 hours'),
(2, 1, 'ColdCare', 'Dextromethorphan, Guaifenesin', 7.99, 'Relieves cough and congestion', 'Take 1-2 tablespoons every 4 hours'),
(3, 2, 'FluGuard', 'Oseltamivir', 14.99, 'Antiviral medication for influenza', 'Take 1 capsule twice daily'),
(4, 2, 'ReliefFlu', 'Ibuprofen, Phenylephrine', 8.99, 'Relieves flu symptoms', 'Take 2 tablets every 6 hours'),
(5, 3, 'BreatheWell', 'Guaifenesin, Dextromethorphan', 10.99, 'Relieves bronchitis symptoms', 'Take 1-2 tablets every 4 hours'),
(6, 3, 'BronchoRelief', 'Acetaminophen, Codeine', 12.99, 'Relieves cough and chest congestion', 'Take 1-2 tablets every 6 hours'),
(7, 4, 'PneumoCure', 'Levofloxacin', 19.99, 'Antibiotic for pneumonia treatment', 'Take 1 tablet once daily'),
(8, 4, 'PneumoRelief', 'Acetaminophen, Ibuprofen', 9.99, 'Relieves symptoms associated with pneumonia', 'Take 2 tablets every 6 hours'),
(9, 5, 'GastroGuard', 'Loperamide', 7.99, 'Anti-diarrheal medication', 'Take 2 capsules after each loose stool'),
(10, 5, 'GastroRelief', 'Bismuth Subsalicylate', 8.99, 'Relieves stomach discomfort and nausea', 'Chew or dissolve 2 tablets every 30 minutes'),
(11, 6, 'UTIShield', 'Nitrofurantoin', 14.99, 'Antibiotic for urinary tract infection', 'Take 1 capsule twice daily'),
(12, 6, 'UTIRelief', 'Phenazopyridine', 9.99, 'Relieves urinary tract infection symptoms', 'Take 2 tablets three times daily'),
(13, 7, 'StrepAway', 'Penicillin V', 9.99, 'Antibiotic for strep throat', 'Take 1 tablet four times daily'),
(14, 7, 'ThroatRelief', 'Benzocaine, Menthol', 6.99, 'Provides relief from strep throat symptoms', 'Apply to the affected area every 2-4 hours'),
(15, 8, 'SinusClear', 'Pseudoephedrine', 8.99, 'Relieves nasal congestion due to sinusitis', 'Take 1 tablet every 4-6 hours'),
(16, 8, 'SinusRelief', 'Ibuprofen, Acetaminophen', 9.99, 'Relieves sinusitis symptoms', 'Take 2 tablets every 6 hours'),
(17, 9, 'AllerGuard', 'Cetirizine', 7.99, 'Antihistamine for allergy relief', 'Take 1 tablet once daily'),
(18, 9, 'AllerRelief', 'Loratadine', 6.99, 'Provides relief from allergy symptoms', 'Take 1 tablet once daily'),
(19, 10, 'MigraineShield', 'Sumatriptan', 12.99, 'Relieves migraine headaches', 'Take 1 tablet at the onset of migraine'),
(20, 10, 'MigraineRelief', 'Ibuprofen, Caffeine', 8.99, 'Provides relief from migraine symptoms', 'Take 2 tablets at the onset of migraine'),
(21, 11, 'AsthmaGuard', 'Albuterol', 15.99, 'Bronchodilator for asthma management', 'Use inhaler as directed by physician'),
(22, 11, 'AsthmaRelief', 'Beclomethasone', 17.99, 'Anti-inflammatory medication for asthma', 'Use inhaler as directed by physician'),
(23, 12, 'DiaCare', 'Metformin', 9.99, 'Antidiabetic medication', 'Take 1 tablet twice daily with meals'),
(24, 12, 'DiaRelief', 'Insulin', 24.99, 'Injectable medication for diabetes management', 'Use as directed by physician'),
(25, 13, 'HypertensGuard', 'Lisinopril', 12.99, 'Antihypertensive medication', 'Take 1 tablet once daily'),
(26, 13, 'HypertensRelief', 'Amlodipine', 10.99, 'Lowers blood pressure', 'Take 1 tablet once daily'),
(27, 14, 'LipidGuard', 'Atorvastatin', 14.99, 'Lowers cholesterol levels', 'Take 1 tablet once daily'),
(28, 14, 'LipidRelief', 'Simvastatin', 11.99, 'Reduces cholesterol and triglyceride levels', 'Take 1 tablet once daily'),
(29, 15, 'MoodStabil', 'Sertraline', 13.99, 'Antidepressant medication', 'Take 1 tablet once daily'),
(30, 15, 'DepressRelief', 'Fluoxetine', 11.99, 'Relieves symptoms of depression', 'Take 1 tablet once daily'),
(31, 16, 'Anxiolytic', 'Alprazolam', 15.99, 'Anti-anxiety medication', 'Take 1 tablet as needed'),
(32, 16, 'AnxietyRelief', 'Lorazepam', 12.99, 'Relieves symptoms of anxiety', 'Take 1 tablet as needed'),
(33, 17, 'ArthriGuard', 'Ibuprofen', 7.99, 'Nonsteroidal anti-inflammatory drug for arthritis', 'Take 1 tablet every 4-6 hours'),
(34, 17, 'ArthriRelief', 'Celecoxib', 19.99, 'Relieves arthritis pain and inflammation', 'Take 1 capsule twice daily'),
(35, 18, 'PainAway', 'Acetaminophen', 8.99, 'Relieves mild to moderate back pain', 'Take 1-2 tablets every 4-6 hours'),
(36, 18, 'BackRelief', 'Naproxen', 9.99, 'Reduces back pain and inflammation', 'Take 1 tablet twice daily with food'),
(37, 20, 'AcneClear', 'Benzoyl Peroxide', 9.99, 'Topical treatment for acne', 'Apply to affected areas once daily'),
(38, 20, 'AcneRelief', 'Salicylic Acid', 7.99, 'Reduces acne breakouts and inflammation', 'Apply to affected areas twice daily'),
(39, 21, 'Antidiarrheal', 'Loperamide', 6.99, 'Relieves symptoms of diarrhea caused by food poisoning', 'Take 2 tablets after the first loose stool, then 1 tablet after each subsequent loose stool'),
(40, 21, 'ElectrolyteSolution', 'Oral Rehydration Salts', 5.99, 'Replenishes fluids and electrolytes lost due to food poisoning', 'Mix contents of one packet with water and consume as directed'),
(41, 23, 'GastritisRelief', 'Omeprazole', 11.99, 'Reduces stomach acid production for gastritis relief', 'Take 1 capsule once daily before a meal'),
(42, 23, 'Antacid', 'Calcium Carbonate', 6.99, 'Relieves symptoms of gastritis', 'Chew 2-4 tablets as needed'),
(43, 24, 'Antiviral', 'Oseltamivir', 19.99, 'Antiviral medication for viral infections', 'Take as directed by physician'),
(44, 24, 'ImmuneBooster', 'Vitamin C, Zinc', 9.99, 'Boosts immune system to fight viral infections', 'Take 1 tablet once daily'),
(45, 25, 'NitroRelief', 'Nitroglycerin', 16.99, 'Relieves angina symptoms', 'Take as directed by physician'),
(46, 25, 'BetaBlocker', 'Metoprolol', 12.99, 'Reduces frequency and severity of angina attacks', 'Take 1 tablet once daily'),
(47, 27, 'Epinephrine', 'Epinephrine', 49.99, 'Emergency medication for cardiac arrest', 'Administer as directed by physician'),
(48, 27, 'Amiodarone', 'Amiodarone', 29.99, 'Antiarrhythmic medication for cardiac arrest', 'Administer as directed by physician'),
(50, 28, 'VertigoRelief', 'Meclizine', 8.99, 'Relieves symptoms of vertigo associated with Meniere disease', 'Take 1 tablet as needed'),
(51, 28, 'Diuretic', 'Hydrochlorothiazide', 7.99, 'Reduces fluid buildup in the inner ear', 'Take 1 tablet once daily'),
(52, 29, 'IronSupplement', 'Iron', 6.99, 'Supplement for iron deficiency anemia', 'Take 1 tablet once daily'),
(53, 29, 'VitaminB12', 'Vitamin B12', 9.99, 'Supplement for vitamin B12 deficiency anemia', 'Take as directed by physician'),
(54, 30, 'EyeDrop', 'Tobramycin', 8.99, 'Antibiotic eye drops for eye infection', 'Instill 1-2 drops into the affected eye(s) every 4-6 hours'),
(55, 30, 'ArtificialTears', 'Polyethylene Glycol', 5.99, 'Lubricating eye drops for eye infection', 'Instill 1-2 drops into the affected eye(s) as needed'),
(56, 31, 'EarPainRelief', 'Benzocaine', 7.99, 'Provides temporary relief from ear pain associated with ear infection', 'Apply a small amount to the affected ear(s) as needed'),
(57, 31, 'EarDrop', 'Ciprofloxacin', 10.99, 'Antibiotic ear drops for ear infection', 'Instill 3-4 drops into the affected ear(s) twice daily');



-- prescription
INSERT INTO prescription (prescription_id, medicine_id, prescribed_at, duration, comments) 
VALUES 
(1, 19, '2024-01-21 09:00:00', '7 days', 'Take with food'),
(2, 9, '2024-02-21 09:10:00', '5 days', 'Take after meals'),
(3, 13, '2024-03-21 09:30:00', '10 days', 'Avoid alcohol'),
(4, 5, '2024-04-21 09:10:00', '3 days', 'Take with plenty of water'),
(5, 34, '2024-05-21 10:30:00', '4 days', 'Take before bedtime'),
(6, 32, '2024-06-21 10:30:00', '8 days', 'Avoid strenuous activity'),
(7, 35, '2024-07-21 11:30:00', '6 days', 'Take with milk'),
(8, 50, '2024-08-02 11:30:00', '7 days', 'Take with meals'),
(9, 41, '2024-01-26 12:30:00', '9 days', 'Avoid sunlight exposure'),
(10, 53, '2024-02-21 13:30:00', '5 days', 'Take on an empty stomach'),
(11, 20, '2024-03-21 13:30:00', '3 days', 'Take with water'),
(12, 45, '2024-04-21 14:30:00', '10 days', 'Take before meals'),
(13, 17, '2024-05-21 14:30:00', '6 days', 'Avoid caffeine'),
(14, 55, '2024-06-21 15:30:00', '4 days', 'Take with food'),
(15, 56, '2024-07-21 15:30:00', '7 days', 'Take with plenty of water'),
(16, 14, '2024-08-21 16:30:00', '9 days', 'Avoid alcohol'),
(17, 33, '2024-01-21 16:30:00', '5 days', 'Take before bedtime'),
(18, 11, '2024-02-21 17:30:00', '6 days', 'Take with meals'),
(19, 35, '2024-03-22 08:30:00', '7 days', 'Take with food'),
(20, 5, '2024-04-23 08:30:00', '5 days', 'Take after meals'),
(21, 50, '2024-05-22 09:30:00', '10 days', 'Avoid alcohol'),
(22, 28, '2024-06-12 09:30:00', '6 days', 'Take before bedtime'),
(23, 33, '2024-07-22 10:30:00', '4 days', 'Take before bedtime'),
(24, 41, '2024-08-22 10:30:00', '8 days', 'Avoid strenuous activity'),
(25, 55, '2024-01-22 11:30:00', '6 days', 'Take with milk'),
(26, 44, '2024-02-22 11:30:00', '7 days', 'Take with meals'),
(27, 42, '2024-03-22 13:30:00', '9 days', 'Avoid sunlight exposure'),
(28, 32, '2024-04-22 13:30:00', '5 days', 'Take on an empty stomach'),
(29, 14, '2024-06-20 10:00:00', '6 days', 'Take with water'),
(30, 12, '2024-06-19 09:30:00', '5 days', 'Avoid caffeine'),
(31, 1, '2024-06-22 12:00:00', '5 days', 'Take on an empty stomach'),
(32, 43, '2024-06-21 16:30:00', '5 days', 'Take on an empty stomach');


-- blood_test
INSERT INTO blood_test (blood_test_id, haemoglobin, WBC, platelets, MCV, PCV, RBC, MCH, MCHC, RDW, neutrophils, lymphocytes, monocytes, basophils, collected_at, doctor_id)
VALUES (1, 14.2, 8.9, 250, 88.5, 42.1, 4.7, 32.1, 35.8, 13.5, 70.2, 25.3, 3.1, 0.8, '2023-06-21 08:00:00', 3);
 
INSERT INTO blood_test (blood_test_id, haemoglobin, WBC, platelets, MCV, PCV, RBC, MCH, MCHC, RDW, neutrophils, lymphocytes, monocytes, basophils, collected_at, doctor_id)
VALUES (2, 13.8, 7.5, 210, 90.2, 39.8, 4.5, 30.9, 34.7, 13.9, 69.8, 26.1, 2.9, 0.7, '2023-06-21 08:30:00', 3);
 
INSERT INTO blood_test (blood_test_id, haemoglobin, WBC, platelets, MCV, PCV, RBC, MCH, MCHC, RDW, neutrophils, lymphocytes, monocytes, basophils, collected_at, doctor_id)
VALUES (3, 14.5, 9.2, 240, 89.1, 41.5, 4.8, 33.4, 36.2, 13.1, 71.3, 24.9, 3.4, 0.6, '2023-06-21 09:00:00', 3);
 
INSERT INTO blood_test (blood_test_id, haemoglobin, WBC, platelets, MCV, PCV, RBC, MCH, MCHC, RDW, neutrophils, lymphocytes, monocytes, basophils, collected_at, doctor_id)
VALUES (4, 14.1, 8.7, 255, 87.9, 42.3, 4.6, 31.6, 35.4, 14.2, 69.9, 26.7, 3.2, 0.5, '2023-06-21 09:30:00', 3);
 
INSERT INTO blood_test (blood_test_id, haemoglobin, WBC, platelets, MCV, PCV, RBC, MCH, MCHC, RDW, neutrophils, lymphocytes, monocytes, basophils, collected_at, doctor_id)
VALUES (5, 13.9, 7.9, 220, 91.7, 39.2, 4.4, 29.8, 34.1, 14.5, 70.1, 27.5, 3.1, 0.4, '2023-06-21 10:00:00', 3);
 
INSERT INTO blood_test (blood_test_id, haemoglobin, WBC, platelets, MCV, PCV, RBC, MCH, MCHC, RDW, neutrophils, lymphocytes, monocytes, basophils, collected_at, doctor_id)
VALUES (6, 14.3, 9.1, 230, 88.6, 41.9, 4.7, 32.9, 35.9, 13.3, 71.5, 25.1, 3.5, 0.6, '2023-06-21 10:30:00', 3);

INSERT INTO blood_test (blood_test_id, haemoglobin, WBC, platelets, MCV, PCV, RBC, MCH, MCHC, RDW, neutrophils, lymphocytes, monocytes, basophils, collected_at, doctor_id)
VALUES (7, 14.0, 8.5, 245, 88.1, 42.2, 4.6, 31.1, 35.3, 14.1, 70.3, 26.3, 3.3, 0.7, '2023-06-21 11:00:00', 3);
 
INSERT INTO blood_test (blood_test_id, haemoglobin, WBC, platelets, MCV, PCV, RBC, MCH, MCHC, RDW, neutrophils, lymphocytes, monocytes, basophils, collected_at, doctor_id)
VALUES (8, 13.7, 7.7, 215, 90.4, 39.6, 4.4, 30.3, 34.9, 14.3, 69.7, 26.9, 2.8, 0.6, '2023-06-21 11:30:00', 3);
 
INSERT INTO blood_test (blood_test_id, haemoglobin, WBC, platelets, MCV, PCV, RBC, MCH, MCHC, RDW, neutrophils, lymphocytes, monocytes, basophils, collected_at, doctor_id)
VALUES (9, 14.6, 9.0, 235, 89.3, 41.4, 4.8, 33.7, 36.3, 13.0, 71.7, 24.7, 3.6, 0.5, '2023-06-21 12:00:00', 3);
 
INSERT INTO blood_test (blood_test_id, haemoglobin, WBC, platelets, MCV, PCV, RBC, MCH, MCHC, RDW, neutrophils, lymphocytes, monocytes, basophils, collected_at, doctor_id)
VALUES (10, 14.1, 8.9, 255, 88.5, 42.1, 4.7, 32.1, 35.8, 13.5, 70.1, 25.9, 3.1, 0.8, '2023-06-21 13:30:00', 16);
 
INSERT INTO blood_test (blood_test_id, haemoglobin, WBC, platelets, MCV, PCV, RBC, MCH, MCHC, RDW, neutrophils, lymphocytes, monocytes, basophils, collected_at, doctor_id)
VALUES (11, 13.8, 8.2, 245, 87.9, 40.3, 4.5, 30.9, 35.6, 13.6, 69.2, 25.3, 3.0, 0.7, '2023-06-21 13:00:00', 16);
 
INSERT INTO blood_test (blood_test_id, haemoglobin, WBC, platelets, MCV, PCV, RBC, MCH, MCHC, RDW, neutrophils, lymphocytes, monocytes, basophils, collected_at, doctor_id)
VALUES (12, 14.1, 8.9, 255, 88.5, 42.1, 4.7, 32.1, 35.8, 13.5, 70.1, 25.9, 3.1, 0.8, '2023-06-21 13:30:00', 16);
 
INSERT INTO blood_test (blood_test_id, haemoglobin, WBC, platelets, MCV, PCV, RBC, MCH, MCHC, RDW, neutrophils, lymphocytes, monocytes, basophils, collected_at, doctor_id)
VALUES (13, 13.6, 7.8, 230, 90.1, 39.7, 4.4, 30.6, 34.8, 14.0, 69.5, 26.1, 2.9, 0.6, '2023-06-21 14:00:00', 16);
 
INSERT INTO blood_test (blood_test_id, haemoglobin, WBC, platelets, MCV, PCV, RBC, MCH, MCHC, RDW, neutrophils, lymphocytes, monocytes, basophils, collected_at, doctor_id)
VALUES (14, 14.3, 9.3, 240, 89.2, 41.5, 4.8, 33.5, 36.1, 13.2, 70.9, 24.7, 3.5, 0.7, '2023-06-21 14:30:00', 16);
 
INSERT INTO blood_test (blood_test_id, haemoglobin, WBC, platelets, MCV, PCV, RBC, MCH, MCHC, RDW, neutrophils, lymphocytes, monocytes, basophils, collected_at, doctor_id)
VALUES (15, 14.0, 8.6, 225, 88.3, 42.3, 4.6, 31.2, 35.4, 14.3, 69.8, 26.5, 3.2, 0.5, '2023-06-21 15:00:00', 16);
 
INSERT INTO blood_test (blood_test_id, haemoglobin, WBC, platelets, MCV, PCV, RBC, MCH, MCHC, RDW, neutrophils, lymphocytes, monocytes, basophils, collected_at, doctor_id)
VALUES (16, 13.7, 7.9, 220, 90.5, 39.3, 4.4, 29.9, 34.2, 14.6, 70.0, 27.3, 3.1, 0.4, '2023-06-21 15:30:00', 6);
 
INSERT INTO blood_test (blood_test_id, haemoglobin, WBC, platelets, MCV, PCV, RBC, MCH, MCHC, RDW, neutrophils, lymphocytes, monocytes, basophils, collected_at, doctor_id)
VALUES (17, 14.4, 9.2, 235, 89.4, 41.4, 4.8, 33.8, 36.2, 13.1, 71.2, 24.9, 3.6, 0.5, '2023-06-21 16:00:00', 6);
 
INSERT INTO blood_test (blood_test_id, haemoglobin, WBC, platelets, MCV, PCV, RBC, MCH, MCHC, RDW, neutrophils, lymphocytes, monocytes, basophils, collected_at, doctor_id)
VALUES (18, 14.2, 8.7, 250, 88.7, 42.0, 4.7, 32.2, 35.7, 13.4, 70.1, 25.7, 3.3, 0.7, '2023-06-21 16:30:00', 6);
 
INSERT INTO blood_test (blood_test_id, haemoglobin, WBC, platelets, MCV, PCV, RBC, MCH, MCHC, RDW, neutrophils, lymphocytes, monocytes, basophils, collected_at, doctor_id)
VALUES (19, 13.9, 8.1, 240, 87.9, 40.2, 4.5, 30.8, 35.5, 13.5, 69.3, 25.5, 3.0, 0.8, '2023-06-21 17:00:00', 6);

INSERT INTO blood_test (blood_test_id, haemoglobin, WBC, platelets, MCV, PCV, RBC, MCH, MCHC, RDW, neutrophils, lymphocytes, monocytes, basophils, collected_at, doctor_id)
VALUES (20, 13.9, 8.1, 240, 87.9, 40.2, 4.5, 30.8, 35.5, 13.5, 69.3, 25.5, 3.0, 0.8, '2023-06-21 17:00:00', 6);
 
INSERT INTO blood_test (blood_test_id, haemoglobin, WBC, platelets, MCV, PCV, RBC, MCH, MCHC, RDW, neutrophils, lymphocytes, monocytes, basophils, collected_at, doctor_id)
VALUES (21, 14.3, 8.9, 230, 88.6, 41.9, 4.7, 32.9, 35.9, 13.3, 71.5, 25.1, 3.5, 0.6, '2023-06-22 08:00:00', 7);
 
INSERT INTO blood_test (blood_test_id, haemoglobin, WBC, platelets, MCV, PCV, RBC, MCH, MCHC, RDW, neutrophils, lymphocytes, monocytes, basophils, collected_at, doctor_id)
VALUES (22, 13.9, 8.5, 245, 88.1, 42.2, 4.6, 31.1, 35.3, 14.1, 70.3, 26.3, 3.3, 0.7, '2023-06-22 08:30:00', 7);
 
INSERT INTO blood_test (blood_test_id, haemoglobin, WBC, platelets, MCV, PCV, RBC, MCH, MCHC, RDW, neutrophils, lymphocytes, monocytes, basophils, collected_at, doctor_id)
VALUES (23, 13.6, 7.7, 215, 90.4, 39.6, 4.4, 30.3, 34.9, 14.3, 69.7, 26.9, 2.8, 0.6, '2023-06-22 09:00:00', 7);
 
INSERT INTO blood_test (blood_test_id, haemoglobin, WBC, platelets, MCV, PCV, RBC, MCH, MCHC, RDW, neutrophils, lymphocytes, monocytes, basophils, collected_at, doctor_id)
VALUES (24, 14.1, 9.0, 235, 89.3, 41.4, 4.8, 33.7, 36.3, 13.0, 71.7, 24.7, 3.6, 0.5, '2023-06-22 09:30:00', 7);
 
INSERT INTO blood_test (blood_test_id, haemoglobin, WBC, platelets, MCV, PCV, RBC, MCH, MCHC, RDW, neutrophils, lymphocytes, monocytes, basophils, collected_at, doctor_id)
VALUES (25, 14.2, 8.8, 260, 88.7, 42.0, 4.7, 32.2, 35.7, 13.4, 70.0, 25.5, 3.4, 0.7, '2023-06-22 10:00:00', 7);
 
INSERT INTO blood_test (blood_test_id, haemoglobin, WBC, platelets, MCV, PCV, RBC, MCH, MCHC, RDW, neutrophils, lymphocytes, monocytes, basophils, collected_at, doctor_id)
VALUES (26, 16.5, 8.2, 250, 88.4, 41.6, 4.7, 32.4, 35.6, 13.2, 70.3, 25.7, 3.2, 0.6, '2023-06-22 10:30:00', 15);
 
INSERT INTO blood_test (blood_test_id, haemoglobin, WBC, platelets, MCV, PCV, RBC, MCH, MCHC, RDW, neutrophils, lymphocytes, monocytes, basophils, collected_at, doctor_id)
VALUES (27, 13.8, 8.6, 240, 88.2, 42.1, 4.6, 31.7, 35.2, 13.5, 69.8, 26.1, 3.1, 0.7, '2023-06-22 11:00:00', 15);
 
INSERT INTO blood_test (blood_test_id, haemoglobin, WBC, platelets, MCV, PCV, RBC, MCH, MCHC, RDW, neutrophils, lymphocytes, monocytes, basophils, collected_at, doctor_id)
VALUES (28, 14.2, 8.3, 230, 90.1, 39.9, 4.4, 30.8, 34.6, 14.0, 69.5, 26.3, 2.9, 0.6, '2023-06-22 11:30:00', 15);
 
INSERT INTO blood_test (blood_test_id, haemoglobin, WBC, platelets, MCV, PCV, RBC, MCH, MCHC, RDW, neutrophils, lymphocytes, monocytes, basophils, collected_at, doctor_id)
VALUES (29, 14.0, 8.5, 245, 88.7, 42.3, 4.7, 31.2, 35.4, 13.8, 70.0, 26.0, 3.0, 0.6, '2023-06-22 12:00:00', 15);
 
INSERT INTO blood_test (blood_test_id, haemoglobin, WBC, platelets, MCV, PCV, RBC, MCH, MCHC, RDW, neutrophils, lymphocytes, monocytes, basophils, collected_at, doctor_id)
VALUES (30, 13.9, 6.7, 240, 89.4, 41.9, 4.8, 33.3, 36.1, 13.3, 70.5, 25.9, 3.2, 0.7, '2023-06-22 12:30:00', 15);



-- urinalysis
INSERT INTO urinalysis (urinalysis_id, pH, specific_gravity, glucose, protein, bilirubin, urobilinogen, blood, ketone, nitrite, leukocytes, ascorbic_acid, clarity, color, collected_at, doctor_id)
VALUES (1, 6.0, 1.020, 0.5, 0.1, 0.0, 0.2, 0.1, 0.0, 0.0, 1.0, 0.0, 'clear', 'light yellow', '2023-06-21 08:05:00', 17);

INSERT INTO urinalysis (urinalysis_id, pH, specific_gravity, glucose, protein, bilirubin, urobilinogen, blood, ketone, nitrite, leukocytes, ascorbic_acid, clarity, color, collected_at, doctor_id)
VALUES (2, 5.5, 1.015, 0.2, 0.0, 0.0, 0.1, 0.0, 0.0, 0.0, 0.5, 0.0, 'clear', 'light yellow', '2023-06-21 08:35:00', 17);

INSERT INTO urinalysis (urinalysis_id, pH, specific_gravity, glucose, protein, bilirubin, urobilinogen, blood, ketone, nitrite, leukocytes, ascorbic_acid, clarity, color, collected_at, doctor_id)
VALUES (3, 6.5, 1.025, 0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.0, 'slightly cloudy', 'pale yellow', '2023-06-21 09:05:00', 17);

INSERT INTO urinalysis (urinalysis_id, pH, specific_gravity, glucose, protein, bilirubin, urobilinogen, blood, ketone, nitrite, leukocytes, ascorbic_acid, clarity, color, collected_at, doctor_id)
VALUES (4, 6.0, 1.020, 0.3, 0.1, 0.0, 0.1, 0.1, 0.0, 0.0, 0.8, 0.0, 'clear', 'light yellow', '2023-06-21 09:35:00', 17);

INSERT INTO urinalysis (urinalysis_id, pH, specific_gravity, glucose, protein, bilirubin, urobilinogen, blood, ketone, nitrite, leukocytes, ascorbic_acid, clarity, color, collected_at, doctor_id)
VALUES (5, 6.5, 1.018, 0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.0, 'clear', 'pale yellow', '2023-06-21 10:05:00', 17);

INSERT INTO urinalysis (urinalysis_id, pH, specific_gravity, glucose, protein, bilirubin, urobilinogen, blood, ketone, nitrite, leukocytes, ascorbic_acid, clarity, color, collected_at, doctor_id)
VALUES (6, 6.2, 1.022, 0.2, 0.0, 0.0, 0.1, 0.0, 0.0, 0.0, 0.4, 0.0, 'slightly cloudy', 'light yellow', '2023-06-21 10:35:00', 17);

INSERT INTO urinalysis (urinalysis_id, pH, specific_gravity, glucose, protein, bilirubin, urobilinogen, blood, ketone, nitrite, leukocytes, ascorbic_acid, clarity, color, collected_at, doctor_id)
VALUES (7, 6.0, 1.020, 0.3, 0.1, 0.0, 0.1, 0.1, 0.0, 0.0, 0.7, 0.0, 'clear', 'light yellow', '2023-06-21 11:05:00', 17);

INSERT INTO urinalysis (urinalysis_id, pH, specific_gravity, glucose, protein, bilirubin, urobilinogen, blood, ketone, nitrite, leukocytes, ascorbic_acid, clarity, color, collected_at, doctor_id)
VALUES (8, 5.5, 1.015, 0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.0, 'clear', 'light yellow', '2023-06-21 11:35:00', 17);

INSERT INTO urinalysis (urinalysis_id, pH, specific_gravity, glucose, protein, bilirubin, urobilinogen, blood, ketone, nitrite, leukocytes, ascorbic_acid, clarity, color, collected_at, doctor_id)
VALUES (9, 6.5, 1.025, 0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.0, 'slightly cloudy', 'pale yellow', '2023-06-21 12:05:00', 17);

INSERT INTO urinalysis (urinalysis_id, pH, specific_gravity, glucose, protein, bilirubin, urobilinogen, blood, ketone, nitrite, leukocytes, ascorbic_acid, clarity, color, collected_at, doctor_id)
VALUES (10, 6.5, 1.025, 0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.0, 'slightly cloudy', 'pale yellow', '2023-06-21 12:05:00', 17);

INSERT INTO urinalysis (urinalysis_id, pH, specific_gravity, glucose, protein, bilirubin, urobilinogen, blood, ketone, nitrite, leukocytes, ascorbic_acid, clarity, color, collected_at, doctor_id)
VALUES (11, 6.5, 1.022, 0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.0, 'clear', 'pale yellow', '2023-06-21 13:05:00', 17);

INSERT INTO urinalysis (urinalysis_id, pH, specific_gravity, glucose, protein, bilirubin, urobilinogen, blood, ketone, nitrite, leukocytes, ascorbic_acid, clarity, color, collected_at, doctor_id)
VALUES (12, 6.2, 1.020, 0.2, 0.1, 0.0, 0.1, 0.1, 0.0, 0.0, 0.5, 0.0, 'slightly cloudy', 'light yellow', '2023-06-21 13:35:00', 17);

INSERT INTO urinalysis (urinalysis_id, pH, specific_gravity, glucose, protein, bilirubin, urobilinogen, blood, ketone, nitrite, leukocytes, ascorbic_acid, clarity, color, collected_at, doctor_id)
VALUES (13, 6.0, 1.020, 0.3, 0.1, 0.0, 0.1, 0.1, 0.0, 0.0, 0.8, 0.0, 'clear', 'light yellow', '2023-06-21 14:05:00', 17);

INSERT INTO urinalysis (urinalysis_id, pH, specific_gravity, glucose, protein, bilirubin, urobilinogen, blood, ketone, nitrite, leukocytes, ascorbic_acid, clarity, color, collected_at, doctor_id)
VALUES (14, 5.5, 1.015, 0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.0, 'clear', 'light yellow', '2023-06-21 14:35:00', 17);

INSERT INTO urinalysis (urinalysis_id, pH, specific_gravity, glucose, protein, bilirubin, urobilinogen, blood, ketone, nitrite, leukocytes, ascorbic_acid, clarity, color, collected_at, doctor_id)
VALUES (15, 6.5, 1.025, 0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.0, 'slightly cloudy', 'pale yellow', '2023-06-21 15:05:00', 17);

INSERT INTO urinalysis (urinalysis_id, pH, specific_gravity, glucose, protein, bilirubin, urobilinogen, blood, ketone, nitrite, leukocytes, ascorbic_acid, clarity, color, collected_at, doctor_id)
VALUES (16, 6.0, 1.020, 0.2, 0.1, 0.0, 0.1, 0.1, 0.0, 0.0, 0.6, 0.0, 'clear', 'light yellow', '2023-06-21 15:35:00', 17);

INSERT INTO urinalysis (urinalysis_id, pH, specific_gravity, glucose, protein, bilirubin, urobilinogen, blood, ketone, nitrite, leukocytes, ascorbic_acid, clarity, color, collected_at, doctor_id)
VALUES (17, 6.5, 1.022, 0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.0, 'clear', 'pale yellow', '2023-06-21 16:05:00', 17);

INSERT INTO urinalysis (urinalysis_id, pH, specific_gravity, glucose, protein, bilirubin, urobilinogen, blood, ketone, nitrite, leukocytes, ascorbic_acid, clarity, color, collected_at, doctor_id)
VALUES (18, 6.2, 1.020, 0.2, 0.1, 0.0, 0.1, 0.1, 0.0, 0.0, 0.5, 0.0, 'slightly cloudy', 'light yellow', '2023-06-21 16:35:00', 17);

INSERT INTO urinalysis (urinalysis_id, pH, specific_gravity, glucose, protein, bilirubin, urobilinogen, blood, ketone, nitrite, leukocytes, ascorbic_acid, clarity, color, collected_at, doctor_id)
VALUES (19, 6.0, 1.020, 0.3, 0.1, 0.0, 0.1, 0.1, 0.0, 0.0, 0.8, 0.0, 'clear', 'light yellow', '2023-06-21 17:05:00', 17);

INSERT INTO urinalysis (urinalysis_id, pH, specific_gravity, glucose, protein, bilirubin, urobilinogen, blood, ketone, nitrite, leukocytes, ascorbic_acid, clarity, color, collected_at, doctor_id)
VALUES (20, 6.0, 1.020, 0.3, 0.1, 0.0, 0.1, 0.1, 0.0, 0.0, 0.8, 0.0, 'clear', 'light yellow', '2023-06-21 17:05:00', 17);

INSERT INTO urinalysis (urinalysis_id, pH, specific_gravity, glucose, protein, bilirubin, urobilinogen, blood, ketone, nitrite, leukocytes, ascorbic_acid, clarity, color, collected_at, doctor_id)
VALUES (21, 6.2, 1.022, 0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.0, 'clear', 'pale yellow', '2023-06-22 08:05:00', 4);

INSERT INTO urinalysis (urinalysis_id, pH, specific_gravity, glucose, protein, bilirubin, urobilinogen, blood, ketone, nitrite, leukocytes, ascorbic_acid, clarity, color, collected_at, doctor_id)
VALUES (22, 6.0, 1.020, 0.2, 0.1, 0.0, 0.1, 0.1, 0.0, 0.0, 0.5, 0.0, 'slightly cloudy', 'light yellow', '2023-06-22 08:35:00', 4);

INSERT INTO urinalysis (urinalysis_id, pH, specific_gravity, glucose, protein, bilirubin, urobilinogen, blood, ketone, nitrite, leukocytes, ascorbic_acid, clarity, color, collected_at, doctor_id)
VALUES (23, 5.5, 1.015, 0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.0, 'clear', 'light yellow', '2023-06-22 09:05:00', 14);

INSERT INTO urinalysis (urinalysis_id, pH, specific_gravity, glucose, protein, bilirubin, urobilinogen, blood, ketone, nitrite, leukocytes, ascorbic_acid, clarity, color, collected_at, doctor_id)
VALUES (24, 6.5, 1.025, 0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.0, 'slightly cloudy', 'pale yellow', '2023-06-22 09:35:00', 14);

INSERT INTO urinalysis (urinalysis_id, pH, specific_gravity, glucose, protein, bilirubin, urobilinogen, blood, ketone, nitrite, leukocytes, ascorbic_acid, clarity, color, collected_at, doctor_id)
VALUES (25, 6.0, 1.020, 0.2, 0.1, 0.0, 0.1, 0.1, 0.0, 0.0, 0.6, 0.0, 'clear', 'light yellow', '2023-06-22 10:05:00', 14);

INSERT INTO urinalysis (urinalysis_id, pH, specific_gravity, glucose, protein, bilirubin, urobilinogen, blood, ketone, nitrite, leukocytes, ascorbic_acid, clarity, color, collected_at, doctor_id)
VALUES (26, 6.2, 1.022, 0.5, 0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.0, 'clear', 'pale yellow', '2023-06-22 10:35:00', 20);

INSERT INTO urinalysis (urinalysis_id, pH, specific_gravity, glucose, protein, bilirubin, urobilinogen, blood, ketone, nitrite, leukocytes, ascorbic_acid, clarity, color, collected_at, doctor_id)
VALUES (27, 6.0, 1.020, 0.2, 0.1, 0.0, 0.1, 0.1, 0.0, 0.0, 0.5, 0.0, 'slightly cloudy', 'light yellow', '2023-06-22 11:05:00', 20);

INSERT INTO urinalysis (urinalysis_id, pH, specific_gravity, glucose, protein, bilirubin, urobilinogen, blood, ketone, nitrite, leukocytes, ascorbic_acid, clarity, color, collected_at, doctor_id)
VALUES (28, 6.5, 1.025, 0.1, 0.5, 0.0, 0.0, 0.0, 0.0, 0.0, 0.1, 0.0, 'slightly cloudy', 'pale yellow', '2023-06-22 11:35:00', 20);

INSERT INTO urinalysis (urinalysis_id, pH, specific_gravity, glucose, protein, bilirubin, urobilinogen, blood, ketone, nitrite, leukocytes, ascorbic_acid, clarity, color, collected_at, doctor_id)
VALUES (29, 6.0, 1.020, 0.1, 0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.3, 0.0, 'clear', 'light yellow', '2023-06-22 12:05:00', 20);

INSERT INTO urinalysis (urinalysis_id, pH, specific_gravity, glucose, protein, bilirubin, urobilinogen, blood, ketone, nitrite, leukocytes, ascorbic_acid, clarity, color, collected_at, doctor_id)
VALUES (30, 6.2, 1.022, 0.1, 0.1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.2, 0.0, 'clear', 'pale yellow', '2023-06-22 12:35:00', 20);


-- lab
INSERT INTO lab (lab_id, blood_test_id, urinalysis_id) 
VALUES
(100, 1, 1),
(101, 2, 2),
(102, 3, 3),
(103, 4, 4),
(104, 5, 5),
(105, 6, 6),
(106, 7, 7),
(107, 8, 8),
(108, 9, 9),
(109, 10, 10),
(110, 11, 11),
(111, 12, 12),
(112, 13, 13),
(113, 14, 14),
(114, 15, 15),
(115, 16, 16),
(116, 17, 17),
(117, 18, 18),
(118, 19, 19),
(119, 20, 20),
(120, 21, 21),
(121, 22, 22),
(122, 23, 23),
(123, 24, 24),
(124, 25, 25),
(125, 26, 26),
(126, 27, 27),
(127, 28, 28),
(128, 29, 29),
(129, 30, 30);


-- appointment
INSERT INTO appointment (appointment_id, appointment_type_id, created_at, scheduled_for, patient_concern, patient_vitals_id, student_id, doctor_id, lab_id, appointment_status_id)
VALUES (1, 1, '2024-01-20 09:00:00', '2024-01-21 08:00:00', 'The patient is experiencing a severe headache.', 1, 8123489, 1, 100, 4);

INSERT INTO appointment (appointment_id, appointment_type_id, created_at, scheduled_for, patient_concern, patient_vitals_id, student_id, doctor_id, lab_id, appointment_status_id)
VALUES (2, 1, '2024-02-20 09:15:00', '2024-02-21 08:00:00', 'The patient is experiencing stomachache and nausea.', 2, 8123490, 7, 101, 4);

INSERT INTO appointment (appointment_id, appointment_type_id, created_at, scheduled_for, patient_concern, patient_vitals_id, student_id, doctor_id, lab_id, appointment_status_id)
VALUES (3, 1, '2024-03-20 09:30:00', '2024-03-21 09:00:00', 'The patient has a high fever and sore throat.', 3, 8123491, 7, 102, 4);

INSERT INTO appointment (appointment_id, appointment_type_id, created_at, scheduled_for, patient_concern, patient_vitals_id, student_id, doctor_id, lab_id, appointment_status_id)
VALUES (4, 1, '2024-04-20 09:45:00', '2024-04-21 09:00:00', 'The patient has a persistent cough and difficulty breathing.', 4, 8123492, 7, 103, 4);

INSERT INTO appointment (appointment_id, appointment_type_id, created_at, scheduled_for, patient_concern, patient_vitals_id, student_id, doctor_id, lab_id, appointment_status_id)
VALUES (5, 1, '2024-05-20 10:00:00', '2024-05-21 10:00:00', 'The patient is experiencing joint pain and stiffness.', 5, 8123493, 1, 104, 4);

INSERT INTO appointment (appointment_id, appointment_type_id, created_at, scheduled_for, patient_concern, patient_vitals_id, student_id, doctor_id, lab_id, appointment_status_id)
VALUES (6, 1, '2024-06-20 10:15:00', '2024-06-21 10:00:00', 'The patient has difficulty sleeping and feels anxious.', 6, 8123494, 7, 105, 4);

INSERT INTO appointment (appointment_id, appointment_type_id, created_at, scheduled_for, patient_concern, patient_vitals_id, student_id, doctor_id, lab_id, appointment_status_id)
VALUES (7, 1, '2024-07-20 10:30:00', '2024-07-21 11:00:00', 'The patient has persistent back pain and muscle spasms.', 7, 8123495, 1, 106, 4);

INSERT INTO appointment (appointment_id, appointment_type_id, created_at, scheduled_for, patient_concern, patient_vitals_id, student_id, doctor_id, lab_id, appointment_status_id)
VALUES (8, 1, '2024-08-02 10:45:00', '2024-08-02 11:00:00', 'The patient is experiencing dizziness and lightheadedness.', 8, 8123496, 1, 107, 4);

INSERT INTO appointment (appointment_id, appointment_type_id, created_at, scheduled_for, patient_concern, patient_vitals_id, student_id, doctor_id, lab_id, appointment_status_id)
VALUES (9, 1, '2024-01-25 11:00:00', '2024-01-26 12:00:00', 'The patient has digestive problems and frequent heartburn.', 9, 8123497, 1, 108, 4);

INSERT INTO appointment (appointment_id, appointment_type_id, created_at, scheduled_for, patient_concern, patient_vitals_id, student_id, doctor_id, lab_id, appointment_status_id)
VALUES (10, 1, '2024-02-20 11:15:00', '2024-02-21 13:00:00', 'The patient is experiencing fatigue and lack of energy.', 10, 8123498, 7, 109, 4);

INSERT INTO appointment (appointment_id, appointment_type_id, created_at, scheduled_for, patient_concern, patient_vitals_id, student_id, doctor_id, lab_id, appointment_status_id)
VALUES (11, 1, '2024-03-20 11:30:00', '2024-03-21 13:00:00', 'The patient has frequent migraines and sensitivity to light.', 11, 8123499, 1, 110, 4);

INSERT INTO appointment (appointment_id, appointment_type_id, created_at, scheduled_for, patient_concern, patient_vitals_id, student_id, doctor_id, lab_id, appointment_status_id)
VALUES (12, 1, '2024-04-20 11:45:00', '2024-04-21 14:00:00', 'The patient is experiencing chest pain and shortness of breath.', 12, 8123500, 7, 111, 4);

INSERT INTO appointment (appointment_id, appointment_type_id, created_at, scheduled_for, patient_concern, patient_vitals_id, student_id, doctor_id, lab_id, appointment_status_id)
VALUES (13, 1, '2024-05-20 12:00:00', '2024-05-21 14:00:00', 'The patient has a skin rash and itching.', 13, 8123501, 1, 112, 4);

INSERT INTO appointment (appointment_id, appointment_type_id, created_at, scheduled_for, patient_concern, patient_vitals_id, student_id, doctor_id, lab_id, appointment_status_id)
VALUES (14, 1, '2024-06-20 12:15:00', '2024-06-21 15:00:00', 'The patient is experiencing vision problems and eye pain.', 14, 8123502, 7, 113, 4);

INSERT INTO appointment (appointment_id, appointment_type_id, created_at, scheduled_for, patient_concern, patient_vitals_id, student_id, doctor_id, lab_id, appointment_status_id)
VALUES (15, 1, '2024-07-20 12:30:00', '2024-07-21 15:00:00', 'The patient has difficulty hearing and earache.', 15, 8123503, 1, 114, 4);

INSERT INTO appointment (appointment_id, appointment_type_id, created_at, scheduled_for, patient_concern, patient_vitals_id, student_id, doctor_id, lab_id, appointment_status_id)
VALUES (16, 1, '2024-08-20 12:45:00', '2024-08-21 16:00:00', 'The patient has a sore throat and difficulty swallowing.', 16, 8123504, 7, 115, 4);

INSERT INTO appointment (appointment_id, appointment_type_id, created_at, scheduled_for, patient_concern, patient_vitals_id, student_id, doctor_id, lab_id, appointment_status_id)
VALUES (17, 1, '2024-01-20 13:00:00', '2024-01-21 16:00:00', 'The patient is experiencing joint pain and stiffness.', 17, 8123505, 1, 116, 4);

INSERT INTO appointment (appointment_id, appointment_type_id, created_at, scheduled_for, patient_concern, patient_vitals_id, student_id, doctor_id, lab_id, appointment_status_id)
VALUES (18, 1, '2024-02-20 13:15:00', '2024-02-21 17:00:00', 'The patient has frequent urination and abdominal pain.', 18, 8123506, 7, 117, 4);

INSERT INTO appointment (appointment_id, appointment_type_id, created_at, scheduled_for, patient_concern, patient_vitals_id, student_id, doctor_id, lab_id, appointment_status_id)
VALUES (19, 1, '2024-03-21 10:00:00', '2024-03-22 08:00:00', 'The patient is experiencing severe back pain and difficulty in movement.', 19, 8123507, 6, 118, 4);

INSERT INTO appointment (appointment_id, appointment_type_id, created_at, scheduled_for, patient_concern, patient_vitals_id, student_id, doctor_id, lab_id, appointment_status_id)
VALUES (20, 1, '2024-04-21 10:15:00', '2024-04-23 08:00:00', 'The patient has persistent cough and chest congestion.', 20, 8123489, 6, 119, 4);

INSERT INTO appointment (appointment_id, appointment_type_id, created_at, scheduled_for, patient_concern, patient_vitals_id, student_id, doctor_id, lab_id, appointment_status_id)
VALUES (21, 1, '2024-05-21 10:30:00', '2024-05-22 09:00:00', 'The patient is experiencing dizziness and lightheadedness.', 21, 8123490, 6, 120, 4);

INSERT INTO appointment (appointment_id, appointment_type_id, created_at, scheduled_for, patient_concern, patient_vitals_id, student_id, doctor_id, lab_id, appointment_status_id)
VALUES (22, 1, '2024-06-11 10:45:00', '2024-06-12 09:00:00', 'The patient has frequent nosebleeds and difficulty in stopping bleeding.', 22, 8123491, 6, 121, 4);

INSERT INTO appointment (appointment_id, appointment_type_id, created_at, scheduled_for, patient_concern, patient_vitals_id, student_id, doctor_id, lab_id, appointment_status_id)
VALUES (23, 1, '2024-07-21 11:00:00', '2024-07-22 10:00:00', 'The patient is experiencing joint pain and stiffness in multiple joints.', 23, 8123492, 6, 122, 4);

INSERT INTO appointment (appointment_id, appointment_type_id, created_at, scheduled_for, patient_concern, patient_vitals_id, student_id, doctor_id, lab_id, appointment_status_id)
VALUES (24, 1, '2024-08-21 11:15:00', '2024-08-22 10:00:00', 'The patient has difficulty in swallowing and persistent heartburn.', 24, 8123493, 6, 123, 4);

INSERT INTO appointment (appointment_id, appointment_type_id, created_at, scheduled_for, patient_concern, patient_vitals_id, student_id, doctor_id, lab_id, appointment_status_id)
VALUES (25, 1, '2024-01-21 11:30:00', '2024-01-22 11:00:00', 'The patient is experiencing blurred vision and eye pain.', 25, 8123494, 6, 124, 4);

INSERT INTO appointment (appointment_id, appointment_type_id, created_at, scheduled_for, patient_concern, patient_vitals_id, student_id, doctor_id, lab_id, appointment_status_id)
VALUES (26, 1, '2024-02-21 11:45:00', '2024-02-22 11:00:00', 'The patient has persistent fatigue and unexplained weight loss.', 26, 8123495, 6, 125, 4);

INSERT INTO appointment (appointment_id, appointment_type_id, created_at, scheduled_for, patient_concern, patient_vitals_id, student_id, doctor_id, lab_id, appointment_status_id)
VALUES (27, 1, '2024-03-21 12:00:00', '2024-03-22 13:00:00', 'The patient has frequent indigestion and abdominal discomfort.', 27, 8123496, 6, 126, 4);

INSERT INTO appointment (appointment_id, appointment_type_id, created_at, scheduled_for, patient_concern, patient_vitals_id, student_id, doctor_id, lab_id, appointment_status_id)
VALUES (28, 1, '2024-04-21 12:15:00', '2024-04-22 13:00:00', 'The patient is experiencing severe anxiety and panic attacks.', 28, 8123497, 6, 127, 4);

INSERT INTO appointment (appointment_id, appointment_type_id, created_at, scheduled_for, patient_concern, patient_vitals_id, student_id, doctor_id, lab_id, appointment_status_id)
VALUES (29, 3, '2024-05-20 09:37:00', '2024-06-20 10:00:00', 'Follow-up for ACL reconstruction surgery.', 34, 8123498, 11, 128, 4);

INSERT INTO appointment (appointment_id, appointment_type_id, created_at, scheduled_for, patient_concern, patient_vitals_id, student_id, doctor_id, lab_id, appointment_status_id)
VALUES (30, 3, '2024-05-19 12:43:00', '2024-06-19 09:00:00', 'Follow-up for ACL reconstruction surgery.', 35, 8123499, 12, 129, 4);

INSERT INTO appointment (appointment_id, appointment_type_id, created_at, scheduled_for, patient_concern, patient_vitals_id, student_id, doctor_id, lab_id, appointment_status_id)
VALUES (31, 2, '2024-06-21 15:08:00', '2024-06-22 11:00:00', 'The patient has a dry cough and sore throat.', 32, 8123500, 5, 100, 4);

INSERT INTO appointment (appointment_id, appointment_type_id, created_at, scheduled_for, patient_concern, patient_vitals_id, student_id, doctor_id, lab_id, appointment_status_id)
VALUES (32, 2, '2024-06-20 16:33:00', '2024-06-21 15:00:00', 'The patient has a mild stomachache and frequent diarrhea.', 33, 8123501, 5, 101, 4);


-- appointment_diagnosis
INSERT INTO appointment_diagnosis (appointment_id, diagnosis_code)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25),
(26, 26),
(27, 27),
(28, 28),
(29, 29),
(30, 30),
(31, 31),
(32, 32);


-- appointment_prescription
INSERT INTO appointment_prescription (appointment_id, prescription_id) 
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(25, 25),
(26, 26),
(27, 27),
(28, 28),
(29, 29),
(30, 30),
(31, 31),
(32, 32);

