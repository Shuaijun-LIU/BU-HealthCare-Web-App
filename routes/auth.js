const express = require('express');
const router = express.Router();
const pool = require('../models/db'); 


router.post('/login', async (req, res) => {
    const { email, password, role } = req.body;

    let query = '';
    if (role === 'student') {
        query = 'SELECT * FROM student WHERE email = ? AND password = ?';
    } else if (role === 'doctor') {
        query = 'SELECT * FROM doctor WHERE email = ? AND password = ?';
    } else if (role === 'admin') {
        query = 'SELECT * FROM administrator WHERE email = ? AND password = ?';
    } else {
        return res.status(400).json({ error: 'Invalid role specified' });
    }

    try {
        const [rows] = await pool.execute(query, [email, password]);
        if (rows.length > 0) {
            res.json({ success: true, message: 'Login successful', role });
        } else {
            res.status(401).json({ success: false, message: 'Invalid email or password' });
        }
    } catch (error) {
        console.error(error);
        res.status(500).json({ success: false, message: 'An error occurred while processing your request' });
    }
});

module.exports = router;