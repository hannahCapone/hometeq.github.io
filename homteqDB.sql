-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Mar 07, 2023 at 04:48 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `homteqDB`
--

-- --------------------------------------------------------

--
-- Table structure for table `Orders`
--

CREATE TABLE `Orders` (
  `OrderNo` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `OrderDateTime` datetime NOT NULL,
  `OrderTotel` decimal(8,2) NOT NULL DEFAULT 0.00,
  `OrderStatus` varchar(50) NOT NULL,
  `ShippingDate` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `Product`
--

CREATE TABLE `Product` (
  `prodId` int(11) NOT NULL,
  `prodName` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `prodPicNameSmall` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `prodPicNameLarge` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `prodDescripShort` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  `prodDescripLong` varchar(3000) COLLATE utf8_bin DEFAULT NULL,
  `prodPrice` decimal(8,2) DEFAULT NULL,
  `prodQuantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `Product`
--

INSERT INTO `Product` (`prodId`, `prodName`, `prodPicNameSmall`, `prodPicNameLarge`, `prodDescripShort`, `prodDescripLong`, `prodPrice`, `prodQuantity`) VALUES
(1, 'Amazon Echo Dot Smart Speaker with Alexa', 'amazonSpeakerSmall.png', 'amazonSpeakerLarge.jpeg', 'New look, new sound - Echo delivers clear highs, dynamic mids, and deep bass for rich, detailed sound that automatically adapts to any room.', 'Meet the all-new Echo. Talk about well-rounded. Echo combines premium sound, a built-in Zigbee smart home hub, and a temperature sensor. Powerful speakers deliver clear highs, dynamic mids, and deep bass for rich, detailed sound that adapts to any room. Just ask Alexa to play music, answer questions, make calls, and tell you the news, sports scores, weather, and more.', '99.99', 100),
(2, 'Lorex Home Security System', 'homeSecuritySmall.png', 'homeSecurityLarge.jpeg', 'Home monitoring has never been easier with this Lorex NVR Security Camera System. This system features the touch screen Lorex Smart Home Security Center, four 2K-resolution battery-operated cameras, and a WiFi range extender.', 'The 2K wire-free cameras with their rechargeable batteries include person detection, 2-way talk, and Smart Deterrence technology. Expand your security system by adding additional Lorex 2K wire-free cameras or WiFi products,for example, a doorbell or floodlight. This system will provide you with straightforward and secure home security to help you protect what matters most with no monthly fees.', '459.99', 30),
(3, 'Apple TV', 'appleTVSmall.png', 'appleTVLarge.jpeg', 'The new Apple TV 4K brings Apple TV+, Apple Music, Apple Fitness+ and Apple Arcade together with all your favourite streaming apps — in our best‑ever picture and audio quality. With the blazing performance of the A15 Bionic chip, intuitive controls, and seamless interaction with your devices and smart home accessories.', 'The new Apple TV 4K brings the best shows, movies, sports, and live TV—\r\ntogether with your favorite Apple devices and services.¹ Now with 4K High\r\nFrame Rate HDR for fluid, crisp video.² Watch Apple Originals with Apple TV+.³\r\nExperience more ways to enjoy your TV with Apple Arcade, Apple Fitness+,\r\nand Apple Music.³ And use the new Siri Remote with touch-enabled clickpad\r\nto control it all.\r\n\r\nWith Apple TV+, you can stream award-winning series and films, compelling dramas, groundbreaking documentaries, kids’ entertainment, and comedies—with new Apple Originals added every month. Stream on the Apple TV app on Apple devices, smart TVs, consoles, or sticks. $4.99/month after free trial. One subscription per Family Sharing group. Offer good for 3 months after eligible device activation. Plan automatically renews until cancelled. Restrictions and other terms apply. See apple.com/promo for more information.\r\n', '179.99', 160),
(4, 'CYNC Smart Color Changing Light Bulb', 'lightBulbSmall.png', 'lightBulbLarge.png', 'Simple set up without a hub: Control the Full Color Light Bulb using the Cync app with no additional hub or bridge required.', 'Use Full Color Smart Bulb to change the vibe of any space in seconds. Use millions of colors to change a kids\' room with their interests, to create a next level movie night, and support your team on game day. The tunable white spectrum supports your sleep/wake cycle and creates the perfect scene for winding down or waking up. Get added confidence by scheduling your lights so you never coming home to a dark house. With voice control and the ability to control your lights away from home, you\'ll get the added convenience of controlling your lights while away on vacation or when your hands are full.', '12.99', 300);

-- --------------------------------------------------------

--
-- Table structure for table `Users`
--

CREATE TABLE `Users` (
  `userId` int(11) NOT NULL,
  `userType` varchar(1) NOT NULL,
  `userFname` varchar(200) NOT NULL,
  `userSname` varchar(200) NOT NULL,
  `userAddress` varchar(200) NOT NULL,
  `userPostCode` varchar(20) NOT NULL,
  `userTelNum` varchar(20) NOT NULL,
  `userEmail` varchar(200) NOT NULL,
  `userPassword` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`userId`, `userType`, `userFname`, `userSname`, `userAddress`, `userPostCode`, `userTelNum`, `userEmail`, `userPassword`) VALUES
(1, 'C', 'Donald', 'Duck', '2 Duckland Rd, London', 'Nw2 6RD', '0207911000', 'dd@duck.com', '123'),
(2, 'A', 'Hannah', 'Capone', '896 S St, Boston', '02152', '6179717288', 'hanzzz22102@homteq.com', '456'),
(3, 'C', 'Polina', 'Bolberova', '55 Newbury St, Boston', '01181', '6179990111', 'pbolb@gmail.com', '789');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `Orders`
--
ALTER TABLE `Orders`
  ADD PRIMARY KEY (`OrderNo`);

--
-- Indexes for table `Product`
--
ALTER TABLE `Product`
  ADD PRIMARY KEY (`prodId`);

--
-- Indexes for table `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`userId`),
  ADD UNIQUE KEY `userEmail` (`userEmail`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Orders`
--
ALTER TABLE `Orders`
  MODIFY `OrderNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Product`
--
ALTER TABLE `Product`
  MODIFY `prodId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `userId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
