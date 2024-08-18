document.addEventListener('DOMContentLoaded', function () {
    const formTitle = document.getElementById('form-title');
    const studentForm = document.getElementById('manage-student-form');
    const studentIdInput = document.getElementById('student-id');
    const firstNameInput = document.getElementById('first-name');
    const lastNameInput = document.getElementById('last-name');
    const dobInput = document.getElementById('dob');
    const phoneInput = document.getElementById('phone');
    const emailInput = document.getElementById('email');
    const sexInput = document.getElementById('sex');
    const maritalStatusInput = document.getElementById('marital-status');
    const ethnicityInput = document.getElementById('ethnicity');
    const nationalityInput = document.getElementById('nationality');
    const bloodTypeInput = document.getElementById('blood-type');
    const heightInput = document.getElementById('height');
    const weightInput = document.getElementById('weight');
    const bloodPressureInput = document.getElementById('blood-pressure');
    const bmiInput = document.getElementById('bmi');
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

        // Initial load of students
        loadStudents();
    } else {
        feedback.textContent = 'Error: User email not found.';
        console.error('User email not found in localStorage.');
    }

    // Generate sidebar based on the user role (admin)
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
        }
    }

    // Function to load all students
    function loadStudents() {
        fetch('/api/allstudents')
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
                const tbody = document.querySelector('#students-table tbody');
                tbody.innerHTML = ''; // Clear existing rows
    
                data.forEach(student => {
                    const row = document.createElement('tr');
                    row.innerHTML = `
                        <td>${student.student_id}</td>
                        <td>${student.first_name}</td>
                        <td>${student.last_name}</td>
                        <td>${new Date(student.dob).toLocaleDateString()}</td>
                        <td>${student.phone}</td>
                        <td>${student.email}</td>
                        <td>
                            <button onclick="editStudent(${student.student_id})">Edit</button>
                        </td>
                    `;
                    tbody.appendChild(row);
                });
            })
            .catch(error => {
                console.error('Error loading students:', error);
                feedback.textContent = 'Error loading students. Please try again later.';
            });
    }

    // Function to handle form submission for adding/updating students
    studentForm.addEventListener('submit', function (e) {
        e.preventDefault();

        const studentId = studentIdInput.value;
        const method = studentId ? 'PUT' : 'POST'; // Use PUT for update, POST for create
        const url = studentId ? `/api/allstudents/${studentId}` : '/api/allstudents';

        const formData = {
            first_name: firstNameInput.value,
            last_name: lastNameInput.value,
            dob: dobInput.value,
            phone: phoneInput.value,
            email: emailInput.value,
            sex: sexInput.value,
            marital_status: maritalStatusInput.value,
            ethnicity: ethnicityInput.value,
            nationality: nationalityInput.value,
            blood_type: bloodTypeInput.value,
            height: heightInput.value,
            weight: weightInput.value,
            blood_pressure: bloodPressureInput.value,
            bmi: bmiInput.value,
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
                loadStudents();
                studentForm.reset();
                studentIdInput.value = ''; // Clear the hidden ID input
                formTitle.textContent = 'Add New Student';
            } else {
                alert(`Failed to save student: ${data.message}`);
            }
        })
        .catch(error => console.error('Error saving student:', error));
    });

    // Handle cancel button
    cancelBtn.addEventListener('click', function () {
        studentForm.reset();
        studentIdInput.value = ''; // Clear the hidden ID input
        formTitle.textContent = 'Add New Student';
    });
});

// Function to edit an existing student
function editStudent(id) {
    fetch(`/api/allstudents/${id}`)
        .then(response => response.json())
        .then(data => {
            document.getElementById('student-id').value = data.student_id;
            document.getElementById('first-name').value = data.first_name;
            document.getElementById('last-name').value = data.last_name;
            document.getElementById('dob').value = data.dob;
            document.getElementById('phone').value = data.phone;
            document.getElementById('email').value = data.email;
            document.getElementById('sex').value = data.sex;
            document.getElementById('marital-status').value = data.marital_status;
            document.getElementById('ethnicity').value = data.ethnicity;
            document.getElementById('nationality').value = data.nationality;
            document.getElementById('blood-type').value = data.blood_type;
            document.getElementById('height').value = data.height;
            document.getElementById('weight').value = data.weight;
            document.getElementById('blood-pressure').value = data.blood_pressure;
            document.getElementById('bmi').value = data.bmi;

            document.getElementById('form-title').textContent = 'Edit Student';
        })
        .catch(error => console.error('Error loading student:', error));
}

// Logout function to clear local storage and redirect to home page
function logout() {
    localStorage.removeItem('userEmail');
    localStorage.removeItem('userRole');
    localStorage.removeItem('userName');
    
    window.location.href = 'home.html';
}