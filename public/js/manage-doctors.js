document.addEventListener('DOMContentLoaded', function () {
    const formTitle = document.getElementById('form-title');
    const doctorForm = document.getElementById('manage-doctor-form');
    const doctorIdInput = document.getElementById('doctor-id');
    const firstNameInput = document.getElementById('first-name');
    const lastNameInput = document.getElementById('last-name');
    const specialtyInput = document.getElementById('specialty');
    const officeInput = document.getElementById('office');
    const phoneInput = document.getElementById('phone');
    const emailInput = document.getElementById('email');
    const departmentIdInput = document.getElementById('department-id');
    const passwordInput = document.getElementById('password');
    const cancelBtn = document.getElementById('cancel-btn');
    const feedback = document.getElementById('feedback');

    // Load user role and name from localStorage
    const userEmail = localStorage.getItem('userEmail');
    const userRole = localStorage.getItem('userRole');
    const userNameElement = document.getElementById('user-name');

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

    // Initial load of doctors
    loadDoctors();
} else {
    feedback.textContent = 'Error: User email not found.';
    console.error('User email not found in localStorage.');
}

// Generate sidebar based on the user role (student, doctor, admin)
function generateSidebar(role) {
    const sidebar = document.querySelector('.sidebar ul');
    sidebar.innerHTML = ''; // Clear existing sidebar items

    if (role === 'admin') {
        sidebar.innerHTML = `
                <li><a href="personal-info.html">Dashboard</a></li>
                <li><a href="manage-students.html">Students</a></li>
                <li><a href="manage-doctors.html">Doctors</a></li>
                <li><a href="manage-appointment.html">App</a></li>
                <li><a href="prescriptions.html">Prescriptions</a></li>
                <li><a href="urinalysis.html">Urinalysis</a></li>
        `;
    } else {
        sidebar.innerHTML = `
            <li><a href="personal-info.html">Dashboard</a></li>
        `;
    }
}

// Function to load all doctors
function loadDoctors() {
    fetch('/api/alldoctors')
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
            const tbody = document.querySelector('#doctors-table tbody');
            tbody.innerHTML = ''; // Clear existing rows

            data.forEach(doctor => {
                const row = document.createElement('tr');
                row.innerHTML = `
                    <td>${doctor.doctor_id}</td>
                    <td>${doctor.first_name}</td>
                    <td>${doctor.last_name}</td>
                    <td>${doctor.specialty}</td>
                    <td>${doctor.office}</td>
                    <td>${doctor.phone}</td>
                    <td>${doctor.email}</td>
                    <td>${doctor.department_id}</td>
                    <td>
                        <button onclick="editDoctor(${doctor.doctor_id})">Edit</button>
                    </td>
                `;
                tbody.appendChild(row);
            });
        })
        .catch(error => {
            console.error('Error loading doctors:', error);
            feedback.textContent = 'Error loading doctors. Please try again later.';
        });
}

// Function to handle form submission for adding/updating doctors
doctorForm.addEventListener('submit', function (e) {
    e.preventDefault();

    const doctorId = doctorIdInput.value;
    const method = doctorId ? 'PUT' : 'POST'; // Use PUT for update, POST for create
    const url = doctorId ? `/api/alldoctors/${doctorId}` : '/api/alldoctors';

    const formData = {
        first_name: firstNameInput.value,
        last_name: lastNameInput.value,
        specialty: specialtyInput.value,
        office: officeInput.value,
        phone: phoneInput.value,
        email: emailInput.value,
        department_id: departmentIdInput.value,
        password: passwordInput.value
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
            loadDoctors();
            doctorForm.reset();
            doctorIdInput.value = ''; // Clear the hidden ID input
            formTitle.textContent = 'Add New Doctor';
        } else {
            alert(`Failed to save doctor: ${data.message}`);
        }
    })
    .catch(error => console.error('Error saving doctor:', error));
});

// Handle cancel button
cancelBtn.addEventListener('click', function () {
    doctorForm.reset();
    doctorIdInput.value = ''; // Clear the hidden ID input
    formTitle.textContent = 'Add New Doctor';
});
});

// Function to edit an existing doctor
function editDoctor(id) {
fetch(`/api/alldoctors/${id}`)
    .then(response => response.json())
    .then(data => {
        document.getElementById('doctor-id').value = data.doctor_id;
        document.getElementById('first-name').value = data.first_name;
        document.getElementById('last-name').value = data.last_name;
        document.getElementById('specialty').value = data.specialty;
        document.getElementById('office').value = data.office;
        document.getElementById('phone').value = data.phone;
        document.getElementById('email').value = data.email;
        document.getElementById('department-id').value = data.department_id;

        document.getElementById('form-title').textContent = 'Edit Doctor';
    })
    .catch(error => console.error('Error loading doctor:', error));
}

// Logout function to clear local storage and redirect to home page
function logout() {
localStorage.removeItem('userEmail');
localStorage.removeItem('userRole');
localStorage.removeItem('userName');

window.location.href = 'home.html';
}