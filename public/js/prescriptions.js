document.addEventListener('DOMContentLoaded', function () {
    const formTitle = document.getElementById('form-title');
    const prescriptionForm = document.getElementById('manage-prescription-form');
    const prescriptionIdInput = document.getElementById('prescription-id');
    const medicineIdInput = document.getElementById('medicine-id');
    const prescribedAtInput = document.getElementById('prescribed-at');
    const durationInput = document.getElementById('duration');
    const commentsInput = document.getElementById('comments');
    const cancelBtn = document.getElementById('cancel-btn');

    // Load user role and name from localStorage
    const userEmail = localStorage.getItem('userEmail');
    const userRole = localStorage.getItem('userRole');
    const userNameElement = document.getElementById('user-name');
    const feedback = document.getElementById('feedback');


    if (userEmail) {
        // Fetch user name
        fetch(`/api/personal-info?email=${userEmail}&role=${userRole}`)
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    userNameElement.textContent = `Welcome, ${data.first_name} ${data.last_name}`;
                } else {
                    feedback.textContent = 'Error: ' + data.message;
                }
            })
            .catch(error => console.error('Error loading user name:', error));

        // Generate the sidebar based on the user role
        generateSidebar(userRole);

        // Initial load of prescriptions
        loadPrescriptions();
    } else {
        feedback.textContent = 'Error: User email not found.';
    }

        // Generate sidebar based on the user role (student, doctor, admin)
        function generateSidebar(role) {
            const sidebar = document.querySelector('.sidebar ul');
            sidebar.innerHTML = ''; // Clear existing sidebar items
    
            if (role === 'doctor') {
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

    // Function to load all prescriptions
    function loadPrescriptions() {
        fetch('/api/prescriptions')
            .then(response => response.json())
            .then(data => {
                const tbody = document.querySelector('#prescriptions-table tbody');
                tbody.innerHTML = ''; // Clear existing rows

                data.forEach(prescription => {
                    const row = document.createElement('tr');
                    row.innerHTML = `
                        <td>${prescription.prescription_id}</td>
                        <td>${prescription.medicine_id}</td>
                        <td>${new Date(prescription.prescribed_at).toLocaleString()}</td>
                        <td>${prescription.duration}</td>
                        <td>${prescription.comments || ''}</td>
                        <td>
                            <button onclick="editPrescription(${prescription.prescription_id})">Edit</button>
                        </td>
                    `;
                    tbody.appendChild(row);
                });
            })
            .catch(error => console.error('Error loading prescriptions:', error));
    }

    // Function to handle form submission for updating prescriptions
    prescriptionForm.addEventListener('submit', function (e) {
        e.preventDefault();

        const prescriptionId = prescriptionIdInput.value;
        const url = `/api/prescriptions/${prescriptionId}`;

        const formData = {
            medicine_id: medicineIdInput.value,
            prescribed_at: prescribedAtInput.value,
            duration: durationInput.value,
            comments: commentsInput.value
        };

        fetch(url, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(formData)
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                loadPrescriptions();
                prescriptionForm.reset();
                prescriptionIdInput.value = ''; // Clear the hidden ID input
                formTitle.textContent = 'Edit Prescription';
            } else {
                alert(`Failed to update prescription: ${data.message}`);
            }
        })
        .catch(error => console.error('Error updating prescription:', error));
    });

    // Handle cancel button
    cancelBtn.addEventListener('click', function () {
        prescriptionForm.reset();
        prescriptionIdInput.value = ''; // Clear the hidden ID input
        formTitle.textContent = 'Edit Prescription';
    });
});

// Function to edit an existing prescription
function editPrescription(id) {
    fetch(`/api/prescriptions/${id}`)
        .then(response => response.json())
        .then(data => {
            document.getElementById('prescription-id').value = data.prescription_id;
            document.getElementById('medicine-id').value = data.medicine_id;
            document.getElementById('prescribed-at').value = new Date(data.prescribed_at).toISOString().slice(0, 16);
            document.getElementById('duration').value = data.duration;
            document.getElementById('comments').value = data.comments || '';

            document.getElementById('form-title').textContent = 'Edit Prescription';
        })
        .catch(error => console.error('Error loading prescription:', error));
}

// Logout function to clear local storage and redirect to home page
function logout() {
    localStorage.removeItem('userEmail');
    localStorage.removeItem('userRole');
    localStorage.removeItem('userName');

    window.location.href = 'home.html';
}