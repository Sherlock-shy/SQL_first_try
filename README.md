<h2>SQL_first_try</h2>

<h2>Description</h2>
This is a project that let me get my hands on SQL for creating a database and learn more on that. 

<h2>Environment used</h2>
- VS code
- MyphpAdmin

<h2>Resources used</h2>
- w3school(https://www.w3schools.com/)

<h2>Skills learnt/used</h2>

- SQL<br>

<h2>Overview</h2>

<h4>portfolio r1.sql</h4>

SQL for basic table structure and dumping data into it.

<h4>porfolio r2.sql</h4>


Populate the database with a pre-defined list of at least SIX skills:
Create TWO pool members, each associated with at least TWO skills from the predefined list with my own dummy data:

Populate the database with TWO client records:

Create ONE project that requires TWO of the pre-defined skills to complete:


Query the database to receive a list of pool members that match the project’s requirements, and assign them to the project:

Adding Additional SELECT statements to generate different reports for the project management team:

<h2>Conclusion</h2>

One or more of my DML statements was found to be broken (this could be due to duplicate entries for PRIMARY keys related to the order of the statements in the SQL files), but it was fine when I test it on my own. I thought I did consider enough many-to-many relationships for this particular problem which indicates missing steps during the normalisation process, but turns out no. I have only considered one-to-one and/or one-to-many relationships which indicates some degree of normalisation. The tables contain enough data (more than 1.8 tuples per table). This indicates correct INSERT statements. With various data types considered, enforcing domain constraints in my database. Date or datetime data types in my tables is a good use of understanding domain integrity constraints.
I should consider the use of CHECK keyword to enforce domain and/or user-defined constraints and the use of ENUM keyword to enforce domain and/or user-defined constraints. 

I have used the DEFAULT keyword demonstrating an good understanding of enforcing domain and user-defined constraints. My database schema contains at least 5 PKs (simple and composite). 

Database has the expected number of tables given the particular problem. None or just one table is found to have no FK constraints indicating a normalised database.



