-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2024 at 06:40 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `physiowerkz`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_notifications`
--

CREATE TABLE `admin_notifications` (
  `notification_id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `changed_by` varchar(20) DEFAULT NULL,
  `change_type` varchar(20) NOT NULL,
  `log_id` int(11) NOT NULL,
  `notification_time` datetime DEFAULT current_timestamp(),
  `status` enum('Unread','Read') DEFAULT 'Unread',
  `message` text NOT NULL,
  `admin_id` int(11) DEFAULT NULL,
  `appoint_status` enum('Pending','Scheduled','Completed','Cancelled') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `appointment_id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `therapist_id` int(11) DEFAULT NULL,
  `appointment_datetime` datetime NOT NULL,
  `patient_comments` varchar(120) DEFAULT NULL,
  `staff_comments` varchar(120) DEFAULT NULL,
  `status` enum('Pending','Scheduled','Completed','Cancelled','Unavailable') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `managed_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `assessment_findings`
--

CREATE TABLE `assessment_findings` (
  `id` int(11) NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `body_part` varchar(255) NOT NULL,
  `condition_type` varchar(255) DEFAULT NULL,
  `severity` varchar(50) DEFAULT NULL,
  `remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `billing`
--

CREATE TABLE `billing` (
  `billing_id` int(11) NOT NULL,
  `appointment_id` int(11) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `status` enum('pending','paid') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `clinical_notes`
--

CREATE TABLE `clinical_notes` (
  `note_id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `note` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `exercise_suggestions`
--

CREATE TABLE `exercise_suggestions` (
  `id` int(11) NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `patient_name` varchar(255) NOT NULL,
  `suggestion` varchar(255) NOT NULL,
  `situation` enum('Severe','Moderate','Low') NOT NULL,
  `date` date DEFAULT NULL,
  `remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `health_questionnaire`
--

CREATE TABLE `health_questionnaire` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `know_us` varchar(255) NOT NULL,
  `referrer` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) NOT NULL,
  `nric_passport_no` varchar(255) DEFAULT NULL,
  `profession` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `religion` varchar(255) DEFAULT NULL,
  `emergency_contact` varchar(255) DEFAULT NULL,
  `relationship` varchar(255) DEFAULT NULL,
  `emergency_phone` varchar(255) DEFAULT NULL,
  `family_doctor` varchar(255) DEFAULT NULL,
  `clinic_address` varchar(255) DEFAULT NULL,
  `clinic_number` varchar(255) DEFAULT NULL,
  `newsletter` varchar(255) DEFAULT NULL,
  `hospitalized` varchar(255) DEFAULT NULL,
  `hospitalized_details` text DEFAULT NULL,
  `physical_activity` varchar(255) DEFAULT NULL,
  `chest_pain_activity` varchar(255) DEFAULT NULL,
  `chest_pain_rest` varchar(255) DEFAULT NULL,
  `heart_disease` varchar(255) DEFAULT NULL,
  `stroke` varchar(255) DEFAULT NULL,
  `high_blood_pressure` varchar(255) DEFAULT NULL,
  `diabetes` varchar(255) DEFAULT NULL,
  `asthma` varchar(255) DEFAULT NULL,
  `osteoporosis` varchar(255) DEFAULT NULL,
  `epilepsy` varchar(255) DEFAULT NULL,
  `cancer` varchar(255) DEFAULT NULL,
  `weight_loss` varchar(255) DEFAULT NULL,
  `dizziness` varchar(255) DEFAULT NULL,
  `smoking` varchar(255) DEFAULT NULL,
  `pregnant` varchar(255) DEFAULT NULL,
  `fracture_accident` varchar(255) DEFAULT NULL,
  `blood_disorder` varchar(255) DEFAULT NULL,
  `other_conditions` text DEFAULT NULL,
  `pain_killers` varchar(255) DEFAULT NULL,
  `inhaler` varchar(255) DEFAULT NULL,
  `blood_thinners` varchar(255) DEFAULT NULL,
  `steroids` varchar(255) DEFAULT NULL,
  `other_medications` text DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hr`
--

CREATE TABLE `hr` (
  `hr_id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `hire_date` date NOT NULL,
  `leave_balance` int(11) DEFAULT 0,
  `performance_review` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `status` enum('Scheduled','Pending','Cancelled','Completed') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `appointdatetime` timestamp NULL DEFAULT NULL,
  `read_status` enum('read','unread') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `notificationstaff`
--

CREATE TABLE `notificationstaff` (
  `id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `status` enum('Approved','Pending','Cancelled','Removed') DEFAULT 'Pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `appointdatetime` timestamp NULL DEFAULT NULL,
  `read_status` enum('unread','read') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `token_expiry` datetime NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `patient_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `contact_num` varchar(100) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `lastlogin` timestamp NULL DEFAULT NULL,
  `preferred_communication` varchar(10) NOT NULL,
  `ques_status` int(2) NOT NULL,
  `survey_status` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `class` text NOT NULL,
  `session_count` int(11) DEFAULT NULL,
  `personality` varchar(30) DEFAULT NULL,
  `compliance` varchar(25) DEFAULT NULL,
  `bodytype` varchar(40) DEFAULT NULL,
  `focus` varchar(40) DEFAULT NULL,
  `lifestyle` text DEFAULT NULL,
  `healthstatus` varchar(40) DEFAULT NULL,
  `goal` text DEFAULT NULL,
  `outcome` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `patient_changes_log`
--

CREATE TABLE `patient_changes_log` (
  `log_id` int(11) NOT NULL,
  `patient_id` int(11) DEFAULT NULL,
  `change_type` varchar(10) NOT NULL,
  `changed_by` varchar(50) NOT NULL,
  `change_time` datetime DEFAULT current_timestamp(),
  `old_values` text DEFAULT NULL,
  `new_values` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `payroll`
--

CREATE TABLE `payroll` (
  `payroll_id` int(11) NOT NULL,
  `staff_id` int(11) DEFAULT NULL,
  `salary` decimal(10,2) NOT NULL,
  `pay_date` date NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `id` int(11) NOT NULL,
  `review` text NOT NULL,
  `suggestion` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `star_rating` int(11) NOT NULL DEFAULT 0,
  `userName` varchar(100) DEFAULT NULL,
  `staffName` varchar(100) DEFAULT NULL,
  `role` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `schedules`
--

CREATE TABLE `schedules` (
  `schedule_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `type` enum('break','leave','booked') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `staffs`
--

CREATE TABLE `staffs` (
  `staff_id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) NOT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `dob` date NOT NULL,
  `contact_num` varchar(100) DEFAULT NULL,
  `role` enum('superadmin','admin','hr','physiotherapist','trainer') NOT NULL,
  `lock_status` enum('No','Yes') NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `lastlogin` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `staffs`
--

INSERT INTO `staffs` (`staff_id`, `username`, `password`, `email`, `gender`, `first_name`, `last_name`, `dob`, `contact_num`, `role`, `lock_status`, `created_at`, `lastlogin`) VALUES
(1, 'admin', '$2y$10$1amslCyGNtLz.mzAOF/zF.AdUsf49Fq31uprPhr08N7s1uMKKeaEm', 'admin@physiowerkz.com', 'Female', 'Admin', 'Real', '2000-01-01', '111', 'admin', 'No', '2024-07-14 07:10:10', '2024-11-07 05:35:14'),
(2, 'john', '$2y$10$xty6ooDseWw8G4IhYuo/juublyQ8t30UWg/G36MwSEy3cZiJh/gvq', 'john@physiowerkz.com', 'Male', 'John', 'Doe', '1994-07-05', '0123456789', 'physiotherapist', 'No', '2024-07-15 05:29:41', '2024-10-30 07:40:53'),
(7, 'jane', '$2y$10$9an1ESuxe.fHefFNIjjGXeBGNAzrYNc1Wiqozlyaylivev0KntfdO', 'jane@mail.com', 'Female', 'Jane', 'Doe', '1990-10-10', '123455667788', 'physiotherapist', 'No', '2024-10-01 07:23:12', '2024-10-13 12:50:28'),
(14, 'superadmin', '$2y$10$yGNZIFgbIbSxqvOL38W9ae1b4A7dxe9DP/L5yNnV5s9GirPVkLljG', 'superadmin@gmail.com', 'Male', 'super', 'admin', '2000-02-29', '112223133', 'superadmin', 'No', '2024-10-30 01:59:00', '2024-10-30 07:39:40');

-- --------------------------------------------------------

--
-- Table structure for table `staff_changes_log`
--

CREATE TABLE `staff_changes_log` (
  `log_id` int(11) NOT NULL,
  `staff_id` int(11) NOT NULL,
  `change_type` varchar(10) NOT NULL,
  `changed_by` varchar(50) NOT NULL,
  `change_time` datetime DEFAULT current_timestamp(),
  `old_values` text DEFAULT NULL,
  `new_values` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `test_tracking`
--

CREATE TABLE `test_tracking` (
  `id` int(11) NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `test_result` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `treatmentassessment`
--

CREATE TABLE `treatmentassessment` (
  `id` int(11) NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `Name` varchar(255) DEFAULT NULL,
  `painanddescription` text NOT NULL,
  `activity` varchar(255) NOT NULL,
  `severe_activity` enum('short','medium','long') NOT NULL,
  `remarks_activity` text DEFAULT NULL,
  `vas_activity` int(11) DEFAULT NULL,
  `irritability_activity` enum('low','moderate','high') NOT NULL,
  `symptoms_activity` text DEFAULT NULL,
  `acute_activity` enum('2-6_wk','acute_on_chronic','chronic') NOT NULL,
  `indicates_activity` text DEFAULT NULL,
  `dos_donts_activity` text DEFAULT NULL,
  `duration_activity` varchar(255) DEFAULT NULL,
  `aware_of_pain_body_activity` enum('yes','no') NOT NULL,
  `movement_activity` text DEFAULT NULL,
  `protect_by_activity` text DEFAULT NULL,
  `gradual_load_activity` text DEFAULT NULL,
  `d1_3_activity` varchar(255) DEFAULT NULL,
  `d4_7_activity` varchar(255) DEFAULT NULL,
  `week2_activity` varchar(255) DEFAULT NULL,
  `week3_activity` varchar(255) DEFAULT NULL,
  `week4_activity` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `treatmentassessment3`
--

CREATE TABLE `treatmentassessment3` (
  `id` int(11) NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `tissue_type` varchar(255) NOT NULL,
  `tissue_findings` enum('Superficial Fascia','Deep Fascia','Muscle Fascia','Tone','Band','Fibrosis','Trigger point','Lump','Dead block','Flattened/Inhibited','Swelling','Lymph congestion','Cellulite') NOT NULL,
  `remarks` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `treatment_survey`
--

CREATE TABLE `treatment_survey` (
  `id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `session_num` int(11) NOT NULL,
  `progress` text NOT NULL,
  `therapist_rating` int(11) NOT NULL,
  `therapist_feedback` text NOT NULL,
  `trainer_input` text NOT NULL,
  `goals` text NOT NULL,
  `treatment_plan` text NOT NULL,
  `overall_experience` text NOT NULL,
  `recommend` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `videos`
--

CREATE TABLE `videos` (
  `id` int(11) NOT NULL,
  `appointment_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `name` varchar(255) CHARACTER SET utf16 NOT NULL,
  `location` varchar(255) CHARACTER SET utf16 NOT NULL,
  `uploaded_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `doctor_id` int(11) NOT NULL,
  `approved` tinyint(1) DEFAULT 0,
  `log` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  ADD PRIMARY KEY (`notification_id`);

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`appointment_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `staff_id` (`staff_id`),
  ADD KEY `therapist_id` (`therapist_id`);

--
-- Indexes for table `assessment_findings`
--
ALTER TABLE `assessment_findings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `billing`
--
ALTER TABLE `billing`
  ADD PRIMARY KEY (`billing_id`),
  ADD KEY `appointment_id` (`appointment_id`);

--
-- Indexes for table `clinical_notes`
--
ALTER TABLE `clinical_notes`
  ADD PRIMARY KEY (`note_id`),
  ADD KEY `patient_id` (`patient_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `exercise_suggestions`
--
ALTER TABLE `exercise_suggestions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `health_questionnaire`
--
ALTER TABLE `health_questionnaire`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hr`
--
ALTER TABLE `hr`
  ADD PRIMARY KEY (`hr_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`patient_id`);

--
-- Indexes for table `notificationstaff`
--
ALTER TABLE `notificationstaff`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_id` (`staff_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`patient_id`);

--
-- Indexes for table `patient_changes_log`
--
ALTER TABLE `patient_changes_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `payroll`
--
ALTER TABLE `payroll`
  ADD PRIMARY KEY (`payroll_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`schedule_id`),
  ADD KEY `staff_id` (`staff_id`);

--
-- Indexes for table `staffs`
--
ALTER TABLE `staffs`
  ADD PRIMARY KEY (`staff_id`);

--
-- Indexes for table `staff_changes_log`
--
ALTER TABLE `staff_changes_log`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `test_tracking`
--
ALTER TABLE `test_tracking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `treatmentassessment`
--
ALTER TABLE `treatmentassessment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `treatmentassessment3`
--
ALTER TABLE `treatmentassessment3`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `treatment_survey`
--
ALTER TABLE `treatment_survey`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `videos`
--
ALTER TABLE `videos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_notifications`
--
ALTER TABLE `admin_notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `appointment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `assessment_findings`
--
ALTER TABLE `assessment_findings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `exercise_suggestions`
--
ALTER TABLE `exercise_suggestions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `health_questionnaire`
--
ALTER TABLE `health_questionnaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `notificationstaff`
--
ALTER TABLE `notificationstaff`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `patient_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `patient_changes_log`
--
ALTER TABLE `patient_changes_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `schedules`
--
ALTER TABLE `schedules`
  MODIFY `schedule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `staffs`
--
ALTER TABLE `staffs`
  MODIFY `staff_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `staff_changes_log`
--
ALTER TABLE `staff_changes_log`
  MODIFY `log_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `test_tracking`
--
ALTER TABLE `test_tracking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `treatmentassessment`
--
ALTER TABLE `treatmentassessment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT for table `treatmentassessment3`
--
ALTER TABLE `treatmentassessment3`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `treatment_survey`
--
ALTER TABLE `treatment_survey`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `videos`
--
ALTER TABLE `videos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `schedules`
--
ALTER TABLE `schedules`
  ADD CONSTRAINT `schedules_ibfk_1` FOREIGN KEY (`staff_id`) REFERENCES `staffs` (`staff_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
