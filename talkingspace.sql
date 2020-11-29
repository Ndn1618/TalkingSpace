-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 29, 2020 at 05:31 PM
-- Server version: 5.6.16
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `talkingspace`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `GetCategory` (IN `category` VARCHAR(255))  BEGIN 
	select * from categories where name = category; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUserByUsername` (IN `uName` VARCHAR(255))  BEGIN 
	select * from users where username = uName; 
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `GetUsers` ()  BEGIN
	SELECT * FROM users;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` varchar(400) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `description`) VALUES
(1, 'Web Programming', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ut nisl vel nulla congue pharetra eget a justo. Morbi risus lacus, ultricies quis ipsum vitae, pretium sodales dolor. Phasellus rhoncus ultrices semper. In sit amet nunc non ipsum convallis varius. Mauris euismod dui et ullamcorper vulputate. Fusce tellus ligula, condimentum ullamcorper pellentesque ac, ultrices.'),
(2, 'Web Design', 'Nam luctus lacinia libero et consequat. Curabitur et auctor risus. Sed vitae eros vulputate, condimentum mauris sed, ultricies ipsum. Sed hendrerit urna velit, molestie pharetra nulla convallis quis. Cras mollis tempor lacus a rutrum. Fusce condimentum tortor tellus, in bibendum metus gravida ut.');

-- --------------------------------------------------------

--
-- Table structure for table `replies`
--

CREATE TABLE `replies` (
  `id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `body` text NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `replies`
--

INSERT INTO `replies` (`id`, `topic_id`, `user_id`, `body`, `create_date`) VALUES
(1, 1, 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec quis quam id est molestie pellentesque. Nam bibendum massa quis enim lacinia, at facilisis nibh feugiat. Vestibulum tempus tristique nunc in eleifend. Sed molestie feugiat ultricies. Donec placerat est eu metus sollicitudin, eget maximus lorem euismod. Curabitur tincidunt mi eu odio fermentum maximus. Maecenas dignissim ante nec elementum dictum. Vivamus egestas posuere felis quis convallis. Vestibulum vestibulum massa ultricies eros commodo, vitae placerat purus lacinia. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce lobortis purus arcu, at vulputate ipsum blandit id. Aliquam ornare posuere ex, vel tristique ex consequat vitae. Ut sit amet odio libero. Cras porta malesuada dolor et ullamcorper.', '2020-11-29 11:34:09'),
(2, 2, 2, 'Sed molestie feugiat ultricies. Donec placerat est eu metus sollicitudin, eget maximus lorem euismod. Curabitur tincidunt mi eu odio fermentum maximus. Maecenas dignissim ante nec elementum dictum. Vivamus egestas posuere felis quis convallis. Vestibulum vestibulum massa ultricies eros commodo, vitae placerat purus lacinia. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce lobortis purus arcu, at vulputate ipsum blandit id. Aliquam ornare posuere ex, vel tristique ex consequat vitae. Ut sit amet odio libero. Cras porta malesuada dolor et ullamcorper.', '2020-11-29 11:34:09');

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

CREATE TABLE `topics` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `body` text NOT NULL,
  `last_activity` datetime NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`id`, `category_id`, `user_id`, `title`, `body`, `last_activity`, `create_date`) VALUES
(1, 1, 1, 'Favourite Server-Side Language', 'What is your favourite server-side language?', '2020-11-19 11:45:47', '2020-11-29 06:49:17'),
(2, 2, 1, 'How did you learn CSS and HTML?', 'Nam luctus lacinia libero et consequat. Curabitur et auctor risus. Sed vitae eros vulputate, condimentum mauris sed, ultricies ipsum. Sed hendrerit urna velit, molestie pharetra nulla convallis quis. Cras mollis tempor lacus a rutrum. Fusce condimentum tortor tellus, in bibendum metus gravida ut. Praesent odio ligula, tempor non vulputate eget, porttitor in neque. Mauris molestie congue lectus, non tincidunt tortor condimentum eleifend. Curabitur orci nisi, molestie sit amet tortor quis, elementum rhoncus dolor. Pellentesque sit amet congue sem. Donec sagittis iaculis leo, ut pulvinar lacus tincidunt id.', '2020-11-29 11:45:47', '2020-11-29 06:49:17'),
(3, 1, 2, 'A Complete State Machine Made With HTML Checkboxes and CSS', 'State machines are typically expressed on the web in JavaScript and often through the popular XState library. But the concept of a state machine is adaptable to just about any language, including, amazingly, HTML and CSS. In this article, we’re going to do exactly that. I recently built a website that included a “no client JavaScript” constraint and I needed one particular unique interactive feature.', '2020-11-02 16:37:26', '2020-11-29 11:40:35'),
(4, 1, 3, 'Exploring What the Details and Summary Elements Can Do', '<p>We&rsquo;ve mentioned before just how great the&nbsp;&lt;details&gt;&nbsp;and&nbsp;&lt;summary&gt;&nbsp;elements are. They&rsquo;re great for quickly&nbsp;<a href=\"https://css-tricks.com/quick-reminder-that-details-summary-is-the-easiest-way-ever-to-make-an-accordion/\">making accordions</a>&nbsp;that are accessible to touch, mouse, and keyboard input:</p><p>Neat, eh? But what else can these elements do? For a long while, I&rsquo;ve only thought about&nbsp;details&nbsp;as a way to make accordions. But the other day I started thinking about it a little bit, and the first thing I realized was maybe we could make better footnotes with them.</p>', '2020-11-29 12:49:18', '2020-11-29 11:49:18');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `avatar` varchar(100) NOT NULL,
  `username` varchar(10) NOT NULL,
  `password` varchar(64) NOT NULL,
  `about` text NOT NULL,
  `last_activity` datetime NOT NULL,
  `join_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `avatar`, `username`, `password`, `about`, `last_activity`, `join_date`) VALUES
(1, 'Muhammadjavohir Suratov', 'mjewel@gmail.com', 'avatar1.jpg', 'mjewel', '', 'I\'m Fullstack Develeoper from Uzbekistan.', '2020-11-04 11:38:38', '2020-11-29 06:39:49'),
(2, 'Usmon Masudjonov', 'usmonmasudjonov@gmail.com', 'avatar2.jpg', 'usomonjon', '112233', 'Creating awesome projects!', '2020-11-29 16:35:31', '2020-11-29 11:36:55'),
(3, 'Dilbar', 'ndilbar1618@gmail.com', 'photo_2020-08-27_17-06-58.jpg', 'Ndn1618', 'f60bb6bb4c96d4df93c51bd69dcc15a0', 'I\'m student at TUIT', '2020-11-29 12:46:42', '2020-11-29 11:46:42'),
(4, 'Malika Baxtiyorova', 'malikabaxtiyorova@gmail.com', 'photo_2020-08-27_17-05-30.jpg', 'Malika', '81b073de9370ea873f548e31b8adc081', 'I\'m student at MDIS.', '2020-11-29 16:09:31', '2020-11-29 15:09:31'),
(5, 'Rasul Ismoilov', 'rasulismoilov@gmail.com', 'Без названия.png', 'Rasul', 'cdaeb1282d614772beb1e74c192bebda', 'Follow me on You Tube Channel', '2020-11-29 17:00:45', '2020-11-29 16:00:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `replies`
--
ALTER TABLE `replies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `topics`
--
ALTER TABLE `topics`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `replies`
--
ALTER TABLE `replies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `topics`
--
ALTER TABLE `topics`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
