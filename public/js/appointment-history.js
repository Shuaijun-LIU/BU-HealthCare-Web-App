document.addEventListener('DOMContentLoaded', function () {
    const studentEmail = localStorage.getItem('userEmail'); 
    const feedback = document.getElementById('feedback');

    if (studentEmail) {
        console.log('Student Email:', studentEmail);

        // Fetch student name
        fetch(`/api/student?email=${studentEmail}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
                return response.json();
            })
            .then(data => {
                if (data.success) {
                    document.getElementById('student-name').textContent = `Welcome, ${data.name}`;
                } else {
                    feedback.textContent = 'Error: ' + data.message;
                }
            })
            .catch(error => {
                console.error('Error loading student name:', error);
                feedback.textContent = 'Error loading student name. Please try again later.';
            });

        // Fetch appointment history
        fetch(`/api/appointments?email=${studentEmail}`)
            .then(response => {
                if (!response.ok) {
                    throw new Error(`HTTP error! status: ${response.status}`);
                }
                return response.json();
            })
            .then(data => {
                console.log('Appointment Data:', data);
                if (data.success) {
                    const historyTableBody = document.getElementById('history-table').querySelector('tbody');
                    data.appointments.forEach(appointment => {
                        const row = document.createElement('tr');
                        row.innerHTML = `
                            <td>${appointment.type}</td>
                            <td>${appointment.doctor}</td>
                            <td>${appointment.date}</td>
                            <td>${appointment.time}</td>
                            <td>${appointment.diagnosis}</td>
                            <td>${appointment.prescription}</td>
                        `;
                        historyTableBody.appendChild(row);
                    });
                } else {
                    feedback.textContent = 'Error: ' + data.message;
                }
            })
            .catch(error => {
                console.error('Error loading appointments:', error);
                feedback.textContent = 'Error loading appointments. Please try again later.';
            });
    } else {
        feedback.textContent = 'Error: Student email not found.';
        console.error('Student email not found in localStorage.');
    }
});


// logout
function logout() {
    localStorage.removeItem('userEmail');
    localStorage.removeItem('userRole');

    window.location.href = 'home.html';
}