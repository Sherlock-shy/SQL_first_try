-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 10, 2023 at 04:13 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `portfolio`
--

-- --------------------------------------------------------

--
-- Table structure for table `clients`
--

CREATE TABLE `clients` (
  `client_id` int(11) NOT NULL,
  `organisation_name` varchar(255) NOT NULL,
  `contact_first_name` varchar(255) NOT NULL,
  `contact_last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `preferred_contact_method` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `clients`
--

INSERT INTO `clients` (`client_id`, `organisation_name`, `contact_first_name`, `contact_last_name`, `email`, `address`, `preferred_contact_method`) VALUES
(1, 'Avengers', 'Tony', 'Stark', 'iloveyou3000@marvel.com', '85 Middle St', 'Email'),
(2, 'EmailBot', 'Wall', 'E', 'DsineyLand@mail.com', '999 high road', 'Post');

-- --------------------------------------------------------

--
-- Table structure for table `poolmembers`
--

CREATE TABLE `poolmembers` (
  `pool_member_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `contact_email` varchar(255) NOT NULL,
  `phone_number` varchar(255) NOT NULL,
  `work_address` varchar(255) NOT NULL,
  `home_address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `poolmembers`
--

INSERT INTO `poolmembers` (`pool_member_id`, `first_name`, `last_name`, `contact_email`, `phone_number`, `work_address`, `home_address`) VALUES
(1, 'John', 'weck', 'donttouchmydogorikillyou@email.com', '123-456-7890', '12 Duck St', '300 Cryhell close'),
(2, 'Sherlock', 'Holmes', 'greatdetective@watson.com', '987-654-3210', '221B baker St', '221B baker St');

-- --------------------------------------------------------

--
-- Table structure for table `projectpoolmembers`
--

CREATE TABLE `projectpoolmembers` (
  `project_pool_member_id` int(11) NOT NULL,
  `project_id` int(11) DEFAULT NULL,
  `pool_member_id` int(11) DEFAULT NULL,
  `skill_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

-- --------------------------------------------------------

--
-- Table structure for table `projects`
--

CREATE TABLE `projects` (
  `project_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `budget` decimal(10,2) NOT NULL,
  `description` varchar(255) NOT NULL,
  `phase` varchar(255) NOT NULL,
  `client_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `projects`
--

INSERT INTO `projects` (`project_id`, `title`, `start_date`, `end_date`, `budget`, `description`, `phase`, `client_id`) VALUES
(1, 'Project Xi', '2023-04-01', '2023-09-30', '50000.00', 'Skills neede: Java and JavaScript', 'Design', NULL),
(2, 'Project Yi', '2023-05-01', '2023-11-30', '75000.00', 'Skills needed: Python and SQL', 'Development', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `skills`
--

CREATE TABLE `skills` (
  `skill_id` int(11) NOT NULL,
  `skill_name` varchar(255) NOT NULL,
  `skill_type` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `skills`
--

INSERT INTO `skills` (`skill_id`, `skill_name`, `skill_type`) VALUES
(1, 'Java', 'Backend'),
(2, 'JavaScript', 'Frontend'),
(3, 'Python', 'Backend'),
(4, 'HTML', 'Frontend'),
(5, 'CSS', 'Frontend'),
(6, 'SQL', 'Database');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`client_id`);

--
-- Indexes for table `poolmembers`
--
ALTER TABLE `poolmembers`
  ADD PRIMARY KEY (`pool_member_id`);

--
-- Indexes for table `projectpoolmembers`
--
ALTER TABLE `projectpoolmembers`
  ADD PRIMARY KEY (`project_pool_member_id`),
  ADD KEY `project_id` (`project_id`),
  ADD KEY `pool_member_id` (`pool_member_id`),
  ADD KEY `skill_id` (`skill_id`);

--
-- Indexes for table `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`project_id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `skills`
--
ALTER TABLE `skills`
  ADD PRIMARY KEY (`skill_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clients`
--
ALTER TABLE `clients`
  MODIFY `client_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `poolmembers`
--
ALTER TABLE `poolmembers`
  MODIFY `pool_member_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `projectpoolmembers`
--
ALTER TABLE `projectpoolmembers`
  MODIFY `project_pool_member_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `projects`
--
ALTER TABLE `projects`
  MODIFY `project_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `skills`
--
ALTER TABLE `skills`
  MODIFY `skill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `projectpoolmembers`
--
ALTER TABLE `projectpoolmembers`
  ADD CONSTRAINT `projectpoolmembers_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`),
  ADD CONSTRAINT `projectpoolmembers_ibfk_2` FOREIGN KEY (`pool_member_id`) REFERENCES `poolmembers` (`pool_member_id`),
  ADD CONSTRAINT `projectpoolmembers_ibfk_3` FOREIGN KEY (`skill_id`) REFERENCES `skills` (`skill_id`);

--
-- Constraints for table `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
