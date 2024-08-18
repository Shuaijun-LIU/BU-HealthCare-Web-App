document.addEventListener('DOMContentLoaded', function () {
    const formTitle = document.getElementById('form-title');
    const appointmentForm = document.getElementById('manage-appointment-form');
    const appointmentIdInput = document.getElementById('appointment-id');
    const appointmentTypeInput = document.getElementById('appointment-type');
    const scheduledForInput = document.getElementById('scheduled-for');
    const studentIdInput = document.getElementById('student-id');
    const doctorIdInput = document.getElementById('doctor-id');
    const statusIdInput = document.getElementById('status-id');
    const cancelBtn = document.getElementById('cancel-btn');

    // Load user role and name from localStorage
    const userEmail = localStorage.getItem('userEmail');
    const userRole = localStorage.getItem('userRole');
    const userNameElement = document.getElementById('user-name');
    const feedback = document.getElementById('feedback');

    if (userEmail) {
        // Fetch user name
        fetch(`/api/personal-info?email=${userEmail}&role=${userRole}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
                return response.json();
            })
            .then(data => {
                if (data.success) {
                    userNameElement.textContent = `Welcome, ${data.first_name} ${data.last_name}`;
                } else {
                    feedback.textContent = 'Error: ' + data.message;
                }
            })
            .catch(error => {
                console.error('Error loading user name:', error);
                feedback.textContent = 'Error loading user name. Please try again later.';
            });

        // Generate the sidebar based on the user role
        generateSidebar(userRole);

        // Initial load of appointments
        loadAppointments();
    } else {
        feedback.textContent = 'Error: User email not found.';
        console.error('User email not found in localStorage.');
    }

    // Generate sidebar based on the user role (student, doctor, admin)
    function generateSidebar(role) {
        const sidebar = document.querySelector('.sidebar ul');
        sidebar.innerHTML = ''; // Clear existing sidebar items

        if (role === 'student') {
            sidebar.innerHTML = `
                <li><a href="student-appointment.html">Book Appointment</a></li>
                <li><a href="appointment-history.html">Appointment History</a></li>
            `;
        } else if (role === 'doctor') {
            sidebar.innerHTML = `
                <li><a href="personal-info.html">Dashboard</a></li>
                <li><a href="manage-appointment.html">Manage Appointment</a></li>
                <li><a href="prescriptions.html">Prescriptions</a></li>
                <li><a href="urinalysis.html">Urinalysis</a></li>
            `;
        } else if (role === 'admin') {
            sidebar.innerHTML = `
                <li><a href="personal-info.html">Dashboard</a></li>
                <li><a href="manage-students.html">Students</a></li>
                <li><a href="manage-doctors.html">Doctors</a></li>
                <li><a href="manage-appointment.html">App</a></li>
                <li><a href="prescriptions.html">Prescriptions</a></li>
                <li><a href="urinalysis.html">Urinalysis</a></li>
            `;
        }
    }

    // Function to load all appointments
    function loadAppointments() {
        fetch('/api/allappointments')
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok');
                }
                return response.json();
            })
            .then(data => {
                console.log('Data received:', data);
                if (!Array.isArray(data)) {
                    throw new TypeError('Expected an array but got a different type');
                }
                const tbody = document.querySelector('#appointments-table tbody');
                tbody.innerHTML = ''; // Clear existing rows
                
                // <button onclick="deleteAppointment(${appointment.appointment_id})">Delete</button>
                data.forEach(appointment => {
                    const row = document.createElement('tr');
                    row.innerHTML = `
                        <td>${appointment.appointment_id}</td>
                        <td>${appointment.appointment_type_id}</td>
                        <td>${new Date(appointment.scheduled_for).toLocaleString()}</td>
                        <td>${appointment.student_id}</td>
                        <td>${appointment.doctor_id}</td>
                        <td>${appointment.appointment_status_id}</td>
                        <td>
                            <button onclick="editAppointment(${appointment.appointment_id})">Edit</button> 
                        </td>
                    `;
                    tbody.appendChild(row);
                });
            })
            .catch(error => {
                console.error('Error loading appointments:', error);
                feedback.textContent = 'Error loading appointments. Please try again later.';
            });
    }

    // Function to handle form submission for adding/updating appointments
    appointmentForm.addEventListener('submit', function (e) {
        e.preventDefault();

        const appointmentId = appointmentIdInput.value;
        const method = appointmentId ? 'PUT' : 'POST'; // Use PUT for update, POST for create
        const url = appointmentId ? `/api/allappointments/${appointmentId}` : '/api/allappointments';

        const formData = {
            appointment_type_id: appointmentTypeInput.value,
            scheduled_for: scheduledForInput.value,
            student_id: studentIdInput.value,
            doctor_id: doctorIdInput.value,
            appointment_status_id: statusIdInput.value,
        };

        fetch(url, {
            method: method,
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(formData)
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                loadAppointments();
                appointmentForm.reset();
                appointmentIdInput.value = ''; // Clear the hidden ID input
                formTitle.textContent = 'Add New Appointment';
            } else {
                alert(`Failed to save appointment: ${data.message}`);
            }
        })
        .catch(error => console.error('Error saving appointment:', error));
    });

    // Handle cancel button
    cancelBtn.addEventListener('click', function () {
        appointmentForm.reset();
        appointmentIdInput.value = ''; // Clear the hidden ID input
        formTitle.textContent = 'Add New Appointment';
    });
});

// Function to edit an existing appointment
function editAppointment(id) {
    fetch(`/api/allappointments/${id}`)
        .then(response => response.json())
        .then(data => {
            document.getElementById('appointment-id').value = data.appointment_id;
            document.getElementById('appointment-type').value = data.appointment_type_id;
            document.getElementById('scheduled-for').value = new Date(data.scheduled_for).toISOString().slice(0, 16);
            document.getElementById('student-id').value = data.student_id;
            document.getElementById('doctor-id').value = data.doctor_id;
            document.getElementById('status-id').value = data.appointment_status_id;

            document.getElementById('form-title').textContent = 'Edit Appointment';
        })
        .catch(error => console.error('Error loading appointment:', error));
}

// // Function to delete an appointment
// function deleteAppointment(id) {
//     if (confirm('Are you sure you want to delete this appointment?')) {
//         fetch(`/api/allappointments/${id}`, {
//             method: 'DELETE'
//         })
//         .then(response => response.json())
//         .then(data => {
//             if (data.success) {
//                 loadAppointments();
//             } else {
//                 alert(`Failed to delete appointment: ${data.message}`);
//             }
//         })
//         .catch(error => console.error('Error deleting appointment:', error));
//     }
// }

// Logout function to clear local storage and redirect to home page
function logout() {
    localStorage.removeItem('userEmail');
    localStorage.removeItem('userRole');
    localStorage.removeItem('userName');
    
    window.location.href = 'home.html';
}