// js/home.js

function openLoginModal(role) {
    document.getElementById('login-modal').style.display = 'flex';
    sessionStorage.setItem('currentRole', role);
}

function closeLoginModal() {
    document.getElementById('login-modal').style.display = 'none';
}

async function login() {
    const email = document.getElementById('email').value;
    const password = document.getElementById('password').value;
    const role = sessionStorage.getItem('currentRole'); 

    if (email && password) {
        try {
            const response = await fetch('/auth/login', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ email, password, role })
            });

            const data = await response.json();

            if (data.success) {
                localStorage.setItem('userEmail', email);
                localStorage.setItem('userRole', role);

                alert('Login successful!');
                closeLoginModal();
                showNavButtons();
            } else {
                alert(data.message); 
            }
        } catch (error) {
            console.error('Error during login:', error);
            alert('An error occurred during login. Please try again later.');
        }
    } else {
        alert('Please enter both email and password.');
    }
}

function showNavButtons() {
    const navButtons = document.getElementById('nav-buttons');
    navButtons.classList.remove('hidden');
    navButtons.innerHTML = ''; 

    const role = localStorage.getItem('userRole'); 

    if (role === 'student') {
        navButtons.innerHTML = `
            <a href="personal-info.html">Student Dashboard</a>
            <a href="student-appointment.html">Appointment</a>
            <a href="appointment-history.html">Medical History</a>
        `;
    } else if (role === 'doctor') {
        navButtons.innerHTML = `
            <a href="personal-info.html">Dashboard</a>
            <a href="manage-appointment.html">Manage Appointments</a>
            <a href="prescriptions.html">Prescriptions</a>
            <a href="urinalysis.html">Urinalysis</a>
        `;
    } else if (role === 'admin') {
        navButtons.innerHTML = `
            <a href="personal-info.html">Dashboard</a>
            <a href="manage-students.html">Students</a>
            <a href="manage-doctors.html">Doctors</a>
            <a href="manage-appointment.html">App</a>
            <a href="prescriptions.html">Prescriptions</a>
            <a href="urinalysis.html">Urinalysis</a>
        `;
    }
}

function checkLoginStatus() {
    const userEmail = localStorage.getItem('userEmail');
    const userRole = localStorage.getItem('userRole');

    if (userEmail && userRole) {
        showNavButtons();
    } else {
        openLoginModal('student'); 
    }
}

window.onload = checkLoginStatus;