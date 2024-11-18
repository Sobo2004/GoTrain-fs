-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 24, 2024 at 11:58 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `railwayticketingsystem`
--

-- --------------------------------------------------------

--
-- Table structure for table `booking`
--

CREATE TABLE `booking` (
  `Booking_ID` varchar(6) NOT NULL,
  `Booking_Date` date DEFAULT NULL,
  `Booking_Status` varchar(255) DEFAULT NULL,
  `Payment_ID` varchar(6) DEFAULT NULL,
  `User_ID` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `booking`
--

INSERT INTO `booking` (`Booking_ID`, `Booking_Date`, `Booking_Status`, `Payment_ID`, `User_ID`) VALUES
('B00001', '2024-01-01', 'Confirmed', 'P00001', 'U00001'),
('B00002', '2024-02-01', 'Pending', 'P00002', 'U00002'),
('B00003', '2024-03-01', 'Cancelled', 'P00003', 'U00003'),
('B00004', '2024-04-01', 'Confirmed', 'P00004', 'U00004'),
('B00005', '2024-05-01', 'COnfirmed', 'P00005', 'U00005');

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `Payment_ID` varchar(6) NOT NULL,
  `Payment` varchar(255) DEFAULT NULL,
  `Railcard_ID` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`Payment_ID`, `Payment`, `Railcard_ID`) VALUES
('P00001', 'Credit Card', 'R00001'),
('P00002', 'Debit Card', 'R00002'),
('P00003', 'Paypal', 'R00003'),
('P00004', 'Bank Transfer', 'R00004'),
('P00005', 'Cash', 'R00005');

-- --------------------------------------------------------

--
-- Table structure for table `railcard`
--

