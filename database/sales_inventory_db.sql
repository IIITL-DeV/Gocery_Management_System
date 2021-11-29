-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2021 at 07:12 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.3.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sales_inventory_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `name`) VALUES
(1, 'Fruits & Vegetables'),
(2, 'Foodgrains, Oil & Masala'),
(3, 'Bakery, Cakes & Dairy'),
(4, 'Beverages'),
(5, 'Snacks & BrandedFood'),
(6, 'Cleaning & Households');

-- --------------------------------------------------------

--
-- Table structure for table `customer_list`
--

CREATE TABLE `customer_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `contact` varchar(30) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer_list`
--

INSERT INTO `customer_list` (`id`, `name`, `contact`, `address`) VALUES
(4, 'Vikram', '987873212', 'Sample address 1'),
(5, 'alok kumar', '9893571276', 'Sample address 2'),
(6, 'aman singh', '8943592398', 'Sample address 3'),
(7, 'ajeet', '9898363712', 'Sample address 4'),
(8, 'Amit Kumar', '3767862412', 'Sample address 5');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `qty` int(30) NOT NULL,
  `type` tinyint(1) NOT NULL COMMENT '1= stockin , 2 = stockout',
  `stock_from` varchar(100) NOT NULL COMMENT 'sales/receiving',
  `form_id` int(30) NOT NULL,
  `other_details` text NOT NULL,
  `remarks` text NOT NULL,
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`id`, `product_id`, `qty`, `type`, `stock_from`, `form_id`, `other_details`, `remarks`, `date_updated`) VALUES
(95, 15, 30, 1, 'receiving', 20, '{\"price\":\"40\",\"qty\":\"30\"}', 'Stock from Receiving-00000000\n', '2021-11-05 23:18:40'),
(96, 11, 100, 1, 'receiving', 21, '{\"price\":\"180\",\"qty\":\"100\"}', 'Stock from Receiving-29515997\n', '2021-11-05 23:19:06'),
(97, 10, 40, 1, 'receiving', 22, '{\"price\":\"69\",\"qty\":\"40\"}', 'Stock from Receiving-98958072\n', '2021-11-05 23:20:02'),
(98, 12, 10, 1, 'receiving', 22, '{\"price\":\"29\",\"qty\":\"10\"}', 'Stock from Receiving-98958072\n', '2021-11-05 23:20:02'),
(99, 9, 15, 1, 'receiving', 22, '{\"price\":\"120\",\"qty\":\"15\"}', 'Stock from Receiving-98958072\n', '2021-11-05 23:20:02'),
(100, 13, 10, 1, 'receiving', 23, '{\"price\":\"50\",\"qty\":\"10\"}', 'Stock from Receiving-43107568\r\n', '2021-11-05 23:24:42'),
(101, 14, 20, 1, 'receiving', 23, '{\"price\":\"190\",\"qty\":\"20\"}', 'Stock from Receiving-43107568\r\n', '2021-11-05 23:24:42'),
(102, 8, 50, 1, 'receiving', 23, '{\"price\":\"85\",\"qty\":\"50\"}', 'Stock from Receiving-43107568\r\n', '2021-11-05 23:24:42'),
(103, 15, 3, 2, 'Sales', 20, '{\"price\":\"40\",\"qty\":\"3\"}', 'Stock out from Sales-00000000\n', '2021-11-05 23:22:23'),
(104, 11, 5, 2, 'Sales', 20, '{\"price\":\"180\",\"qty\":\"5\"}', 'Stock out from Sales-00000000\n', '2021-11-05 23:22:23'),
(105, 12, 2, 2, 'Sales', 20, '{\"price\":\"29\",\"qty\":\"2\"}', 'Stock out from Sales-00000000\n', '2021-11-05 23:22:23'),
(106, 9, 5, 2, 'Sales', 21, '{\"price\":\"120\",\"qty\":\"5\"}', 'Stock out from Sales-62501242\n', '2021-11-05 23:22:45'),
(107, 8, 1, 2, 'Sales', 22, '{\"price\":\"85\",\"qty\":\"1\"}', 'Stock out from Sales-86568962\n', '2021-11-05 23:23:12'),
(108, 10, 2, 2, 'Sales', 22, '{\"price\":\"69\",\"qty\":\"2\"}', 'Stock out from Sales-86568962\n', '2021-11-05 23:23:12'),
(109, 12, 2, 2, 'Sales', 23, '{\"price\":\"29\",\"qty\":\"2\"}', 'Stock out from Sales-28349431\n', '2021-11-05 23:28:32'),
(110, 11, 3, 2, 'Sales', 24, '{\"price\":\"180\",\"qty\":\"3\"}', 'Stock out from Sales-98596016\n', '2021-11-05 23:29:37');

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `product_id` varchar(50) NOT NULL,
  `price` double NOT NULL,
  `name` varchar(150) NOT NULL,
  `mfg_date` date NOT NULL,
  `exp_date` date NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`id`, `category_id`, `product_id`, `price`, `name`, `mfg_date`, `exp_date`, `description`) VALUES
