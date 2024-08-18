# BU Student Health Care Web Application

This project is designed to help Boston University students, doctors, and administrators manage health-related tasks efficiently. The system includes functionalities for managing appointments, prescriptions, urinalysis records, and more. Users can register, log in, and utilize various health services provided by the Student Health Center.

## 🎨 Project Structure

```
BU HealthCare/
│
├── package-lock.json        # Automatically generated file by npm with exact versions of installed dependencies
├── package.json             # Contains project metadata, dependencies, scripts, etc.
├── addFK.sql                # SQL script for adding foreign key constraints to the database
├── createDB.sql             # SQL script for creating the initial database schema (tables, etc.)
├── insertDB.sql             # SQL script for inserting initial data into the database
├── server.js                # Main server file that sets up the application and starts the server
├── initDB.js                # JavaScript file used to initialize the database or run migrations
├── README.md                # Project documentation file
│
├── controllers/             # Contains application logic controllers
│   └── appController.js
│
├── models/                  # Handles database interactions
│   └── db.js
│
├── node_modules/            # Contains npm packages installed for the project
│
├── public/                  # Contains publicly accessible files
│   ├── css/                 # Stylesheets for different pages
│   │   ├── appointment-history.css
│   │   ├── home.css
│   │   ├── manage-appointment.css
│   │   ├── manage-doctors.css
│   │   ├── manage-students.css
│   │   ├── personal-info.css
│   │   ├── prescriptions.css
│   │   ├── student-appointment.css
│   │   └── urinalysis.css
│   ├── images/              # Directory for image assets
│   └── js/                  # JavaScript files for different pages
│       ├── app.js
│       ├── appointment-history.js
│       ├── home.js
│       ├── manage-appointment.js
│       ├── manage-doctors.js
│       ├── manage-students.js
│       ├── personal-info.js
│       ├── prescriptions.js
│       ├── student-appointment.js
│       └── urinalysis.js
│
├── routes/                  # Contains route management files
│   └── auth.js
```

### 📝 File Descriptions

- **package-lock.json**: Automatically generated file by npm with exact versions of installed dependencies.
- **package.json**: Contains project metadata, dependencies, scripts, etc.
- **addFK.sql**: SQL script for adding foreign key constraints to the database.
- **createDB.sql**: SQL script for creating the initial database schema (tables, etc.).
- **insertDB.sql**: SQL script for inserting initial data into the database.
- **server.js**: Main server file that sets up the application and starts the server.
- **initDB.js**: JavaScript file used to initialize the database or run migrations.
- **README.md**: This documentation file.
- **controllers/**: Contains application logic controllers.
  - **appController.js**: Handles logic for various routes and interactions with the database.
- **models/**: Manages database interactions.
  - **db.js**: Database connection and query handling.
- **node_modules/**: Contains npm packages installed for the project.
- **public/**: Contains static files for the front-end, including HTML, CSS, images, and JavaScript files.
  - **css/**: Directory for CSS files, each corresponding to a different page or component of the application.
  - **images/**: Directory for storing image assets used throughout the application.
  - **js/**: Directory for JavaScript files that manage client-side logic for different pages.
- **routes/**: Contains route definition files for the Express application.
  - **auth.js**: Manages user authentication routes.

## 🌐 Project Pages

1. **Home Page (`/`)**: The landing page for the application.
2. **Login Page (`/login`)**: Page where users can log in.
3. **Register Page (`/register`)**: Page where new users can register.
4. **Manage Appointments (`/manage-appointments`)**: Interface for viewing and managing appointments.
5. **Manage Doctors (`/manage-doctors`)**: Interface for managing doctor information.
6. **Manage Students (`/manage-students`)**: Interface for managing student information.
7. **Personal Info (`/personal-info`)**: Page for viewing and updating personal information.
8. **Prescriptions (`/prescriptions`)**: Interface for viewing and managing prescriptions.
9. **Urinalysis (`/urinalysis`)**: Interface for viewing and managing urinalysis records.

## 🚀 Getting Started

### Prerequisites

Ensure you have the following installed:

- **Node.js** (v14.x or higher)
- **npm** (v6.x or higher)
- **MySQL** (for database management)

### Installation

1. **Clone the repository:**
    ```sh
    git clone https://github.com/Shuaijun-LIU/BU-HealthCare-Web-App
    cd your_project_directory
    ```

2. **Install the dependencies:**
    ```sh
    npm install express body-parser mysql2 bcrypt jsonwebtoken express-session multer express-xml-bodyparser xml2js nodemon dotenv cors validator
    ```

3. **Install `nodemon` as a dev dependency to automatically restart the server on changes:**
    ```sh
    npm install --save-dev nodemon
    ```

### Configuration

1. **Ensure MySQL is running on your system.** The default configuration assumes MySQL is running on `localhost:3306`. You can adjust this in the `db.js` file.

2. **Initialize Database:**
    ```sh
    node initDB.js
    ```

### Running the Project

**Start the server using `nodemon`:**
```sh
npx nodemon server.js
```

**Alternatively, you can start the server directly with `node`:**
```sh
node server.js
```

### Accessing the Application

Once the server is running, open your web browser and navigate to:

```
http://localhost:3000
```

You will see the home page of the BU Student Health Care Web Application. From here, you can navigate to different sections using the sidebar.

## 🤝 Contributing

1. **Fork the repository.**
2. **Create a new branch (`git checkout -b feature-branch`).**
3. **Make your changes.**
4. **Commit your changes (`git commit -am 'Add new feature'`).**
5. **Push to the branch (`git push origin feature-branch`).**
6. **Create a new Pull Request.**

## 📜 License

This project is licensed under the **MIT License**. See the `LICENSE` file for more details.

## 🙏 Acknowledgements

- **Boston University Student Health Services**
- **Project Contributors**
