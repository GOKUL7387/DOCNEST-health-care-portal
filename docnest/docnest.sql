-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 28, 2025 at 07:02 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `docnest`
--

-- --------------------------------------------------------

--
-- Table structure for table `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `hospital_id` int(11) NOT NULL,
  `patient_name` varchar(255) NOT NULL,
  `doctor_name` varchar(255) NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `status` enum('pending','confirmed','cancelled') DEFAULT 'pending',
  `patient_email` varchar(100) NOT NULL,
  `patient_phone` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `appointments`
--

INSERT INTO `appointments` (`id`, `hospital_id`, `patient_name`, `doctor_name`, `appointment_date`, `appointment_time`, `status`, `patient_email`, `patient_phone`) VALUES
(1, 1, 'BHARAT S', 'AADHI K', '2025-03-29', '17:12:18', 'confirmed', 'bharats@gmail.com', 1234567890),
(2, 2, 'Priya G', 'Preethi V', '2025-03-31', '18:56:47', 'pending', 'priya@gmail.com', 2138376427),
(3, 3, 'Adhithi A', 'Anand H', '2025-04-02', '14:26:34', 'pending', 'adhithi@gmail.com', 2134253534),
(4, 4, 'Ragav G', 'Saranya D', '2025-04-10', '18:56:47', 'cancelled', 'ragav@gmail.com', 1234223452),
(5, 1, 'Sam B', 'Chakaravarthy V', '2025-03-29', '15:13:00', 'confirmed', 'sam@gmail.com', 1234567),
(6, 2, 'Santhosh S', 'Subramaniyam S', '2025-04-11', '13:09:54', 'confirmed', 'santhosh@gmail.com', 12345676),
(7, 3, 'Aadhvik J', 'Watson J', '2025-04-03', '13:12:57', 'confirmed', 'aadhvik@gmail.com', 1323345),
(8, 4, 'Agalya D', 'Aadhi D', '2025-03-30', '11:27:00', 'pending', 'agalya@gmail.com', 123457);

-- --------------------------------------------------------

--
-- Table structure for table `doctor`
--

CREATE TABLE `doctor` (
  `id` int(11) NOT NULL,
  `docname` varchar(255) NOT NULL,
  `hosname` varchar(255) NOT NULL,
  `speciality` varchar(200) NOT NULL,
  `tokens` int(200) NOT NULL,
  `time` varchar(100) NOT NULL,
  `booked` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `doctor`
--

INSERT INTO `doctor` (`id`, `docname`, `hosname`, `speciality`, `tokens`, `time`, `booked`) VALUES
(1, 'Dr.DEVARAJAN', 'KMCH', 'general practitoner', 100, '8:00am - 9:00pm', 52),
(2, 'Dr.MANOHAR', 'Government hospital, Karur', 'General practitioner', 120, '8:30am - 10:00pm', 48),
(3, 'Dr.SELVI', 'KMCH', 'Gynecologist', 80, '9:00am - 2:00pm', 22),
(4, 'Dr.EIMAYAN', 'Government hospital, Karur', 'Surgeon', 50, '9:00am - 4:00pm', 2);

-- --------------------------------------------------------

--
-- Table structure for table `hospital`
--

CREATE TABLE `hospital` (
  `id` int(11) NOT NULL,
  `hosname` varchar(200) NOT NULL,
  `location` varchar(200) NOT NULL,
  `bed` int(255) NOT NULL,
  `image` varchar(200) NOT NULL,
  `hospital_id` int(11) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `hospital`
--

INSERT INTO `hospital` (`id`, `hosname`, `location`, `bed`, `image`, `hospital_id`, `email`, `password`) VALUES
(1, 'KMCH', 'Coimbatore', 125, '', 1, 'kmch@gmail.com', 'kmch'),
(2, 'Government hospital, Karur', 'Karur', 150, '', 2, 'govkarur@gmail.com', 'govkarur'),
(3, 'Annai Hospital', 'Tiruchengode', 150, '', 3, 'annai@gmail.com', 'annai'),
(4, 'Vellavan Hospital', 'Tiruchengode', 50, '', 4, 'vellavan@gmail.com', 'vellavan');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `order_id` varchar(20) NOT NULL,
  `user_name` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `description` text NOT NULL,
  `status` enum('pending','completed','shipped') DEFAULT 'pending',
  `delivery_date` date DEFAULT NULL,
  `tracking_number` varchar(50) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_id`, `user_name`, `date`, `description`, `status`, `delivery_date`, `tracking_number`, `notes`, `created_at`) VALUES