(8, 4, '85429972', 85, 'soft drink', '2021-10-05', '2021-12-31', 'Cola'),
(9, 3, '21728007', 120, 'pancake', '2021-10-05', '2021-10-12', 'tasty pancakes'),
(10, 6, '91250028', 69, 'handwash ', '2021-10-08', '2023-07-09', 'Dettol'),
(11, 2, '35219840', 180, 'Fortuine', '2021-11-05', '2023-11-05', 'oil'),
(12, 3, '39107752', 29, 'Milk', '2021-11-10', '2021-11-14', 'milk'),
(13, 3, '81003214', 50, 'pastry', '2021-11-05', '2021-11-17', 'Tasty Cake'),
(14, 6, '00801696', 190, 'Room Freshner', '2021-11-05', '2023-11-05', 'Room Spry');

-- --------------------------------------------------------

--
-- Table structure for table `receiving_list`
--

CREATE TABLE `receiving_list` (
  `id` int(30) NOT NULL,
  `ref_no` varchar(100) NOT NULL,
  `supplier_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `date_added` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `receiving_list`
--

INSERT INTO `receiving_list` (`id`, `ref_no`, `supplier_id`, `total_amount`, `date_added`) VALUES
(20, '00000000\n', 1, 1200, '2021-11-05 23:18:40'),
(21, '29515997\n', 3, 18000, '2021-11-05 23:19:06'),
(22, '98958072\n', 5, 4850, '2021-11-05 23:20:02'),
(23, '43107568\n', 5, 8550, '2021-11-05 23:21:01');

-- --------------------------------------------------------

--
-- Table structure for table `sales_list`
--

CREATE TABLE `sales_list` (
  `id` int(30) NOT NULL,
  `ref_no` varchar(30) NOT NULL,
  `customer_id` int(30) NOT NULL,
  `total_amount` double NOT NULL,
  `amount_discount` double NOT NULL,
  `discount_amount` double NOT NULL,
  `date_updated` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sales_list`
--

INSERT INTO `sales_list` (`id`, `ref_no`, `customer_id`, `total_amount`, `amount_discount`, `discount_amount`, `date_updated`) VALUES
(20, '00000000\n', 6, 1078, 11, 1067, '2021-11-05 23:22:23'),
(21, '62501242\n', 7, 600, 5, 595, '2021-11-05 23:22:45'),
(22, '86568962\n', 8, 223, 14, 209, '2021-11-05 23:23:12'),
(23, '28349431\n', 4, 58, 0, 58, '2021-11-05 23:28:32'),
(24, '98596016\n', 8, 540, 3, 537, '2021-11-05 23:29:37');

-- --------------------------------------------------------

--
-- Table structure for table `supplier_list`
--

CREATE TABLE `supplier_list` (
  `id` int(30) NOT NULL,
  `supplier_name` text NOT NULL,
  `contact` varchar(30) NOT NULL,
  `address` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `supplier_list`
--

INSERT INTO `supplier_list` (`id`, `supplier_name`, `contact`, `address`) VALUES
(1, 'Supplier 1', '65524556', 'Sample Address'),
(3, 'Supplier 2', '6546531', 'Supplier2 Address'),
(5, 'Supplier 3', '9878732123', 'Sample address 3'),
(6, 'Supplier 4', '8943592398', 'Sample address 4'),
(7, 'Supplier 5', '3767862412', 'Sample address 5');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'Online Food Ordering System', 'info@sample.com', '+6948 8542 623', '1600654680_photo-1504674900247-0877df9cc836.jpg', '&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;font-size:28px;background: transparent; position: relative;&quot;&gt;ABOUT US&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;background: transparent; position: relative; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size:28px;background: transparent; position: relative;&quot;&gt;&lt;b style=&quot;margin: 0px; padding: 0px; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; text-align: justify;&quot;&gt;Lorem Ipsum&lt;/b&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-weight: 400; text-align: justify;&quot;&gt;&amp;nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&amp;#x2019;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.&lt;/span&gt;&lt;br&gt;&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;background: transparent; position: relative; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size:28px;background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-weight: 400; text-align: justify;&quot;&gt;&lt;br&gt;&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/p&gt;&lt;p style=&quot;text-align: center; background: transparent; position: relative;&quot;&gt;&lt;span style=&quot;background: transparent; position: relative; font-size: 14px;&quot;&gt;&lt;span style=&quot;font-size:28px;background: transparent; position: relative;&quot;&gt;&lt;h2 style=&quot;font-size:28px;background: transparent; position: relative;&quot;&gt;Where does it come from?&lt;/h2&gt;&lt;p style=&quot;text-align: center; margin-bottom: 15px; padding: 0px; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-weight: 400;&quot;&gt;Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of &quot;de Finibus Bonorum et Malorum&quot; (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, &quot;Lorem ipsum dolor sit amet..&quot;, comes from a line in section 1.10.32.&lt;/p&gt;&lt;/span&gt;&lt;/b&gt;&lt;/span&gt;&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=admin , 2 = cashier'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(1, 'Administrator', 'admin', 'admin123', 1),
(4, 'Yashraj', 'yash123', 'yash123', 1),
(5, 'vineet km', 'vineet009', 'vineet123', 2),
(6, 'kuldeep kumar', 'kuldeep', 'kuldeep123', 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customer_list`
--
ALTER TABLE `customer_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `receiving_list`
--
ALTER TABLE `receiving_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sales_list`
--
ALTER TABLE `sales_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `supplier_list`
--
ALTER TABLE `supplier_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
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
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customer_list`
--
ALTER TABLE `customer_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `inventory`
--
ALTER TABLE `inventory`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;

--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `receiving_list`
--
ALTER TABLE `receiving_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `sales_list`
--
ALTER TABLE `sales_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `supplier_list`
--
ALTER TABLE `supplier_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
