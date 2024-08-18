ALTER TABLE doctor
ADD CONSTRAINT FK_department_doctor
FOREIGN KEY (department_id)
REFERENCES department(department_id);

ALTER TABLE medicine
ADD CONSTRAINT FK_diagnosis_medicine
FOREIGN KEY (diagnosis_code)
REFERENCES diagnosis(diagnosis_code);

ALTER TABLE prescription
ADD CONSTRAINT FK_medicine_prescription
FOREIGN KEY (medicine_id)
REFERENCES medicine(medicine_id);

ALTER TABLE blood_test
ADD CONSTRAINT FK_doctor_blood_test
FOREIGN KEY (doctor_id)
REFERENCES doctor(doctor_id);

ALTER TABLE urinalysis
ADD CONSTRAINT FK_doctor_urinalysis
FOREIGN KEY (doctor_id)
REFERENCES doctor(doctor_id);

ALTER TABLE lab
ADD CONSTRAINT FK_blood_test_lab
FOREIGN KEY (blood_test_id)
REFERENCES blood_test(blood_test_id);

ALTER TABLE lab
ADD CONSTRAINT FK_urinalysis_lab
FOREIGN KEY (urinalysis_id)
REFERENCES urinalysis(urinalysis_id);

ALTER TABLE appointment
ADD CONSTRAINT FK_appointment_type
FOREIGN KEY (appointment_type_id)
REFERENCES appointment_type(appointment_type_id);

ALTER TABLE appointment
ADD CONSTRAINT FK_patient_vitals_appointment
FOREIGN KEY (patient_vitals_id)
REFERENCES patient_vitals(patient_vitals_id);

ALTER TABLE appointment
ADD CONSTRAINT FK_doctor_appointment
FOREIGN KEY (doctor_id)
REFERENCES doctor(doctor_id);

ALTER TABLE appointment
ADD CONSTRAINT FK_lab_appointment
FOREIGN KEY (lab_id)
REFERENCES lab(lab_id);

ALTER TABLE appointment
ADD CONSTRAINT FK_appointment_status
FOREIGN KEY (appointment_status_id)
REFERENCES appointment_status(appointment_status_id);

ALTER TABLE appointment_diagnosis
ADD CONSTRAINT FK_appointment_diagnosis_appointment
FOREIGN KEY (appointment_id)
REFERENCES appointment(appointment_id);

ALTER TABLE appointment_diagnosis
ADD CONSTRAINT FK_appointment_diagnosis_code
FOREIGN KEY (diagnosis_code)
REFERENCES diagnosis(diagnosis_code);

ALTER TABLE appointment_prescription
ADD CONSTRAINT FK_appointment_prescription_appointment
FOREIGN KEY (appointment_id)
REFERENCES appointment(appointment_id);

ALTER TABLE appointment_prescription
ADD CONSTRAINT FK_prescription_appointment
FOREIGN KEY (prescription_id)
REFERENCES prescription(prescription_id);

ALTER TABLE appointment
ADD CONSTRAINT FK_student_appointment
FOREIGN KEY (student_id)
REFERENCES student(student_id);