(1, 'ORD001', 'John Doe', '2025-03-25', 'Paracetamol (2), Ibuprofen (1)', 'pending', NULL, NULL, NULL, '2025-03-28 05:05:51'),
(2, 'ORD957', 'John Doe', '2025-03-28', 'Aspirin (1)', 'pending', NULL, NULL, NULL, '2025-03-28 05:06:24'),
(3, 'ORD233', 'John Doe', '2025-03-28', 'Aspirin (3)', 'pending', NULL, NULL, NULL, '2025-03-28 05:44:40');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` int(11) NOT NULL,
  `docname` varchar(255) NOT NULL,
  `patname` varchar(255) NOT NULL,
  `disease` varchar(255) NOT NULL,
  `hosname` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `docname`, `patname`, `disease`, `hosname`) VALUES
(1, 'Dr.DEVARAJAN', 'KUMARASAMY M', 'high fever with 104 degrees for two days', 'KMCH'),
(2, 'Dr.MANOHAR', 'ARIVALAGAN R', 'diarrhea with stomach pain', 'Government hospital, Karur');

-- --------------------------------------------------------

--
-- Table structure for table `pharmacies`
--

CREATE TABLE `pharmacies` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `location` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pharmacies`
--

INSERT INTO `pharmacies` (`id`, `name`, `location`) VALUES
(1, 'HealthPlus Pharmacy', '123 Main St, City A'),
(2, 'MediCare Pharmacy', '456 Oak Ave, City B');

-- --------------------------------------------------------

--
-- Table structure for table `pharmacy`
--

CREATE TABLE `pharmacy` (
  `id` int(11) NOT NULL,
  `pharmacy_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `stock_quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `pharmacy`
--

INSERT INTO `pharmacy` (`id`, `pharmacy_id`, `name`, `stock_quantity`, `price`) VALUES
(1, 1, 'Paracetamol', 100, 0.50),
(2, 1, 'Ibuprofen', 50, 0.75),
(3, 2, 'Aspirin', 200, 0.30);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `created_at`) VALUES
(2, 'jane_smith', '$2y$10$YOUR_HASHED_PASSWORD_HERE', '2025-03-28 05:11:17'),
(5, 'AKASH', 'Akash@2005', '2025-03-28 05:16:28'),
(6, 'GOKUL', 'Gokul@2005', '2025-03-28 05:16:28'),
(7, 'john_doe', '$2y$10$X./mXz5Qz5Qz5Qz5Qz5Qz5Qz5Qz5Qz5Qz5Qz5Qz5Qz5Qz5Qz5Qz5Q', '2025-03-28 05:30:37');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `hospital_id` (`hospital_id`);

--
-- Indexes for table `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hospital`
--
ALTER TABLE `hospital`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `order_id` (`order_id`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pharmacies`
--
ALTER TABLE `pharmacies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pharmacy`
--
ALTER TABLE `pharmacy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pharmacy_id` (`pharmacy_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `doctor`
--
ALTER TABLE `doctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `hospital`
--
ALTER TABLE `hospital`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pharmacies`
--
ALTER TABLE `pharmacies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `pharmacy`
--
ALTER TABLE `pharmacy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`hospital_id`) REFERENCES `hospital` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pharmacy`
--
ALTER TABLE `pharmacy`
  ADD CONSTRAINT `pharmacy_ibfk_1` FOREIGN KEY (`pharmacy_id`) REFERENCES `pharmacies` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
