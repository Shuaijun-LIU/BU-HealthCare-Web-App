require('dotenv').config();
const mysql = require('mysql2');
const fs = require('fs');
const path = require('path');

// Create a MySQL connection
const connection = mysql.createConnection({
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    multipleStatements: true // Allows executing multiple SQL queries in one statement
});

// Read SQL files
const createDBScript = fs.readFileSync(path.join(__dirname, 'createDB.sql'), 'utf8');
const insertDBScript = fs.readFileSync(path.join(__dirname, 'insertDB.sql'), 'utf8');
const addFKScript = fs.readFileSync(path.join(__dirname, 'addFK.sql'), 'utf8');

// Function to log the success of each table creation or data insertion
const logSuccess = (message) => {
    console.log(message);
};

// Connect to MySQL
connection.connect((err) => {
    if (err) {
        console.error('Database connection failed: ' + err.stack);
        return;
    }
    console.log('Connected to MySQL');

    // Drop the database if it exists
    const dropDB = 'DROP DATABASE IF EXISTS bu_health_care';
    connection.query(dropDB, (err, result) => {
        if (err) {
            console.error('Failed to drop database: ' + err.message);
            connection.end();
            return;
        }

        logSuccess('Database dropped');

        // Run the createDB.sql script
        connection.query(createDBScript, (err, results) => {
            if (err) {
                console.error('Failed to create database: ' + err.message);
                connection.end();
                return;
            }
            logSuccess('Database bu_health_care created successfully');

            // After creating the database, switch to it and run insertDB.sql
            connection.changeUser({ database: 'bu_health_care' }, (err) => {
                if (err) {
                    console.error('Failed to switch to bu_health_care database: ' + err.message);
                    connection.end();
                    return;
                }

                // Split the insert script into individual queries to log each success
                const insertQueries = insertDBScript.split(';').filter(query => query.trim());

                const runInsertQueries = (queries, callback) => {
                    if (queries.length === 0) {
                        logSuccess('All data inserted successfully');
                        callback(); // Run the next step (add foreign keys)
                        return;
                    }

                    const query = queries.shift();
                    connection.query(query, (err, results) => {
                        if (err) {
                            console.error('Failed to insert data: ' + err.message);
                        } else {
                            logSuccess(`Successfully executed: ${query.trim().split('\n')[0]}...`);
                        }
                        runInsertQueries(queries, callback);
                    });
                };

                // Run the insert queries and then add the foreign keys
                runInsertQueries(insertQueries, () => {
                    connection.query(addFKScript, (err, results) => {
                        if (err) {
                            console.error('Failed to add foreign keys: ' + err.message);
                        } else {
                            logSuccess('Foreign keys added successfully');
                        }
                        connection.end(); // Close the connection after everything is done
                    });
                });
            });
        });
    });
});