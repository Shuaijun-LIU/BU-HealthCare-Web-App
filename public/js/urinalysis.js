document.addEventListener('DOMContentLoaded', function () {
    const formTitle = document.getElementById('form-title');
    const urinalysisForm = document.getElementById('manage-urinalysis-form');
    const urinalysisIdInput = document.getElementById('urinalysis-id');
    const pHInput = document.getElementById('pH');
    const specificGravityInput = document.getElementById('specific-gravity');
    const glucoseInput = document.getElementById('glucose');
    const proteinInput = document.getElementById('protein');
    const bilirubinInput = document.getElementById('bilirubin');
    const urobilinogenInput = document.getElementById('urobilinogen');
    const bloodInput = document.getElementById('blood');
    const ketoneInput = document.getElementById('ketone');
    const nitriteInput = document.getElementById('nitrite');
    const leukocytesInput = document.getElementById('leukocytes');
    const ascorbicAcidInput = document.getElementById('ascorbic-acid');
    const clarityInput = document.getElementById('clarity');
    const colorInput = document.getElementById('color');
    const collectedAtInput = document.getElementById('collected-at');
    const doctorIdInput = document.getElementById('doctor-id');
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

        // Initial load of urinalysis records
        loadUrinalysis();
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

    // Function to load all urinalysis records
    function loadUrinalysis() {
        fetch('/api/urinalysis')
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
                const tbody = document.querySelector('#urinalysis-table tbody');
                tbody.innerHTML = ''; // Clear existing rows
    
                data.forEach(urinalysis => {
                    const row = document.createElement('tr');
                    row.innerHTML = `
                        <td>${urinalysis.urinalysis_id}</td>
                        <td>${urinalysis.pH}</td>
                        <td>${urinalysis.specific_gravity}</td>
                        <td>${urinalysis.glucose}</td>
                        <td>${urinalysis.protein}</td>
                        <td>${urinalysis.bilirubin}</td>
                        <td>${urinalysis.urobilinogen}</td>
                        <td>${urinalysis.blood}</td>
                        <td>${urinalysis.ketone}</td>
                        <td>${urinalysis.nitrite}</td>
                        <td>${urinalysis.leukocytes}</td>
                        <td>${urinalysis.ascorbic_acid}</td>
                        <td>${urinalysis.clarity}</td>
                        <td>${urinalysis.color}</td>
                        <td>${new Date(urinalysis.collected_at).toLocaleString()}</td>
                        <td>${urinalysis.doctor_id}</td>
                        <td>
                            <button onclick="editUrinalysis(${urinalysis.urinalysis_id})">Edit</button>
                        </td>
                    `;
                    tbody.appendChild(row);
                });
            })
            .catch(error => {
                console.error('Error loading urinalysis:', error);
                feedback.textContent = 'Error loading urinalysis. Please try again later.';
            });
    }

    // Function to handle form submission for adding/updating urinalysis records
    urinalysisForm.addEventListener('submit', function (e) {
        e.preventDefault();

        const urinalysisId = urinalysisIdInput.value;
        const method = urinalysisId ? 'PUT' : 'POST'; // Use PUT for update, POST for create
        const url = urinalysisId ? `/api/urinalysis/${urinalysisId}` : '/api/urinalysis';

        const formData = {
            pH: pHInput.value,
            specific_gravity: specificGravityInput.value,
            glucose: glucoseInput.value,
            protein: proteinInput.value,
            bilirubin: bilirubinInput.value,
            urobilinogen: urobilinogenInput.value,
            blood: bloodInput.value,
            ketone: ketoneInput.value,
            nitrite: nitriteInput.value,
            leukocytes: leukocytesInput.value,
            ascorbic_acid: ascorbicAcidInput.value,
            clarity: clarityInput.value,
            color: colorInput.value,
            collected_at: collectedAtInput.value,
            doctor_id: doctorIdInput.value,
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
                loadUrinalysis();
                urinalysisForm.reset();
                urinalysisIdInput.value = ''; // Clear the hidden ID input
                formTitle.textContent = 'Add New Urinalysis';
            } else {
                alert(`Failed to save urinalysis: ${data.message}`);
            }
        })
        .catch(error => console.error('Error saving urinalysis:', error));
    });

    // Handle cancel button
    cancelBtn.addEventListener('click', function () {
        urinalysisForm.reset();
        urinalysisIdInput.value = ''; // Clear the hidden ID input
        formTitle.textContent = 'Add New Urinalysis';
    });
});

// Function to edit an existing urinalysis record
function editUrinalysis(id) {
    fetch(`/api/urinalysis/${id}`)
        .then(response => response.json())
        .then(data => {
            document.getElementById('urinalysis-id').value = data.urinalysis_id;
            document.getElementById('pH').value = data.pH;
            document.getElementById('specific-gravity').value = data.specific_gravity;
            document.getElementById('glucose').value = data.glucose;
            document.getElementById('protein').value = data.protein;
            document.getElementById('bilirubin').value = data.bilirubin;
            document.getElementById('urobilinogen').value = data.urobilinogen;
            document.getElementById('blood').value = data.blood;
            document.getElementById('ketone').value = data.ketone;
            document.getElementById('nitrite').value = data.nitrite;
            document.getElementById('leukocytes').value = data.leukocytes;
            document.getElementById('ascorbic-acid').value = data.ascorbic_acid;
            document.getElementById('clarity').value = data.clarity;
            document.getElementById('color').value = data.color;
            document.getElementById('collected-at').value = new Date(data.collected_at).toISOString().slice(0, 16);
            document.getElementById('doctor-id').value = data.doctor_id;

            document.getElementById('form-title').textContent = 'Edit Urinalysis';
        })
        .catch(error => console.error('Error loading urinalysis:', error));
}

// Logout function to clear local storage and redirect to home page
function logout() {
    localStorage.removeItem('userEmail');
    localStorage.removeItem('userRole');
    localStorage.removeItem('userName');
    
    window.location.href = 'home.html';
}