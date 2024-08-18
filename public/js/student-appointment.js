// js/student-appointment.js

// logout
function logout() {
    localStorage.removeItem('userEmail');
    localStorage.removeItem('userRole');

    window.location.href = 'home.html';
}

document.addEventListener('DOMContentLoaded', function () {
    const studentEmail = localStorage.getItem('userEmail'); 

    if (studentEmail) {
        fetch(`/api/student?email=${studentEmail}`)
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    document.getElementById('student-name').textContent = `Welcome, ${data.name}`;
                } else {
                    console.error('Error:', data.message);
                }
            })
            .catch(error => console.error('Error loading student name:', error));
    }

    fetch('/api/appointment-types')
        .then(response => response.json())
        .then(data => {
            const appointmentTypeSelect = document.getElementById('appointment-type');
            data.forEach(type => {
                const option = document.createElement('option');
                option.value = type.appointment_type_id;
                option.textContent = type.type;
                appointmentTypeSelect.appendChild(option);
            });
        })
        .catch(error => console.error('Error loading appointment types:', error));

    fetch('/api/doctors')
        .then(response => response.json())
        .then(data => {
            const doctorSelect = document.getElementById('doctor');
            data.forEach(doctor => {
                const option = document.createElement('option');
                option.value = doctor.doctor_id;
                option.textContent = `${doctor.first_name} ${doctor.last_name}`;
                doctorSelect.appendChild(option);
            });
        })
        .catch(error => console.error('Error loading doctors:', error));

    // 处理预约表单提交
    document.getElementById('appointment-form').addEventListener('submit', function (e) {
        e.preventDefault();

        const appointmentType = document.getElementById('appointment-type').value;
        const doctor = document.getElementById('doctor').value;
        const appointmentDate = document.getElementById('appointment-date').value;
        const appointmentTime = document.getElementById('appointment-time').value;

        if (appointmentType && doctor && appointmentDate && appointmentTime) {
            const formData = {
                type: appointmentType,
                doctor: doctor,
                date: appointmentDate,
                time: appointmentTime,
                studentEmail: studentEmail
            };

            fetch('/api/book-appointment', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(formData)
            })
                .then(response => response.json())
                .then(data => {
                    const feedback = document.getElementById('feedback');
                    if (data.success) {
                        feedback.textContent = 'Appointment booked successfully!';
                        feedback.style.color = 'green';
                    } else {
                        feedback.textContent = `Failed to book appointment: ${data.message}`;
                        feedback.style.color = 'red';
                    }
                })
                .catch(error => {
                    console.error('Error:', error);
                    document.getElementById('feedback').textContent = 'An error occurred. Please try again.';
                });
        } else {
            alert('Please fill in all required fields.');
        }
    });
});