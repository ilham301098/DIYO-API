-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 02, 2023 at 06:44 AM
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
-- Database: `diyo`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `client_code` varchar(20) NOT NULL,
  `client_name` varchar(200) NOT NULL,
  `client_phone` varchar(30) DEFAULT NULL,
  `client_address` text DEFAULT NULL,
  `client_desc` text DEFAULT NULL,
  `client_logo` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`client_code`, `client_name`, `client_phone`, `client_address`, `client_desc`, `client_logo`, `created_at`, `updated_at`) VALUES
('DIYO-M001', 'Diyo Merchant 01', '085611112222', 'Indonesia', 'Ini adalah client uji coba merchant 01', 'diyo.jpg', '2023-09-02 08:14:02', NULL),
('DIYO-M002', 'Diyo Resto', '085611112222', 'Indonesia', 'Restaurant high value', 'diyo-resto.jpg', '2023-09-02 08:14:02', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `client_api`
--

CREATE TABLE `client_api` (
  `id` int(11) NOT NULL,
  `client_code` varchar(20) DEFAULT NULL,
  `api_key` varchar(200) NOT NULL,
  `status` enum('active','deactive') NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client_api`
--

INSERT INTO `client_api` (`id`, `client_code`, `api_key`, `status`, `created_at`, `updated_at`) VALUES
(1, 'DIYO-M001', 'DIYO_development_pUxLaNylXdEJ61hVZ35BmH2LBH', 'active', '2023-09-02 08:17:01', NULL),
(2, 'DIYO-M002', 'DIYO_development_kgnbNPAqLTJdw8En41yJCytik7', 'active', '2023-09-02 08:17:01', NULL),
(3, 'DIYO-M001', 'DIYO_development_uH5BHZ4QcIcYcVMjSSYSoHPY2y', 'active', '2023-09-02 08:17:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(11) NOT NULL,
  `client_code` varchar(20) DEFAULT NULL,
  `name` varchar(200) NOT NULL,
  `price` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `unit` enum('gram','kilogram','litre','item') NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `client_code`, `name`, `price`, `amount`, `unit`, `created_at`, `updated_at`) VALUES
(8, 'DIYO-M001', 'sugar', 15000, 3, 'kilogram', '2023-09-02 08:22:26', NULL),
(9, 'DIYO-M001', 'milk', 18000, 5, 'litre', '2023-09-02 08:22:26', NULL),
(10, 'DIYO-M001', 'rice', 40000, 20, 'kilogram', '2023-09-02 08:22:26', NULL),
(11, 'DIYO-M002', 'rice', 37000, 17, 'kilogram', '2023-09-02 08:22:26', NULL),
(12, 'DIYO-M002', 'sugar', 17000, 6, 'kilogram', '2023-09-02 08:22:26', NULL),
(13, 'DIYO-M002', 'milk', 20000, 10, 'litre', '2023-09-02 08:22:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `client_code` varchar(20) DEFAULT NULL,
  `product_name` text NOT NULL,
  `price` int(11) DEFAULT NULL,
  `images` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `category` enum('food','snack','beverages') DEFAULT NULL,
  `status` enum('enabled','disabled') DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `client_code`, `product_name`, `price`, `images`, `description`, `category`, `status`, `created_at`, `updated_at`) VALUES
(1, 'DIYO-M001', 'Spaghetti Aglio Olio', 50000, 'Diyo.png', 'Spaghetti that cooked with onion and olive oil', 'food', 'enabled', '2023-09-02 08:35:42', NULL),
(2, 'DIYO-M001', 'Bruschetta Bolognaise', 38000, 'Diyo.png', 'Garlic Bread disajikan dengan toping saus bolognaise', 'snack', 'enabled', '2023-09-02 08:35:42', NULL),
(3, 'DIYO-M001', 'Buffallo Chicken Wings', 42000, 'Diyo.png', 'Sayap Ayam Ala Meksiko yang kaya akan rasa', 'food', 'enabled', '2023-09-02 08:35:42', NULL),
(4, 'DIYO-M001', 'Chicken Wings Spicy', 36000, 'Diyo.png', 'Sayam Ayam dengan bumbu oriental', 'food', 'enabled', '2023-09-02 08:35:42', NULL),
(5, 'DIYO-M002', 'Chicken Wings Honey', 39000, 'Diyo.png', 'Sayam Ayam dengan bumbu oriental dipadu dengan madu berkualitas', 'food', 'enabled', '2023-09-02 08:35:42', NULL),
(6, 'DIYO-M002', 'Blossom Onion', 39500, 'Diyo.png', 'Makanan pembuka unik dari kami, Onion berbentuk orchid', 'snack', 'enabled', '2023-09-02 08:35:42', NULL),
(7, 'DIYO-M002', 'Bitter Ballen', 30000, 'Diyo.png', 'Makanan ringan berbentuk bola-bola dari negeri Belanda', 'snack', 'enabled', '2023-09-02 08:35:42', NULL),
(8, 'DIYO-M002', 'Garden Salad', 34000, 'Diyo.png', 'Salad Klasik disajikan dengan saus thousand island', 'food', 'enabled', '2023-09-02 08:35:42', NULL),
(9, 'DIYO-M002', 'Mushroom Soup', 40000, 'Diyo.png', 'Sup yang terbuat dari Jamur Kancing yang segar', 'food', 'enabled', '2023-09-02 08:38:11', NULL),
(10, 'DIYO-M002', 'Roasted Pumpkin Soup', 32000, 'Diyo.png', 'Sup krim terbuat dari labu', 'food', 'enabled', '2023-09-02 08:38:11', NULL),
(11, 'DIYO-M001', 'French Fries', 20000, 'Diyo.png', NULL, 'snack', 'enabled', '2023-09-02 08:38:12', NULL),
(12, 'DIYO-M002', 'White Rice', 6000, 'Diyo.png', NULL, 'food', 'enabled', '2023-09-02 08:38:12', NULL),
(13, 'DIYO-M001', 'Zuppa Soup', 40000, 'Diyo.png', 'Sup Krim Seafood', 'food', 'enabled', '2023-09-02 08:38:12', NULL),
(14, 'DIYO-M001', 'Yakimeshi Salmon', 89000, 'Diyo.png', 'Nasi Goreng ala Jepang', 'food', 'enabled', '2023-09-02 08:42:03', NULL),
(15, 'DIYO-M002', 'Nasi Goreng Seafood', 49000, 'Diyo.png', 'Nasi Goreng dengan kombinasi saus tiram, udang dan cumi pilihan', 'food', 'enabled', '2023-09-02 08:43:00', NULL),
(16, 'DIYO-M001', 'Nasi Goreng Balacan', 46000, 'Diyo.png', 'Nasi Goreng dengan bumbu special balacan', 'food', 'enabled', '2023-09-02 08:43:33', NULL),
(17, 'DIYO-M001', 'Salmon Mentai', 72000, 'Diyo.png', 'Irisan Daging Ikan Salmon segar dengan saus mentai', 'food', 'enabled', '2023-09-02 08:56:42', NULL),
(18, 'DIYO-M002', 'Coto de Batavia', 48000, 'Diyo.png', 'Soto Daging khas Betawi', 'food', 'enabled', '2023-09-02 08:56:42', NULL),
(19, 'DIYO-M002', 'Beef Meltique Wellington', 190000, 'Diyo.png', 'Beef Tender Meltique Aussie dengan marinasi bumbu dan mixed herb', 'food', 'enabled', '2023-09-02 08:58:21', NULL),
(20, 'DIYO-M002', 'Summer Tea', 17000, 'Diyo.png', 'Teh herbal dengan rempah pilihan', 'beverages', 'enabled', '2023-09-02 09:02:54', NULL),
(21, 'DIYO-M001', 'Black Tea', 12000, 'Diyo.png', NULL, 'beverages', 'enabled', '2023-09-02 09:02:54', NULL),
(22, 'DIYO-M001', 'Original Tea', 10000, 'Diyo.png', NULL, 'beverages', 'enabled', '2023-09-02 09:02:54', NULL),
(23, 'DIYO-M002', 'Ice Americano', 21000, 'Diyo.png', 'Double Espresso and mineral water', 'beverages', 'enabled', '2023-09-02 09:02:54', NULL),
(24, 'DIYO-M001', 'Mineral Water', 12000, 'Diyo.png', NULL, 'beverages', 'enabled', '2023-09-02 09:02:54', NULL),
(25, 'DIYO-M002', 'Mineral Water', 8000, 'Diyo.png', NULL, 'beverages', 'enabled', '2023-09-02 09:02:54', NULL),
(26, 'DIYO-M001', 'Ice Bailey Coffee Series', 23000, 'Diyo.png', 'Double Espresso, Bailey, Fresh Milk and mineral water', 'beverages', 'enabled', '2023-09-02 09:02:54', NULL),
(27, 'DIYO-M001', 'Ice Earl Grey Latte', 34000, 'Diyo.png', 'Tea earl and fresh milk', 'beverages', 'enabled', '2023-09-02 09:02:54', NULL),
(28, 'DIYO-M002', 'Ice Thai Tea', 12000, 'Diyo.png', NULL, 'beverages', 'enabled', '2023-09-02 09:05:01', NULL),
(29, 'DIYO-M002', 'Ice Choco Taro', 16000, 'Diyo.png', NULL, 'beverages', 'enabled', '2023-09-02 09:05:01', NULL),
(30, 'DIYO-M001', 'Caramel Machiato', 25000, 'Diyo.png', 'Caramel Syrup, Fresh Milk and Espresso', 'beverages', 'enabled', '2023-09-02 09:05:01', NULL),
(31, 'DIYO-M002', 'Salted Caramel Machiato', 27000, 'Diyo.png', 'Salted Caramel Syrup, Fresh Milk and Espresso', 'beverages', 'enabled', '2023-09-02 09:05:01', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_variant`
--

CREATE TABLE `product_variant` (
  `variant_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `variant_name` text NOT NULL,
  `price` int(11) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `product_variant`
--

INSERT INTO `product_variant` (`variant_id`, `product_id`, `variant_name`, `price`, `created_at`, `updated_at`) VALUES
(3, 1, 'mushroom', 10000, '2023-09-02 09:24:03', NULL),
(4, 1, 'chicken', 20000, '2023-09-02 09:24:03', NULL),
(5, 2, 'extra cheese', 2000, '2023-09-02 09:25:30', NULL),
(6, 2, 'extra sauce', 5000, '2023-09-02 09:25:30', NULL),
(7, 8, 'extra sauce', 3000, '2023-09-02 09:26:00', NULL),
(8, 11, 'melted cheese', 3000, '2023-09-02 09:26:39', NULL),
(9, 21, 'extra sugar', 2000, '2023-09-02 09:28:31', NULL),
(10, 21, 'additional milk', 6000, '2023-09-02 09:28:31', NULL),
(11, 22, 'extra sugar', 2000, NULL, NULL),
(12, 22, 'additional milk', 6000, NULL, NULL),
(13, 3, 'spicy sauce', 2000, '2023-09-02 09:30:57', NULL),
(14, 3, 'extra wings', 12000, '2023-09-02 09:30:57', NULL),
(15, 21, 'upsize', 5000, '2023-09-02 09:31:39', NULL),
(16, 22, 'upsize', 5000, '2023-09-02 09:31:39', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `sales_id` varchar(30) NOT NULL,
  `client_code` varchar(20) DEFAULT NULL,
  `total_price` int(11) NOT NULL,
  `payment_method` enum('cash','ovo','gopay','shopeepay','dana') DEFAULT 'cash',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales`
--

INSERT INTO `sales` (`sales_id`, `client_code`, `total_price`, `payment_method`, `created_at`, `updated_at`) VALUES
('DY1-S-20230902-090022', 'DIYO-M001', 0, 'ovo', '2023-09-02 09:39:28', NULL),
('DY1-S-20230902-091027', 'DIYO-M001', 0, 'gopay', '2023-09-02 09:39:28', NULL),
('DY1-S-20230902-092029', 'DIYO-M001', 0, 'shopeepay', '2023-09-02 09:39:28', NULL),
('DY2-S-20230902-101247', 'DIYO-M002', 0, 'dana', '2023-09-02 09:39:28', NULL),
('DY2-S-20230902-102229', 'DIYO-M002', 0, 'ovo', '2023-09-02 09:39:28', NULL),
('DY2-S-20230902-104952', 'DIYO-M002', 0, 'shopeepay', '2023-09-02 09:39:28', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales_detail`
--

CREATE TABLE `sales_detail` (
  `sales_item` int(11) NOT NULL,
  `sales_id` varchar(30) NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `product_name` text NOT NULL,
  `price` int(11) DEFAULT NULL,
  `variants` text DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sales_detail`
--

INSERT INTO `sales_detail` (`sales_item`, `sales_id`, `product_id`, `product_name`, `price`, `variants`, `created_at`, `updated_at`) VALUES
(1, 'DY1-S-20230902-090022', 1, 'Spaghetti Aglio Olio', 50000, '[{\"variants_name\":\"mushroom\",\"price\":10000}]', '2023-09-02 11:01:48', NULL),
(2, 'DY1-S-20230902-090022', 2, 'Bruschetta Bolognaise', 38000, '[{\"variants_name\":\"extra cheese\",\"price\":2000},{\"variants_name\":\"extra sauce\",\"price\":5000}]', '2023-09-02 11:01:48', NULL),
(3, 'DY1-S-20230902-090022', 22, 'Original Tea', 10000, '[{\"variants_name\":\"additional milk\",\"price\":6000}]', '2023-09-02 11:01:48', NULL),
(4, 'DY1-S-20230902-090022', 24, 'Mineral Water', 12000, NULL, '2023-09-02 11:01:48', NULL),
(5, 'DY1-S-20230902-091027', 4, 'Chicken Wings Spicy', 36000, NULL, '2023-09-02 11:04:00', NULL),
(6, 'DY1-S-20230902-091027', 11, 'French Fries', 20000, '[{\"variants_name\":\"melted cheese\",\"price\":3000}]', '2023-09-02 11:04:00', NULL),
(7, 'DY1-S-20230902-091027', 17, 'Salmon Mentai', 72000, NULL, '2023-09-02 11:04:00', NULL),
(8, 'DY1-S-20230902-091027', 27, 'Ice Earl Grey Latte', 34000, NULL, '2023-09-02 11:04:00', NULL),
(9, 'DY1-S-20230902-091027', 30, 'Caramel Machiato', 25000, NULL, '2023-09-02 11:04:00', NULL),
(10, 'DY1-S-20230902-091027', 21, 'Black Tea', 21000, '[{\"variants_name\":\"extra sugar\",\"price\":2000},{\"variants_name\":\"upsize\",\"price\":5000}]', '2023-09-02 11:04:00', NULL),
(11, 'DY1-S-20230902-092029', 13, 'Zuppa Soup', 40000, NULL, '2023-09-02 11:06:33', NULL),
(12, 'DY1-S-20230902-092029', 11, 'French Fries', 20000, '[{\"variants_name\":\"melted cheese\",\"price\":3000}]', '2023-09-02 11:06:33', NULL),
(13, 'DY1-S-20230902-092029', 14, 'Yakimeshi Salmon', 89000, NULL, '2023-09-02 11:06:33', NULL),
(14, 'DY2-S-20230902-101247', 5, 'Chicken Wings Honey', 39000, NULL, '2023-09-02 11:09:06', NULL),
(15, 'DY2-S-20230902-101247', 20, 'Summer Tea', 17000, NULL, '2023-09-02 11:09:06', NULL),
(16, 'DY2-S-20230902-102229', 6, 'Blossom Onion', 39500, NULL, '2023-09-02 11:09:06', NULL),
(17, 'DY2-S-20230902-102229', 23, 'Ice Americano', 21000, NULL, '2023-09-02 11:09:06', NULL),
(18, 'DY2-S-20230902-104952', 7, 'Bitter Ballen', 30000, NULL, '2023-09-02 11:09:06', NULL),
(19, 'DY2-S-20230902-104952', 28, 'Ice Thai Tea', 12000, NULL, '2023-09-02 11:09:06', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_code`) USING BTREE;

--
-- Indexes for table `client_api`
--
ALTER TABLE `client_api`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `product_variant`
--
ALTER TABLE `product_variant`
  ADD PRIMARY KEY (`variant_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`sales_id`);

--
-- Indexes for table `sales_detail`
--
ALTER TABLE `sales_detail`
  ADD PRIMARY KEY (`sales_item`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client_api`
--
ALTER TABLE `client_api`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `product_variant`
--
ALTER TABLE `product_variant`
  MODIFY `variant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `sales_detail`
--
ALTER TABLE `sales_detail`
  MODIFY `sales_item` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
