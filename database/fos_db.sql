-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 14, 2021 at 06:37 PM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `fos_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `client_ip` varchar(20) NOT NULL,
  `user_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `qty` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `client_ip`, `user_id`, `product_id`, `qty`) VALUES
(28, '::1', 4, 13, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `mobile` text NOT NULL,
  `email` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `address`, `mobile`, `email`, `status`) VALUES
(1, 'James Smith', 'adasdasd asdadasd', '4756463215', 'jsmith@sample.com', 1),
(2, 'James Smith', 'adasdasd asdadasd', '4756463215', 'jsmith@sample.com', 1),
(3, 'ali ali@yahoo.com', 'asdasdasd', '0123456789', 'ali@yahoo.com', 1),
(4, 'alis ali@yahoo.com', 'asdasdasd', '0123456789', 'ali@yahoo.com', 0),
(5, 'abu abu@yahu.com', 'yahuyahu', '123456789', 'abu@yahu.com', 0),
(6, 'boi boi@yahu.com', 'boiboi', '123456789', 'boi@yahu.com', 0),
(7, 'boi boi@yahu.com', 'boiboi', '123456789', 'boi@yahu.com', 0),
(8, 'boi boi@yahu.com', 'boiboi', '123456789', 'boi@yahu.com', 1),
(9, 'boi BOI', 'boiboi', '123456789', 'boi@yahu.com', 0),
(10, 'boi Idham', 'halu polis', '123456789', 'boi@yahu.com', 0),
(11, 'boi Idham', 'boiboi', '123456789', 'boi@yahu.com', 1),
(12, 'boi Ramlan', 'halu', '123456789', 'boi@yahu.com', 0),
(13, 'boi halu halu', 'fck', '123456789', 'boi@yahu.com', 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `qty` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `product_id`, `qty`) VALUES
(1, 1, 3, 1),
(2, 1, 5, 1),
(3, 1, 3, 1),
(4, 1, 6, 3),
(5, 2, 1, 2),
(6, 3, 6, 1),
(7, 4, 5, 1),
(8, 4, 6, 1),
(9, 5, 1, 1),
(10, 6, 9, 1),
(11, 6, 9, 1),
(12, 6, 9, 1),
(13, 7, 8, 0),
(14, 8, 1, 1),
(15, 9, 9, 0),
(16, 9, 10, 1),
(17, 10, 6, 2),
(18, 11, 8, -1),
(19, 11, 6, 2),
(20, 12, 3, 2),
(21, 12, 6, 1),
(22, 13, 1, 3),
(23, 13, 10, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `img_path` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0= unavailable, 2 Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`id`, `category_id`, `name`, `description`, `price`, `img_path`, `status`) VALUES
(1, 3, 'CHICKEN BURGER', 'Crispy seasoned chicken, topped with a mandatory slice of melted cheese and piled onto soft rolls with onion, avocado, lettuce, tomato and garlic mayo. The key to juicy chicken is to cook it hard and fast! You can eyeball the Seasoning - it will be tasty as long as you use ', 10, '1610555520_burger.gif', 1),
(3, 3, 'BEEF STEAK', 'This is a marinade to transform good value steaks by making them juicier, more tender and adding a hint of flavour while not overpowering the flavour of the beef.', 15, '1610558400_steak.gif', 1),
(4, 3, 'SPAGHETTI BOLOGNESE', 'The pasta is utterly rich with olive oil, creamy, eggy, yet light and delightful. This pasta is called Spaghetti alla Carbonara Roma in Italian.', 15, '1610558760_spaghetti.gif', 1),
(6, 3, 'ORANGE JUICE', ' It comes in several different varieties, including blood orange, navel oranges, valencia orange, clementine, and tangerine. As well as variations in oranges used, some varieties include differing amounts of juice vesicles, known as \"pulp\" in American English, and \"(juicy) bits\" in British English.', 3, '1610555040_juice2.jpg', 1),
(8, 3, 'GUAVA JUICE', 'Guava’s flavor is unique, sweet, and almost universally pleasant. Many people think it tastes like a hybrid between a strawberry and a pear. The sweetness of the fruit depends on which type you’re eating.', 3, '1610555100_juice1.jpg', 1),
(9, 3, 'NASI LEMAK ', 'Nasi lemak is a dish that comprises rice made fragrant with coconut cream and pandan leaves. A light meal that is believed to be Malay in origin, it is traditionally accompanied by fried anchovies, sliced cucumbers, fried fish known as ikan selar, and a sweet chili sauce.', 5, '1610555400_giphy.gif', 1),
(10, 3, 'FRENCH FRIES', 'Slight crispy crust with a uniform smooth inside of cooked potatoes. A pleasant odour, characteristic for deep fried potatoes. A pleasant taste, characteristic for deep fried potatoes. pre heat frying oil to max.', 5, '1610563560_fries.gif', 1),
(13, 0, 'ICE CREAM', 'Ice cream is a frozen dairy dessert obtained by freezing the ice cream mix with continuous agitation. It contains milk products, sweetening materials, stabilizers, colors, flavors, and egg products.', 2, '1610616360_icecream.gif', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=admin , 2 = staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(1, 'Administrator', 'admin', 'admin123', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address`) VALUES
(1, 'James', 'Smith', 'yahu@yahu.com', '123', '4756463215', 'adasdasd asdadasd'),
(2, 'ali', 'ali@yahoo.com', 'ali@yahoo.com', 'ali123', '0123456789', 'asdasdasd'),
(3, 'abu', 'abu@yahu.com', 'abu@yahu.com', '09d0714edbfe6a5be5f51a8d706cefb6', '123456789', 'yahuyahu'),
(4, 'boi', '', 'boi@yahu.com', '75c2a9cd09118b5c1ab6b43a18f88eca', '123456789', 'boiboi'),
(5, 'boi', '', 'boi@yahoo.com', '75c2a9cd09118b5c1ab6b43a18f88eca', '123456789', 'boiboi'),
(6, 'abas', 'abas', 'abas@yahu.com', '6d9bb61367e886a11562846edf4fa35b', '123456', 'abasa');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
