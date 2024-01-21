-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 21, 2024 at 05:22 PM
-- Server version: 8.0.31
-- PHP Version: 7.4.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `push_notification`
--

-- --------------------------------------------------------

--
-- Table structure for table `push_subscribers`
--

DROP TABLE IF EXISTS `push_subscribers`;
CREATE TABLE IF NOT EXISTS `push_subscribers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `endpoint` text COLLATE utf16_unicode_ci NOT NULL,
  `expirationTime` int NOT NULL,
  `p256dh` varchar(100) COLLATE utf16_unicode_ci NOT NULL,
  `authKey` varchar(50) COLLATE utf16_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `push_subscribers`
--

INSERT INTO `push_subscribers` (`id`, `endpoint`, `expirationTime`, `p256dh`, `authKey`) VALUES
(8, 'https://wns2-pn1p.notify.windows.com/w/?token=BQYAAAC%2bDZenR1lUDo57vxX8Ekzd8%2fNRPzjqyQ0HYKt7Ah854rzZOgZ5i8eEy3UGEDRtXMq04gZZ2mKBIavicFF%2bquivSZT9b2v5wpq9N%2bdBJmXVYw72QkKA4fj4X2zDIcnAXHd7lX3K0fYmke7yeKtsfbgkDY1PmMRBuN5Z7yLmQgQn1CdivUt3pMvA0KGf9%2f%2f4y3xT3HyQwh25gnMyT0orDL%2fgCLqUadxvZCMf4EDkx8ydzi3CD2Mhy7trj6Z4qqmRbg2y1V%2fQianpIN9vaRRepPCvCuzlDLF5KkvEwwtwgK71lcXaO5Lzpgy7qxHG1rs7BIA%3d', 0, 'BG-TjOoOyG2JbgJatbGrmpCjt8NsWz_-mV0nJ4s9FzT-4DGmX5FtUbeOuEaAkZaBMnwIokAtrRX5lZ5qYRl70nc', 'bmvL1xtdS0OMm0ixGaezNg');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
