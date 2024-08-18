CREATE DATABASE bu_health_care;
USE bu_health_care;

CREATE TABLE appointment_type (
  appointment_type_id int NOT NULL,
  type varchar(255) NOT NULL,
  description varchar(255) NOT NULL,
  PRIMARY KEY (appointment_type_id)
);

CREATE TABLE appointment_status (
  appointment_status_id int NOT NULL,
  status varchar(255) NOT NULL,
  description varchar(255) NOT NULL,
  PRIMARY KEY (appointment_status_id)
);

CREATE TABLE diagnosis (
  diagnosis_code int NOT NULL,
  diagnosis varchar(255) NOT NULL,
  PRIMARY KEY (diagnosis_code)
);

CREATE TABLE department (
  department_id int NOT NULL,
  name varchar(255) NOT NULL,
  phone varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
  PRIMARY KEY (department_id)
);

CREATE TABLE student (
  student_id int NOT NULL,
  first_name varchar(255) NOT NULL,
  last_name varchar(255) NOT NULL,
  dob DATE NOT NULL,
  phone varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
  sex varchar(255) NOT NULL,
  marital_status varchar(255) NOT NULL,
  ethnicity varchar(255) NOT NULL,
  nationality varchar(255) NOT NULL,
  blood_type varchar(255) NOT NULL,
  height decimal(10, 3),
  weight decimal(10, 3),
  blood_pressure varchar(255),
  bmi decimal(10, 3),
  last_updated_at DATE,
  password varchar(255) NOT NULL,
  PRIMARY KEY (student_id)
);

CREATE TABLE doctor (
  doctor_id int NOT NULL,
  first_name varchar(255) NOT NULL,
  last_name varchar(255) NOT NULL,
  specialty varchar(255) NOT NULL,
  office varchar(255) NOT NULL,
  phone varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
  department_id int,
  password varchar(255) NOT NULL,
  PRIMARY KEY (doctor_id)
);

CREATE TABLE administrator (
  administrator_id int NOT NULL,
  first_name varchar(255) NOT NULL,
  last_name varchar(255) NOT NULL,
  phone varchar(255) NOT NULL,
  email varchar(255) NOT NULL,
  password varchar(255) NOT NULL,
  PRIMARY KEY (administrator_id)
);

CREATE TABLE patient_vitals (
  patient_vitals_id int NOT NULL,
  height decimal(10, 3),
  weight decimal(10, 3),
  blood_pressure varchar(255),
  bmi decimal(10, 3),
  last_updated_at timestamp(3),
  PRIMARY KEY (patient_vitals_id)
);

CREATE TABLE medicine (
  medicine_id int NOT NULL,
  diagnosis_code int,
  name varchar(255) NOT NULL,
  active_ingredient varchar(255) NOT NULL,
  price decimal(10, 3) NOT NULL,
  description varchar(255) NOT NULL,
  dose varchar(255) NOT NULL,
  PRIMARY KEY (medicine_id)
);

CREATE TABLE prescription (
  prescription_id int NOT NULL,
  medicine_id int,
  prescribed_at timestamp(3) NOT NULL,
  duration varchar(255) NOT NULL,
  comments varchar(255),
  PRIMARY KEY (prescription_id)
);

CREATE TABLE blood_test (
  blood_test_id int NOT NULL,
  haemoglobin decimal(10, 3),
  WBC decimal(10, 3),
  platelets decimal(10, 3),
  MCV decimal(10, 3),
  PCV decimal(10, 3),
  RBC decimal(10, 3),
  MCH decimal(10, 3),
  MCHC decimal(10, 3),
  RDW decimal(10, 3),
  neutrophils decimal(10, 3),
  lymphocytes decimal(10, 3),
  monocytes decimal(10, 3),
  basophils decimal(10, 3),
  collected_at timestamp(3) NOT NULL,
  doctor_id int,
  PRIMARY KEY (blood_test_id)
);

CREATE TABLE urinalysis (
  urinalysis_id int NOT NULL,
  pH decimal(10, 3),
  specific_gravity decimal(10, 3),
  glucose decimal(10, 3),
  protein decimal(10, 3),
  bilirubin decimal(10, 3),
  urobilinogen decimal(10, 3),
  blood decimal(10, 3),
  ketone decimal(10, 3),
  nitrite decimal(10, 3),
  leukocytes decimal(10, 3),
  ascorbic_acid decimal(10, 3),
  clarity varchar(255),
  color varchar(255),
  collected_at timestamp(3) NOT NULL,
  doctor_id int,
  PRIMARY KEY (urinalysis_id)
);

CREATE TABLE lab (
  lab_id int NOT NULL,
  blood_test_id int,
  urinalysis_id int,
  PRIMARY KEY (lab_id)
);

CREATE TABLE appointment (
  appointment_id INT NOT NULL AUTO_INCREMENT,
  appointment_type_id int,
  created_at timestamp(3),
  scheduled_for timestamp(3),
  patient_concern varchar(255),
  patient_vitals_id int,
  student_id int,
  doctor_id int,
  lab_id int,
  appointment_status_id int,
  PRIMARY KEY (appointment_id)
);

CREATE TABLE appointment_diagnosis (
  appointment_id int,
  diagnosis_code int,
  PRIMARY KEY (appointment_id, diagnosis_code)
);

CREATE TABLE appointment_prescription (
  appointment_id int,
  prescription_id int,
  PRIMARY KEY (appointment_id, prescription_id)
);