-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jan 06, 2017 at 09:43 AM
-- Server version: 10.1.19-MariaDB
-- PHP Version: 5.6.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `xyz_academy`
--

-- --------------------------------------------------------

--
-- Table structure for table `persistent_logins`
--

CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin`
--

CREATE TABLE `tbl_admin` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_admin`
--

INSERT INTO `tbl_admin` (`username`, `password`, `enabled`) VALUES
('bibek', 'bibek123', 1),
('john', 'john123', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_admin_roles`
--

CREATE TABLE `tbl_admin_roles` (
  `admin_role_id` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `role` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_admin_roles`
--

INSERT INTO `tbl_admin_roles` (`admin_role_id`, `username`, `role`) VALUES
(2, 'bibek', 'ROLE_ADMIN'),
(1, 'john', 'ROLE_USER');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_courses`
--

CREATE TABLE `tbl_courses` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `fees` double NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_courses`
--

INSERT INTO `tbl_courses` (`course_id`, `course_name`, `description`, `fees`, `added_date`, `modified_date`, `status`) VALUES
(1, 'Advance Java(J2EE)', 'Summary of Key Learningss\r\nLearn the core concepts of an object?oriented programming language (Java)\r\nComplement front?end skills by building functional web applications using JSP, Servlet, Spring framework\r\nImplement your web applications using database solutions (mySQL)', 20000, '2016-12-13 10:41:38', NULL, 1),
(2, 'ASP.NET MVC', 'Summary of Key Learnings\r\nLearn the core concepts of an object‐oriented programming language (C#, .NET)\r\nComplement front‐end skills by building functional web applications using ASP.NET, MVC framework\r\nImplement your web applications using database solutions (SQLServer)', 20000, '2016-12-11 04:21:02', NULL, 0),
(3, 'Core JAVA', 'Core JAVA Core JAVA Core JAVA', 12000, '2016-12-11 06:49:02', NULL, 1),
(4, 'PHP & JS', 'Summary of Key Learnings\r\nLearn the core concepts of Web Development using PHP\r\nComplement front&#8208;end skills by building functional web applications using HTML, JavaScript, CSS, JQuery, AngularJS, PHP, REST\r\nImplement your web applications using database solutions (mySQL)', 12000, '2016-12-13 10:41:10', NULL, 1),
(5, 'Python', 'Python Python Python', 20000, '2016-12-16 14:47:00', NULL, 1),
(7, 'Front End Design', 'HTML, CSS, Bootstrap, JavaScript', 16000, '2016-12-17 14:27:14', NULL, 0),
(8, 'JavaScript', 'Angular JS + Node JS', 16000, '2017-01-06 08:27:40', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_enquiry`
--

CREATE TABLE `tbl_enquiry` (
  `enquiry_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact_no` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `enquiry_status_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_enquiry`
--

INSERT INTO `tbl_enquiry` (`enquiry_id`, `first_name`, `last_name`, `email`, `contact_no`, `message`, `added_date`, `enquiry_status_id`, `course_id`) VALUES
(1, 'Ruman', 'Dangol', 'ruman@gmail.com', '982301922', 'I''m interested in Java Programming.', '2016-12-11 04:22:42', 1, 1),
(2, 'Bibek', 'Bagdash', 'bagdashbabu@gmail.com', '988236231', 'I''m interested in Asp .Net', '2016-12-11 04:22:42', 2, 2),
(5, 'Ruman', 'Dangol', 'ruman@gmail.com', '982301922', 'I''m interested in Java Programming & JavaScript', '2016-12-13 16:18:08', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_enquiry_status`
--

CREATE TABLE `tbl_enquiry_status` (
  `enquiry_status_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `color` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_enquiry_status`
--

INSERT INTO `tbl_enquiry_status` (`enquiry_status_id`, `type`, `color`) VALUES
(1, 'Pending', 'Pink'),
(2, 'Enrolled', 'Green'),
(3, 'Not Interested', 'Red'),
(4, 'Interested', 'Yellow');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_isp`
--

CREATE TABLE `tbl_isp` (
  `isp_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_isp`
--

INSERT INTO `tbl_isp` (`isp_id`, `name`, `value`) VALUES
(1, 'Vianet Communication', 'smtp.vianet.com.np'),
(2, 'Worldlink', 'smtp.wlink.com.np'),
(3, 'ADSL', 'smtp.ntc.com.np');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_mailing_address`
--

CREATE TABLE `tbl_mailing_address` (
  `mailing_address_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_mailing_address`
--

INSERT INTO `tbl_mailing_address` (`mailing_address_id`, `name`, `email`) VALUES
(1, 'zak', 'mgr.amrit1@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_settings`
--

CREATE TABLE `tbl_settings` (
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_settings`
--

INSERT INTO `tbl_settings` (`name`, `value`) VALUES
('EMAIL_FROM', 'admin@leapfrog.academy'),
('EMAIL_HOST', 'smtp.wlink.com.np');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_students`
--

CREATE TABLE `tbl_students` (
  `student_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact_no` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_students`
--

INSERT INTO `tbl_students` (`student_id`, `first_name`, `last_name`, `email`, `contact_no`, `address`, `added_date`, `modified_date`, `status`, `course_id`) VALUES
(1, 'Kripesh', 'Lamichhane', 'kripeshlamichhane@gmail.com', '98342632224', 'lokanthali, Bhaktapur', '2017-01-02 08:23:03', NULL, 1, 2),
(2, 'Ayush', 'Dumre', 'ayushdumre@gmail.com', '982322320', 'Buhumai, Nawalparasi', '2016-12-17 14:01:37', NULL, 1, 2),
(3, 'Rahul', 'Pantha', 'rahoool@gmail.com', '92837263t2', 'Buddhanagar, Rupandehi', '2016-12-17 14:01:58', NULL, 1, 3),
(4, 'Sangharsha', 'Chaulagain', 'sangharsha@gmail.com', '9876543366', 'Kathmandu', '2016-12-17 14:01:48', NULL, 0, 5),
(5, 'Vijay', 'Chhettri', 'mevj99@gmail.com', '98490283634', 'Kathmandu, Nepal', '2016-12-26 03:13:40', NULL, 1, 1),
(6, 'Bibek', 'Thapa', 'bibek.thapahere@gmail.com', '9865558', 'Kathmandu, Nepal', '2016-12-27 05:40:51', NULL, 0, 1),
(7, 'Jessica', 'Sharma', 'jessica121@gmail.com', '9876345354', 'Kathmandu, Nepal', '2017-01-02 08:24:50', NULL, 0, 2),
(8, 'Amrit', 'Magar', 'mgr.amrit1@gmail.com', '9834365438', 'kathmandu, Nepal', '2017-01-06 08:37:40', NULL, 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tutors`
--

CREATE TABLE `tbl_tutors` (
  `tutor_id` int(11) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact_no` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `added_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modified_date` timestamp NULL DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  `course_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_tutors`
--

INSERT INTO `tbl_tutors` (`tutor_id`, `first_name`, `last_name`, `email`, `contact_no`, `address`, `added_date`, `modified_date`, `status`, `course_id`) VALUES
(1, 'Dixanta', 'Bahadur Shrestha', 'shresthdix@gmail.com', '9854422032', 'Bhaktapur', '2016-12-13 16:23:08', NULL, 1, 1),
(2, 'Arun', 'Joshi', 'arunjoshi@gmail.com', '9834263623', 'New-Baneshwor, Kathmandu', '2016-12-13 07:29:00', NULL, 0, 4),
(3, 'Harish', 'Chhettri', 'harish@gmail.com', '9834365436', 'Kathmandu', '2016-12-27 07:50:04', NULL, 1, 7);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `persistent_logins`
--
ALTER TABLE `persistent_logins`
  ADD PRIMARY KEY (`series`);

--
-- Indexes for table `tbl_admin`
--
ALTER TABLE `tbl_admin`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `tbl_admin_roles`
--
ALTER TABLE `tbl_admin_roles`
  ADD PRIMARY KEY (`admin_role_id`),
  ADD UNIQUE KEY `uni_username_role` (`role`,`username`),
  ADD KEY `fk_username_idx` (`username`);

--
-- Indexes for table `tbl_courses`
--
ALTER TABLE `tbl_courses`
  ADD PRIMARY KEY (`course_id`);

--
-- Indexes for table `tbl_enquiry`
--
ALTER TABLE `tbl_enquiry`
  ADD PRIMARY KEY (`enquiry_id`),
  ADD KEY `course_id` (`course_id`),
  ADD KEY `enquiry_status_id` (`enquiry_status_id`);

--
-- Indexes for table `tbl_enquiry_status`
--
ALTER TABLE `tbl_enquiry_status`
  ADD PRIMARY KEY (`enquiry_status_id`);

--
-- Indexes for table `tbl_isp`
--
ALTER TABLE `tbl_isp`
  ADD PRIMARY KEY (`isp_id`);

--
-- Indexes for table `tbl_mailing_address`
--
ALTER TABLE `tbl_mailing_address`
  ADD PRIMARY KEY (`mailing_address_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `tbl_settings`
--
ALTER TABLE `tbl_settings`
  ADD PRIMARY KEY (`name`);

--
-- Indexes for table `tbl_students`
--
ALTER TABLE `tbl_students`
  ADD PRIMARY KEY (`student_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `course_id` (`course_id`);

--
-- Indexes for table `tbl_tutors`
--
ALTER TABLE `tbl_tutors`
  ADD PRIMARY KEY (`tutor_id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `course_id` (`course_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_admin_roles`
--
ALTER TABLE `tbl_admin_roles`
  MODIFY `admin_role_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tbl_courses`
--
ALTER TABLE `tbl_courses`
  MODIFY `course_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `tbl_enquiry`
--
ALTER TABLE `tbl_enquiry`
  MODIFY `enquiry_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tbl_enquiry_status`
--
ALTER TABLE `tbl_enquiry_status`
  MODIFY `enquiry_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tbl_isp`
--
ALTER TABLE `tbl_isp`
  MODIFY `isp_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbl_mailing_address`
--
ALTER TABLE `tbl_mailing_address`
  MODIFY `mailing_address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `tbl_students`
--
ALTER TABLE `tbl_students`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tbl_tutors`
--
ALTER TABLE `tbl_tutors`
  MODIFY `tutor_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_admin_roles`
--
ALTER TABLE `tbl_admin_roles`
  ADD CONSTRAINT `fk_username` FOREIGN KEY (`username`) REFERENCES `tbl_admin` (`username`);

--
-- Constraints for table `tbl_enquiry`
--
ALTER TABLE `tbl_enquiry`
  ADD CONSTRAINT `tbl_enquiry_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`course_id`),
  ADD CONSTRAINT `tbl_enquiry_ibfk_2` FOREIGN KEY (`enquiry_status_id`) REFERENCES `tbl_enquiry_status` (`enquiry_status_id`);

--
-- Constraints for table `tbl_students`
--
ALTER TABLE `tbl_students`
  ADD CONSTRAINT `tbl_students_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`course_id`);

--
-- Constraints for table `tbl_tutors`
--
ALTER TABLE `tbl_tutors`
  ADD CONSTRAINT `tbl_tutors_ibfk_1` FOREIGN KEY (`course_id`) REFERENCES `tbl_courses` (`course_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
