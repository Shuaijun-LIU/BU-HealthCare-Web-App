const express = require('express');
const path = require('path');
const db = require('./models/db');  // Import database connection
const bodyParser = require('body-parser');  // Used to parse JSON data in request bodies
const authRoutes = require('./routes/auth'); // Import authentication routes

const app = express();

app.use(bodyParser.json()); // Parse JSON request bodies

// Set static file path
app.use(express.static(path.join(__dirname, 'public')));

// Route for the root path, returns home.html
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'public', 'home.html'));
});

// Route to retrieve all students
app.get('/students', async (req, res) => {
    try {
        const [rows] = await db.query('SELECT * FROM student');
        res.json(rows);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Route to retrieve student information by email
app.get('/api/student', async (req, res) => {
    const { email } = req.query;
    try {
        const [rows] = await db.query('SELECT first_name, last_name FROM student WHERE email = ?', [email]);
        if (rows.length > 0) {
            const student = rows[0];
            res.json({ success: true, name: `${student.first_name} ${student.last_name}` });
        } else {
            res.status(404).json({ success: false, message: 'Student not found' });
        }
    } catch (err) {
        res.status(500).json({ success: false, message: err.message });
    }
});

// Route to retrieve appointment types
app.get('/api/appointment-types', async (req, res) => {
    try {
        const [rows] = await db.query('SELECT * FROM appointment_type');
        res.json(rows);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Route to retrieve doctor information
app.get('/api/doctors', async (req, res) => {
    try {
        const [rows] = await db.query('SELECT doctor_id, first_name, last_name FROM doctor');
        res.json(rows);
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// Route to handle appointment booking requests
app.post('/api/book-appointment', async (req, res) => {
    const { type, doctor, date, time, studentEmail } = req.body;

    try {
        // Find student ID
        const [studentRows] = await db.query('SELECT student_id FROM student WHERE email = ?', [studentEmail]);
        if (studentRows.length === 0) {
            return res.status(404).json({ success: false, message: 'Student not found' });
        }
        const studentId = studentRows[0].student_id;

        // Insert a new appointment record
        const [result] = await db.query(
            'INSERT INTO appointment (appointment_type_id, doctor_id, student_id, scheduled_for, created_at) VALUES (?, ?, ?, ?, NOW())',
            [type, doctor, studentId, `${date} ${time}`]
        );

        if (result.affectedRows === 1) {
            res.json({ success: true, message: 'Appointment booked successfully' });
        } else {
            res.status(500).json({ success: false, message: 'Failed to book appointment' });
        }
    } catch (err) {
        res.status(500).json({ success: false, message: err.message });
    }
});

// Route to retrieve a student's appointment history along with associated prescriptions and diagnoses
app.get('/api/appointments', async (req, res) => {
    const { email } = req.query;
    try {
        const [studentRows] = await db.query('SELECT student_id FROM student WHERE email = ?', [email]);
        if (studentRows.length === 0) {
            return res.status(404).json({ success: false, message: 'Student not found' });
        }
        const studentId = studentRows[0].student_id;

        const [appointments] = await db.query(`
            SELECT at.type, CONCAT(d.first_name, ' ', d.last_name) AS doctor, 
                   DATE_FORMAT(a.scheduled_for, '%Y-%m-%d') AS date, 
                   DATE_FORMAT(a.scheduled_for, '%H:%i') AS time,
                   IFNULL(di.diagnosis, 'Please wait') AS diagnosis,
                   IFNULL(m.name, 'Please wait') AS prescription
            FROM appointment a
            JOIN appointment_type at ON a.appointment_type_id = at.appointment_type_id
            JOIN doctor d ON a.doctor_id = d.doctor_id
            LEFT JOIN appointment_diagnosis ad ON a.appointment_id = ad.appointment_id
            LEFT JOIN diagnosis di ON ad.diagnosis_code = di.diagnosis_code
            LEFT JOIN appointment_prescription ap ON a.appointment_id = ap.appointment_id
            LEFT JOIN prescription p ON ap.prescription_id = p.prescription_id
            LEFT JOIN medicine m ON p.medicine_id = m.medicine_id
            WHERE a.student_id = ?
            ORDER BY a.scheduled_for DESC
        `, [studentId]);

        res.json({ success: true, appointments });
    } catch (err) {
        res.status(500).json({ success: false, message: err.message });
    }
});

// Route to retrieve personal information of a user
app.get('/api/personal-info', async (req, res) => {
    const { email, role } = req.query;

    let query = '';
    if (role === 'student') {
        query = 'SELECT first_name, last_name, dob, phone, email, sex, marital_status, ethnicity, nationality, blood_type, height, weight, blood_pressure, bmi FROM student WHERE email = ?';
    } else if (role === 'doctor') {
        query = 'SELECT first_name, last_name, specialty, office, phone, email, department_id FROM doctor WHERE email = ?';
    } else if (role === 'admin') {
        query = 'SELECT first_name, last_name, phone, email FROM administrator WHERE email = ?';
    } else {
        return res.status(400).json({ success: false, message: 'Invalid role specified' });
    }

    try {
        const [rows] = await db.query(query, [email]);
        if (rows.length > 0) {
            res.json({ success: true, ...rows[0] });
        } else {
            res.status(404).json({ success: false, message: 'User not found' });
        }
    } catch (err) {
        res.status(500).json({ success: false, message: err.message });
    }
});

// Route to update personal information of a user
app.post('/api/update-personal-info', async (req, res) => {
    const { email, role, first_name, last_name, phone, specialty, office, department } = req.body;

    let query = '';
    let values = [];

    if (role === 'doctor') {
        // Include department_id in the update query for the doctor role
        query = `UPDATE doctor SET first_name = ?, last_name = ?, phone = ?, specialty = ?, office = ?, department_id = ? WHERE email = ?`;
        values = [first_name, last_name, phone, specialty, office, department, email];
    } else if (role === 'student') {
        // Update query for the student role
        query = `UPDATE student SET first_name = ?, last_name = ?, phone = ?, dob = ?, sex = ?, marital_status = ?, ethnicity = ?, nationality = ?, blood_type = ?, height = ?, weight = ?, blood_pressure = ?, bmi = ? WHERE email = ?`;
        values = [first_name, last_name, phone, dob, sex, marital_status, ethnicity, nationality, blood_type, height, weight, blood_pressure, bmi, email];
    } else if (role === 'admin') {
        // Update query for the admin role
        query = `UPDATE administrator SET first_name = ?, last_name = ?, phone = ? WHERE email = ?`;
        values = [first_name, last_name, phone, email];
    } else {
        return res.status(400).json({ success: false, message: 'Invalid role specified' });
    }

    try {
        console.log('Executing query:', query);  // Log the executed SQL query
        console.log('With values:', values);     // Log the values being passed to the query
        const [result] = await db.query(query, values);
        if (result.affectedRows === 1) {
            res.json({ success: true, message: 'Information updated successfully' });
        } else {
            res.status(500).json({ success: false, message: 'Failed to update information' });
        }
    } catch (err) {
        console.error('Server Error:', err);  // Log the server error details
        res.status(500).json({ success: false, message: err.message });
    }
});

// Route to retrieve all appointments
app.get('/api/allappointments', async (req, res) => {
    try {
        const [rows] = await db.query('SELECT * FROM appointment');
        res.json(rows);
    } catch (err) {
        console.error('Error fetching appointments:', err);
        res.status(500).json({ success: false, message: 'Failed to load appointments' });
    }
});

// Route to retrieve a single appointment
app.get('/api/allappointments/:id', async (req, res) => {
    const appointmentId = req.params.id;
    try {
        const [rows] = await db.query('SELECT * FROM appointment WHERE appointment_id = ?', [appointmentId]);
        if (rows.length > 0) {
            res.json(rows[0]);
        } else {
            res.status(404).json({ success: false, message: 'Appointment not found' });
        }
    } catch (err) {
        console.error('Error fetching appointment:', err);
        res.status(500).json({ success: false, message: 'Failed to load appointment' });
    }
});

// Route to create a new appointment
app.post('/api/allappointments', async (req, res) => {
    const { appointment_type_id, scheduled_for, student_id, doctor_id, appointment_status_id } = req.body;
    try {
        const [result] = await db.query(
            'INSERT INTO appointment (appointment_type_id, scheduled_for, student_id, doctor_id, appointment_status_id) VALUES (?, ?, ?, ?, ?)',
            [appointment_type_id, scheduled_for, student_id, doctor_id, appointment_status_id]
        );
        if (result.affectedRows === 1) {
            res.json({ success: true, message: 'Appointment created successfully' });
        } else {
            res.status(500).json({ success: false, message: 'Failed to create appointment' });
        }
    } catch (err) {
        console.error('Error creating appointment:', err);
        res.status(500).json({ success: false, message: 'Failed to create appointment' });
    }
});

// Route to update an appointment
app.put('/api/allappointments/:id', async (req, res) => {
    const appointmentId = req.params.id;
    const { appointment_type_id, scheduled_for, student_id, doctor_id, appointment_status_id } = req.body;
    try {
        const [result] = await db.query(
            'UPDATE appointment SET appointment_type_id = ?, scheduled_for = ?, student_id = ?, doctor_id = ?, appointment_status_id = ? WHERE appointment_id = ?',
            [appointment_type_id, scheduled_for, student_id, doctor_id, appointment_status_id, appointmentId]
        );
        if (result.affectedRows === 1) {
            res.json({ success: true, message: 'Appointment updated successfully' });
        } else {
            res.status(500).json({ success: false, message: 'Failed to update appointment' });
        }
    } catch (err) {
        console.error('Error updating appointment:', err);
        res.status(500).json({ success: false, message: 'Failed to update appointment' });
    }
});


// Route to delete an appointment
app.delete('/api/allappointments/:id', async (req, res) => {
    const appointmentId = req.params.id;
    try {
        const [result] = await db.query('DELETE FROM appointment WHERE appointment_id = ?', [appointmentId]);
        if (result.affectedRows === 1) {
            res.json({ success: true, message: 'Appointment deleted successfully' });
        } else {
            res.status(500).json({ success: false, message: 'Failed to delete appointment' });
        }
    } catch (err) {
        console.error('Error deleting appointment:', err);
        res.status(500).json({ success: false, message: 'Failed to delete appointment' });
    }
});

// Route to retrieve all prescriptions
app.get('/api/prescriptions', async (req, res) => {
    try {
        const [rows] = await db.query('SELECT * FROM prescription');
        res.json(rows);
    } catch (err) {
        console.error('Error fetching prescriptions:', err);
        res.status(500).json({ success: false, message: 'Failed to load prescriptions' });
    }
});

// Route to retrieve a single prescription
app.get('/api/prescriptions/:id', async (req, res) => {
    const prescriptionId = req.params.id;
    try {
        const [rows] = await db.query('SELECT * FROM prescription WHERE prescription_id = ?', [prescriptionId]);
        if (rows.length > 0) {
            res.json(rows[0]);
        } else {
            res.status(404).json({ success: false, message: 'Prescription not found' });
        }
    } catch (err) {
        console.error('Error fetching prescription:', err);
        res.status(500).json({ success: false, message: 'Failed to load prescription' });
    }
});

// Route to update prescription information
app.put('/api/prescriptions/:id', async (req, res) => {
    const prescriptionId = req.params.id;
    const { medicine_id, prescribed_at, duration, comments } = req.body;
    try {
        const [result] = await db.query(
            'UPDATE prescription SET medicine_id = ?, prescribed_at = ?, duration = ?, comments = ? WHERE prescription_id = ?',
            [medicine_id, prescribed_at, duration, comments, prescriptionId]
        );
        if (result.affectedRows === 1) {
            res.json({ success: true, message: 'Prescription updated successfully' });
        } else {
            res.status(500).json({ success: false, message: 'Failed to update prescription' });
        }
    } catch (err) {
        console.error('Error updating prescription:', err);
        res.status(500).json({ success: false, message: 'Failed to update prescription' });
    }
});

// Route to retrieve all urinalysis records
app.get('/api/urinalysis', async (req, res) => {
    try {
        const [rows] = await db.query('SELECT * FROM urinalysis');
        res.json(rows);
    } catch (err) {
        console.error('Error fetching urinalysis records:', err);
        res.status(500).json({ success: false, message: 'Failed to load urinalysis records' });
    }
});

// Route to retrieve a single urinalysis record
app.get('/api/urinalysis/:id', async (req, res) => {
    const urinalysisId = req.params.id;
    try {
        const [rows] = await db.query('SELECT * FROM urinalysis WHERE urinalysis_id = ?', [urinalysisId]);
        if (rows.length > 0) {
            res.json(rows[0]);
        } else {
            res.status(404).json({ success: false, message: 'Urinalysis record not found' });
        }
    } catch (err) {
        console.error('Error fetching urinalysis record:', err);
        res.status(500).json({ success: false, message: 'Failed to load urinalysis record' });
    }
});

// Route to create a new urinalysis record
app.post('/api/urinalysis', async (req, res) => {
    const { pH, specific_gravity, glucose, protein, bilirubin, urobilinogen, blood, ketone, nitrite, leukocytes, ascorbic_acid, clarity, color, collected_at, doctor_id } = req.body;
    try {
        const [result] = await db.query(
            'INSERT INTO urinalysis (pH, specific_gravity, glucose, protein, bilirubin, urobilinogen, blood, ketone, nitrite, leukocytes, ascorbic_acid, clarity, color, collected_at, doctor_id) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
            [pH, specific_gravity, glucose, protein, bilirubin, urobilinogen, blood, ketone, nitrite, leukocytes, ascorbic_acid, clarity, color, collected_at, doctor_id]
        );
        if (result.affectedRows === 1) {
            res.json({ success: true, message: 'Urinalysis record created successfully' });
        } else {
            res.status(500).json({ success: false, message: 'Failed to create urinalysis record' });
        }
    } catch (err) {
        console.error('Error creating urinalysis record:', err);
        res.status(500).json({ success: false, message: 'Failed to create urinalysis record' });
    }
});

// Route to update a urinalysis record
app.put('/api/urinalysis/:id', async (req, res) => {
    const urinalysisId = req.params.id;
    const { pH, specific_gravity, glucose, protein, bilirubin, urobilinogen, blood, ketone, nitrite, leukocytes, ascorbic_acid, clarity, color, collected_at, doctor_id } = req.body;
    try {
        const [result] = await db.query(
            'UPDATE urinalysis SET pH = ?, specific_gravity = ?, glucose = ?, protein = ?, bilirubin = ?, urobilinogen = ?, blood = ?, ketone = ?, nitrite = ?, leukocytes = ?, ascorbic_acid = ?, clarity = ?, color = ?, collected_at = ?, doctor_id = ? WHERE urinalysis_id = ?',
            [pH, specific_gravity, glucose, protein, bilirubin, urobilinogen, blood, ketone, nitrite, leukocytes, ascorbic_acid, clarity, color, collected_at, doctor_id, urinalysisId]
        );
        if (result.affectedRows === 1) {
            res.json({ success: true, message: 'Urinalysis record updated successfully' });
        } else {
            res.status(500).json({ success: false, message: 'Failed to update urinalysis record' });
        }
    } catch (err) {
        console.error('Error updating urinalysis record:', err);
        res.status(500).json({ success: false, message: 'Failed to update urinalysis record' });
    }
});

// Route to retrieve all students
app.get('/api/allstudents', async (req, res) => {
    try {
        const [rows] = await db.query('SELECT * FROM student');
        res.json(rows);
    } catch (err) {
        console.error('Error fetching students:', err);
        res.status(500).json({ success: false, message: 'Failed to load students' });
    }
});

// Route to retrieve a single student
app.get('/api/allstudents/:id', async (req, res) => {
    const studentId = req.params.id;
    try {
        const [rows] = await db.query('SELECT * FROM student WHERE student_id = ?', [studentId]);
        if (rows.length > 0) {
            res.json(rows[0]);
        } else {
            res.status(404).json({ success: false, message: 'Student not found' });
        }
    } catch (err) {
        console.error('Error fetching student:', err);
        res.status(500).json({ success: false, message: 'Failed to load student' });
    }
});

// Route to create a new student
app.post('/api/allstudents', async (req, res) => {
    const { first_name, last_name, dob, phone, email, sex, marital_status, ethnicity, nationality, blood_type, height, weight, blood_pressure, bmi, password } = req.body;
    try {
        const [result] = await db.query(
            'INSERT INTO student (first_name, last_name, dob, phone, email, sex, marital_status, ethnicity, nationality, blood_type, height, weight, blood_pressure, bmi, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)',
            [first_name, last_name, dob, phone, email, sex, marital_status, ethnicity, nationality, blood_type, height, weight, blood_pressure, bmi, password]
        );
        if (result.affectedRows === 1) {
            res.json({ success: true, message: 'Student created successfully' });
        } else {
            res.status(500).json({ success: false, message: 'Failed to create student' });
        }
    } catch (err) {
        console.error('Error creating student:', err);
        res.status(500).json({ success: false, message: 'Failed to create student' });
    }
});

// Route to update student information
app.put('/api/allstudents/:id', async (req, res) => {
    const studentId = req.params.id;
    const { first_name, last_name, dob, phone, email, sex, marital_status, ethnicity, nationality, blood_type, height, weight, blood_pressure, bmi } = req.body;
    try {
        const [result] = await db.query(
            'UPDATE student SET first_name = ?, last_name = ?, dob = ?, phone = ?, email = ?, sex = ?, marital_status = ?, ethnicity = ?, nationality = ?, blood_type = ?, height = ?, weight = ?, blood_pressure = ?, bmi = ? WHERE student_id = ?',
            [first_name, last_name, dob, phone, email, sex, marital_status, ethnicity, nationality, blood_type, height, weight, blood_pressure, bmi, studentId]
        );
        if (result.affectedRows === 1) {
            res.json({ success: true, message: 'Student updated successfully' });
        } else {
            res.status(500).json({ success: false, message: 'Failed to update student' });
        }
    } catch (err) {
        console.error('Error updating student:', err);
        res.status(500).json({ success: false, message: 'Failed to update student' });
    }
});

// Route to retrieve all doctors
app.get('/api/alldoctors', async (req, res) => {
    try {
        const [rows] = await db.query('SELECT * FROM doctor');
        res.json(rows);
    } catch (err) {
        console.error('Error fetching doctors:', err);
        res.status(500).json({ success: false, message: 'Failed to load doctors' });
    }
});

// Route to retrieve a single doctor
app.get('/api/alldoctors/:id', async (req, res) => {
    const doctorId = req.params.id;
    try {
        const [rows] = await db.query('SELECT * FROM doctor WHERE doctor_id = ?', [doctorId]);
        if (rows.length > 0) {
            res.json(rows[0]);
        } else {
            res.status(404).json({ success: false, message: 'Doctor not found' });
        }
    } catch (err) {
        console.error('Error fetching doctor:', err);
        res.status(500).json({ success: false, message: 'Failed to load doctor' });
    }
});

// Route to create a new doctor
app.post('/api/alldoctors', async (req, res) => {
    const { first_name, last_name, specialty, office, phone, email, department_id, password } = req.body;
    try {
        const [result] = await db.query(
            'INSERT INTO doctor (first_name, last_name, specialty, office, phone, email, department_id, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
            [first_name, last_name, specialty, office, phone, email, department_id, password]
        );
        if (result.affectedRows === 1) {
            res.json({ success: true, message: 'Doctor created successfully' });
        } else {
            res.status(500).json({ success: false, message: 'Failed to create doctor' });
        }
    } catch (err) {
        console.error('Error creating doctor:', err);
        res.status(500).json({ success: false, message: 'Failed to create doctor' });
    }
});

// Route to update doctor information
app.put('/api/alldoctors/:id', async (req, res) => {
    const doctorId = req.params.id;
    const { first_name, last_name, specialty, office, phone, email, department_id } = req.body;
    try {
        const [result] = await db.query(
            'UPDATE doctor SET first_name = ?, last_name = ?, specialty = ?, office = ?, phone = ?, email = ?, department_id = ? WHERE doctor_id = ?',
            [first_name, last_name, specialty, office, phone, email, department_id, doctorId]
        );
        if (result.affectedRows === 1) {
            res.json({ success: true, message: 'Doctor updated successfully' });
        } else {
            res.status(500).json({ success: false, message: 'Failed to update doctor' });
        }
    } catch (err) {
        console.error('Error updating doctor:', err);
        res.status(500).json({ success: false, message: 'Failed to update doctor' });
    }
});

// Use auth routes to handle login requests
app.use('/auth', authRoutes);

// Set port and start the server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});