/* Populate the database with a pre-defined list of at least SIX skills.*/
INSERT INTO Skills (skill_name, skill_type)
VALUES 
('Java', 'Backend'),
('JavaScript', 'Frontend'),
('Python', 'Backend'),
('HTML', 'Frontend'),
('CSS', 'Frontend'),
('SQL', 'Database');

/* Create TWO pool members, each associated with at least TWO skills from the predefined list. Your dummy data should demonstrate a variety of levels of experience.*/
INSERT INTO PoolMembers (first_name, last_name, contact_email, phone_number, work_address, home_address)
VALUES
('Anakin', 'Skywalker', 'welcometothedarkside@hotmail.com', '123-456-7890', '123 this St', '456 that St');

INSERT INTO PoolMembers (first_name, last_name, contact_email, phone_number, work_address, home_address)
VALUES
('Peter', 'Parker', 'spiderman@hotmail.com', '987-654-3210', '765 That St', '432 this St');

INSERT INTO ProjectPoolMembers (project_id, pool_member_id, skill_id)
VALUES
(1, 2, 2),
(1, 1, 1),
(1, 2, 3),
(1, 1, 2);

/* Populate the database with TWO client records.*/
INSERT INTO Clients (organisation_name, contact_first_name, contact_last_name, email, address, preferred_contact_method)
VALUES
('Justice Leg', 'Bat', 'man', 'brucewayne@dcmail.com', '741 ekkik Close', 'Bat light');

INSERT INTO Clients (organisation_name, contact_first_name, contact_last_name, email, address, preferred_contact_method)
VALUES
('CoOperate Inc.', 'Regan', 'Jones', '132re@Cooperatemail.com', '567 myLord yard', 'text message');

/* Create ONE project that requires TWO of the pre-defined skills to complete.*/
INSERT INTO Projects (title, start_date, end_date, budget, description, phase)
VALUES
('Project Xi', '2023-04-01', '2023-09-30', 50000.00, 'A project made in Java and JavaScript', 'Design');

INSERT INTO ProjectPoolMembers (project_id, pool_member_id, skill_id)
VALUES
(1, 1, 1),
(1, 2, 2);

/* Query the database to receive a list of pool members that match the project’s requirements, and assign them to the project.*/
SELECT p.pool_member_id, p.first_name, p.last_name
FROM PoolMembers p
INNER JOIN ProjectPoolMembers ppm ON p.pool_member_id = ppm.pool_member_id
INNER JOIN Skills s ON ppm.skill_id = s.skill_id
WHERE s.skill_name IN ('Java', 'JavaScript')
AND ppm.project_id = 1;

UPDATE ProjectPoolMembers
SET phase = 'Development'
WHERE project_id = 1;

/*Additional SELECT statements to generate different reports for the project management team.*/
SELECT p.pool_member_id, p.first_name, p.last_name, s.skill_name, s.skill_type
FROM PoolMembers p
INNER JOIN ProjectPoolMembers ppm ON p.pool_member_id = ppm.pool_member_id
INNER JOIN Skills s ON ppm.skill_id = s.skill_id;

SELECT pr.title, pr.start_date, pr.end_date, pr.budget, pr.description, pr.phase,
       p.pool_member_id, p.first_name, p.last_name, s.skill_name, s.skill_type
FROM Projects pr
INNER JOIN ProjectPoolMembers ppm ON pr.project_id = ppm.project_id
INNER JOIN PoolMembers p ON ppm.pool_member_id = p.pool_member_id
INNER JOIN Skills s ON ppm.skill_id = s.skill_id;

SELECT c.organisation_name, c.contact_first_name, c.contact_last_name, c.email, c.address, c.preferred_contact_method,
       pr.title, pr.start_date, pr.end_date, pr.budget, pr.description, pr.phase
FROM Clients c
LEFT JOIN Projects pr ON c.client_id = pr.client_id;
