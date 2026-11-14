USE mydb;

INSERT INTO DEPARTMENT (DepartmentID, DepartmentName)
VALUES
(1, 'Cardiology'),
(2, 'Neurology'),
(3, 'Primary Care'),
(4, 'Orthopedics');

SELECT * FROM DEPARTMENT;

INSERT INTO HEALTHCARE_PROVIDER
VALUES
(101, 'Maya', 'Johnson', 'Cardiologist', 1),
(102, 'James', 'Carter', 'Neurologist', 2),
(103, 'Olivia', 'Brooks', 'Primary Care Physician', 3),
(104, 'Daniel', 'Reed', 'Orthopedic Specialist', 4); 

SELECT * FROM HEALTHCARE_PROVIDER

INSERT INTO PATIENT
VALUES
(201, 'Alicia', 'Brown', '1992-05-14', '4045550101', 'alicia@example.com'),
(202, 'Marcus', 'Davis', '1985-09-22', '4045550102', 'marcus@example.com'),
(203, 'sophia', 'Wilson', '2000-03-08', '4045550103', 'sophia@example.com'),
(204, 'Jordan', 'Taylor', '1978-11-30', '4045550104', 'jordan@example.com');

SELECT * FROM PATIENT;

INSERT INTO APPOINTMENT
VALUES
(301, 101, '2026-11-12 09:00:00', 'Scheduled', 201),
(302, 102, '2026-11-12 10:30:00', 'Scheduled', 202),
(303, 103, '2026-11-13 11:00:00', 'Completed', 203),
(304, 104, '2026-11-12 14:00:00', 'Cancelled', 204);

SELECT * FROM APPOINTMENT;

INSERT INTO APPOINTMENT
VALUES (305, 101, '2026-11-14 09:00:00', 'Scheduled', 999);

SELECT * FROM APPOINTMENT 
WHERE AppointmentID = 305;

INSERT INTO APPOINTMENT
VALUES (306, 101, '2026-11-14 10:00:00', 'Scheduled', NULL);

INSERT INTO APPOINTMENT 
VALUES (307, 101, '2026-11-14 11:00:00', 'Scheduled', 201);

DELETE FROM APPOINTMENT
WHERE AppointmentID = 307;

SELECT * FROM APPOINTMENT

ALTER TABLE APPOINTMENT 
ADD CONSTRAINT chk_appointment_status
CHECK (Status IN ('Scheduled', 'Completed', 'Cancelled'));

USE mydb;

INSERT INTO APPOINTMENT
VALUES (307, 101, '2026-11-14 11:00:00', 'Scheduld', 201);

-- Can I see which patients have appointments scheduled, along with their appointment dates and statuses?"
USE mydb;

SELECT
    P.FirstName,
    P.LastName,
    A.AppointmentDate,
    A.Status
FROM PATIENT AS P
JOIN APPOINTMENT AS A
    ON P.PatientID = A.PatientID;


-- Which patients have scheduled appointments?

SELECT
    P.FirstName,
    P.LastName,
    A.AppointmentDate,
    A.Status
FROM PATIENT AS P
JOIN APPOINTMENT AS A
    ON P.PatientID = A.PatientID
WHERE A.Status = 'Scheduled';


-- Which patients have scheduled appointments,
-- and which providers are they seeing?

SELECT
    P.FirstName AS PatientFirstName,
    P.LastName AS PatientLastName,
    H.FirstName AS ProviderFirstName,
    H.LastName AS ProviderLastName,
    A.AppointmentDate,
    A.Status
FROM PATIENT AS P
JOIN APPOINTMENT AS A
    ON P.PatientID = A.PatientID
JOIN HEALTHCARE_PROVIDER AS H
    ON A.ProviderID = H.ProviderID
WHERE A.Status = 'Scheduled';



-- Which department has the most scheduled appointments?

SELECT
    D.DepartmentName,
    COUNT(*) AS ScheduledAppointments
FROM DEPARTMENT AS D
JOIN HEALTHCARE_PROVIDER AS H
    ON D.DepartmentID = H.DepartmentID
JOIN APPOINTMENT AS A
    ON H.ProviderID = A.ProviderID
WHERE A.Status = 'Scheduled'
GROUP BY D.DepartmentName
ORDER BY ScheduledAppointments DESC;


INSERT INTO APPOINTMENT
    (AppointmentID, ProviderID, AppointmentDate, Status, PatientID)
VALUES
    (305, 101, '2026-11-15 10:00:00', 'Scheduled', 999);
