document.addEventListener('DOMContentLoaded', function () {
    const userEmail = localStorage.getItem('userEmail');
    const userRole = localStorage.getItem('userRole'); 
    const feedback = document.getElementById('feedback');

    // Function to generate the sidebar based on the user role
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

    if (userEmail) {
        fetch(`/api/personal-info?email=${userEmail}&role=${userRole}`)
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    document.getElementById('user-name').textContent = `Welcome, ${data.first_name} ${data.last_name}`;
                    document.getElementById('first-name').value = data.first_name;
                    document.getElementById('last-name').value = data.last_name;
                    document.getElementById('phone').value = data.phone;
                    document.getElementById('email').value = data.email;

                    // Generate sidebar based on the user role
                    generateSidebar(userRole);
                    
                    if (userRole === 'student') {
                        document.getElementById('dob').value = new Date(data.dob).toISOString().substring(0, 10);
                        document.getElementById('sex').value = data.sex;
                        document.getElementById('marital-status').value = data.marital_status;
                        document.getElementById('ethnicity').value = data.ethnicity;
                        document.getElementById('nationality').value = data.nationality;
                        document.getElementById('blood-type').value = data.blood_type;
                        document.getElementById('height').value = data.height;
                        document.getElementById('weight').value = data.weight;
                        document.getElementById('blood-pressure').value = data.blood_pressure;
                        document.getElementById('bmi').value = data.bmi;
                        document.getElementById('dob').required = true;
                    } else if (userRole === 'doctor') {
                        document.getElementById('specialty').value = data.specialty;
                        document.getElementById('office').value = data.office;
                        document.getElementById('department').value = data.department_id;
                        document.getElementById('dob').required = false;
                        document.getElementById('dob').disabled = true;
                    } else if (userRole === 'admin') {
                        document.getElementById('dob').required = false;
                        document.getElementById('dob').disabled = true;
                    }

                } else {
                    feedback.textContent = 'Error: ' + data.message;
                }
            })
            .catch(error => console.error('Error loading personal info:', error));

        if (userRole === 'student') {
            document.getElementById('student-fields').style.display = 'block';
        } else if (userRole === 'doctor') {
            document.getElementById('doctor-fields').style.display = 'block';
        } else if (userRole === 'admin') {
            document.getElementById('admin-fields').style.display = 'block';
        }
    } else {
        feedback.textContent = 'Error: User email not found.';
    }

    document.getElementById('personal-info-form').addEventListener('submit', function (e) {
        e.preventDefault();

        const formData = {
            email: document.getElementById('email').value,
            first_name: document.getElementById('first-name').value,
            last_name: document.getElementById('last-name').value,
            phone: document.getElementById('phone').value,
            role: userRole
        };

        if (userRole === 'student') {
            Object.assign(formData, {
                dob: document.getElementById('dob').value,
                sex: document.getElementById('sex').value,
                marital_status: document.getElementById('marital-status').value,
                ethnicity: document.getElementById('ethnicity').value,
                nationality: document.getElementById('nationality').value,
                blood_type: document.getElementById('blood-type').value,
                height: document.getElementById('height').value,
                weight: document.getElementById('weight').value,
                blood_pressure: document.getElementById('blood-pressure').value,
                bmi: document.getElementById('bmi').value
            });
        } else if (userRole === 'doctor') {
            Object.assign(formData, {
                specialty: document.getElementById('specialty').value,
                office: document.getElementById('office').value,
                department: document.getElementById('department').value
            });
        }

        fetch('/api/update-personal-info', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(formData)
        })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    feedback.textContent = 'Information updated successfully!';
                    feedback.style.color = 'green';
                } else {
                    feedback.textContent = `Failed to update information: ${data.message}`;
                    feedback.style.color = 'red';
                }
            })
            .catch(error => {
                console.error('Error updating personal info:', error);
                feedback.textContent = 'An error occurred. Please try again.';
                feedback.style.color = 'red';
            });
    });
});

// logout function to clear local storage and redirect to home page
function logout() {
    localStorage.removeItem('userEmail');
    localStorage.removeItem('userRole');

    window.location.href = 'home.html';
}