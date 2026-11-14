# Healthcare Patient Care Coordination System

**Relational Database Design | MySQL Workbench | SQL**

## Project Overview

How can a healthcare organization organize patient, provider, department, and appointment information while maintaining relationships between records?

I developed this educational relational database project as part of my Introduction to Databases coursework at Georgia Gwinnett College. It demonstrates the process of moving from a visual database model to an implemented MySQL database, followed by data insertion, querying, and integrity testing.

## Development Process

### 1. Database Modeling

I began by creating an Enhanced Entity-Relationship (EER) diagram in MySQL Workbench. I designed four related tables—`PATIENT`, `HEALTHCARE_PROVIDER`, `DEPARTMENT`, and `APPOINTMENT`—and defined primary keys, foreign keys, and relationships to organize the data.

![EER diagram showing the four tables and their relationships](screenshots/database_eer_diagram.png)

*Figure 1. EER diagram of my Healthcare Patient Care Coordination System, designed in MySQL Workbench.*

### 2. Forward Engineering

After completing the model, I used MySQL Workbench's **Forward Engineering** feature to generate and execute the SQL statements that created the database tables. This step transformed the visual design into an implemented relational database **before** I began inserting records.

![MySQL Workbench Forward Engineering finished successfully](screenshots/forward_engineering_success.png)

*Figure 2. MySQL Workbench confirmation that Forward Engineering completed successfully.*

The generated database schema is saved in [`healthcare_database_schema.sql`](healthcare_database_schema.sql).

### 3. Data Insertion

I populated the four tables with fictional departments, providers, patients, and appointments using SQL `INSERT` statements. These sample records provided data for testing the relationships and writing queries.

### 4. SQL Queries and Analysis

I used `SELECT`, `JOIN`, `WHERE`, `COUNT`, `GROUP BY`, and `ORDER BY` to explore questions such as:

- Which patients have scheduled appointments?
- Which providers are those patients seeing?
- What are the appointment dates and statuses?
- Which department has the most scheduled appointments?

### 5. Data Integrity Testing

I tested how the database responds to invalid data, including an appointment referencing a nonexistent patient. I also explored missing values and added a `CHECK` constraint to restrict appointment statuses to `Scheduled`, `Completed`, or `Cancelled`.

Some statements in my original classroom SQL script intentionally trigger errors to demonstrate constraint behavior; they are learning exercises, not a single end-to-end executable setup script.

## Tools and Technologies

- **MySQL Workbench:** EER modeling, forward engineering, and SQL development
- **MySQL:** Relational database implementation
- **SQL:** Data insertion, querying, aggregation, and constraint testing

## What I Learned

This project helped me understand how database design connects to implementation. Before writing queries, I needed to consider how tables related to one another and how those relationships affect the data. Forward Engineering showed me how a visual model becomes a working database, while queries and constraint testing helped me explore how that design behaves.

## Future Development

As I continue developing my technical skills, I would like to expand this database by **adding more tables and relationships** that represent additional aspects of healthcare operations. This would give me opportunities to work with more complex relational structures and queries across a larger network of connected information.

I would also like to use Python or R to analyze and visualize appointment data and explore how structured healthcare information can support operational insights and decision-making.

---

*All patient and provider records in this project are fictional and used for educational purposes.*
