require('dotenv').config();
const mysql = require('mysql2');

// Create a MySQL connection pool
const pool = mysql.createPool({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    waitForConnections: true,
    connectionLimit: 10,  // Limit the number of concurrent connections
    queueLimit: 0
});

// Export the pool for use in other files
module.exports = pool.promise();  // Use promise-based API for cleaner async/await syntax