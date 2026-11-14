# Healthcare Patient Care Coordination System

**College Database Project | MySQL Workbench | SQL**

## About This Project

For my Introduction to Databases class at Georgia Gwinnett College, I built a database to organize patient information, healthcare providers, departments, and appointments.

Think of it as a way to keep related healthcare information in one place. Instead of looking through separate lists, you can connect the information to answer questions like: **Which patient has an appointment, and which provider are they seeing?**

This is a learning project, not a system used by a real healthcare organization.

## How I Built It

### 1. Planning the Database

I started by drawing a diagram in MySQL Workbench to plan how the information would be organized.

I created four tables for patients, healthcare providers, departments, and appointments. I then connected them so the database could keep track of how the information relates.

![Diagram showing how the four database tables connect](screenshots/database_eer_diagram.png)

### 2. Creating the Database

After finishing the diagram, I used a MySQL Workbench feature called **Forward Engineering**. It turned my design into the SQL instructions needed to create the database tables.

![MySQL Workbench showing the database was created successfully](screenshots/forward_engineering_success.png)

You can also view the [SQL file used to create the database structure](healthcare_database_schema.sql).

### 3. Adding Sample Information

Next, I added fictional patients, healthcare providers, departments, and appointments. This gave me information to work with while practicing SQL, the language used to communicate with a database.

### 4. Finding Information with SQL

I wrote SQL queries to search and connect information across the tables. For example, I could find patients with scheduled appointments, see their appointment dates, and identify which providers they were seeing.

![SQL query connecting patients with their appointments](screenshots/patient_appointment_join.png)

This query brings patient names, appointment dates, and appointment statuses together in one set of results.

### 5. Checking for Errors

I also tested how the database handles incorrect information. For example, I tried adding an appointment for a patient who wasn't in the database.

I added a rule to limit appointment statuses to **Scheduled**, **Completed**, or **Cancelled**. These tests helped me understand how a database can prevent certain mistakes.

Some of my class exercises intentionally included incorrect entries to test these rules.

## Tools I Used

- **MySQL Workbench:** To design the database and work with it
- **MySQL:** To store and organize the information
- **SQL:** To add, find, and check information

## What I Learned

This project helped me see how a database comes together, from planning the tables to using them to answer questions.

I also learned why connecting information correctly matters. A database isn't just about storing records. It's about organizing them so the information is useful and mistakes can be caught.

## What's Next

I'd like to expand the project by adding more tables and connecting more types of healthcare information. As I continue learning, I also want to use Python or R to explore the data and create charts.

---

*All patient and provider information in this project is fictional and used for classwork.*