CREATE TABLE `railcard` (
  `Railcard_ID` varchar(6) NOT NULL,
  `Railcard_Type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `railcard`
--

INSERT INTO `railcard` (`Railcard_ID`, `Railcard_Type`) VALUES
('R00001', 'Senior Railcard'),
('R00002', 'Student Railcard'),
('R00003', 'Family Railcard'),
('R00004', 'Disabled Railcard'),
('R00005', 'Veterans Railcard');

-- --------------------------------------------------------

--
-- Table structure for table `registered_user`
--

CREATE TABLE `registered_user` (
  `R_User_ID` varchar(6) NOT NULL,
  `R_Username` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Phone_Number` int(11) DEFAULT NULL,
  `Booking_ID` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `registered_user`
--

INSERT INTO `registered_user` (`R_User_ID`, `R_Username`, `Password`, `Email`, `Phone_Number`, `Booking_ID`) VALUES
('RU0001', 'Ravi Kumar', 'password123', 'ravi_kumar@google.com', 1234567890, 'B00001'),
('RU0002', 'Priya Patel', 'securepassword', 'priya_patel@google.com', 2147483647, 'B00002'),
('RU0003', 'Amit Singh', 'amitpass', 'amit_singh@google.com', 2147483647, 'B00003'),
('RU0004', 'Sonia Khan', 'soniapassword', 'sonia_khan@google.com', 2147483647, 'B00004'),
('RU0005', 'Sanjay Gupta', 'sanjaypass', 'sanjay_gupta@google.com', 2147483647, 'B00005');

-- --------------------------------------------------------

--
-- Table structure for table `ticket`
--

CREATE TABLE `ticket` (
  `Ticket_ID` varchar(6) NOT NULL,
  `Train_ID` varchar(6) DEFAULT NULL,
  `Price` decimal(10,2) DEFAULT NULL,
  `Booking_ID` varchar(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ticket`
--

INSERT INTO `ticket` (`Ticket_ID`, `Train_ID`, `Price`, `Booking_ID`) VALUES
('T00001', 'T00001', 50.00, 'B00001'),
('T00002', 'T00002', 30.50, 'B00002'),
('T00003', 'T00003', 45.75, 'B00003'),
('T00004', 'T00004', 60.00, 'B00004'),
('T00005', 'T00005', 55.25, 'B00005');

-- --------------------------------------------------------

--
-- Table structure for table `train`
--

CREATE TABLE `train` (
  `Train_ID` varchar(6) NOT NULL,
  `Train_Name` varchar(255) DEFAULT NULL,
  `DepTime` time DEFAULT NULL,
  `DepStation` varchar(255) DEFAULT NULL,
  `ArrTime` time DEFAULT NULL,
  `ArrStation` varchar(255) DEFAULT NULL,
  `Platform` int(11) DEFAULT NULL,
  `AvailableSeats` int(11) DEFAULT NULL,
  `TotalSeats` int(11) DEFAULT NULL,
  `Coaches` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `train`
--

INSERT INTO `train` (`Train_ID`, `Train_Name`, `DepTime`, `DepStation`, `ArrTime`, `ArrStation`, `Platform`, `AvailableSeats`, `TotalSeats`, `Coaches`) VALUES
('T00001', 'West Midlands', '08:00:00', 'Birmingham New Street', '12:00:00', 'Coventry Station', 1, 100, 150, 10),
('T00002', 'Avanti West Coast', '09:30:00', 'London Euston', '14:30:00', 'Birmingham New Street', 2, 120, 180, 12),
('T00003', 'Avanti West Coast', '07:45:00', 'Coventry Station', '11:45:00', 'Manchester Piccadilly', 3, 80, 120, 8),
('T00004', 'West Midlands', '06:15:00', 'Coventry Station', '10:15:00', 'Birmingham New Street', 4, 90, 140, 9),
('T00005', 'London Northwestern', '10:00:00', 'Coventry Station', '14:00:00', 'London Euston', 5, 110, 160, 11);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `User_ID` varchar(6) NOT NULL,
  `Username` varchar(255) DEFAULT NULL,
  `Password` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Phone_Number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`User_ID`, `Username`, `Password`, `Email`, `Phone_Number`) VALUES
('U00001', 'john_doe', 'password123', 'john_doe@example.com', 1234567890),
('U00002', 'jane_smith', 'securepassword', 'jane_smith@example.com', 2147483647),
('U00003', 'alice_jones', 'alicepass', 'alice_jones@example.com', 2147483647),
('U00004', 'bob_brown', 'bobpassword', 'bob_brown@example.com', 2147483647),
('U00005', 'charlie_black', 'charliepass', 'charlie_black@example.com', 2147483647);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `booking`
--
ALTER TABLE `booking`
  ADD PRIMARY KEY (`Booking_ID`),
  ADD KEY `Payment_ID` (`Payment_ID`),
  ADD KEY `User_ID` (`User_ID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`Payment_ID`),
  ADD KEY `Railcard_ID` (`Railcard_ID`);

--
-- Indexes for table `railcard`
--
ALTER TABLE `railcard`
  ADD PRIMARY KEY (`Railcard_ID`);

--
-- Indexes for table `registered_user`
--
ALTER TABLE `registered_user`
  ADD PRIMARY KEY (`R_User_ID`),
  ADD KEY `Booking_ID` (`Booking_ID`);

--
-- Indexes for table `ticket`
--
ALTER TABLE `ticket`
  ADD PRIMARY KEY (`Ticket_ID`),
  ADD KEY `Train_ID` (`Train_ID`),
  ADD KEY `Booking_ID` (`Booking_ID`);

--
-- Indexes for table `train`
--
ALTER TABLE `train`
  ADD PRIMARY KEY (`Train_ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`User_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `booking`
--
ALTER TABLE `booking`
  ADD CONSTRAINT `booking_ibfk_1` FOREIGN KEY (`Payment_ID`) REFERENCES `payment` (`Payment_ID`),
  ADD CONSTRAINT `booking_ibfk_2` FOREIGN KEY (`User_ID`) REFERENCES `users` (`User_ID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`Railcard_ID`) REFERENCES `railcard` (`Railcard_ID`);

--
-- Constraints for table `registered_user`
--
ALTER TABLE `registered_user`
  ADD CONSTRAINT `registered_user_ibfk_1` FOREIGN KEY (`Booking_ID`) REFERENCES `booking` (`Booking_ID`);

--
-- Constraints for table `ticket`
--
ALTER TABLE `ticket`
  ADD CONSTRAINT `ticket_ibfk_1` FOREIGN KEY (`Train_ID`) REFERENCES `train` (`Train_ID`),
  ADD CONSTRAINT `ticket_ibfk_2` FOREIGN KEY (`Booking_ID`) REFERENCES `booking` (`Booking_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
