-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 14 Okt 2026 pada 11.42
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hotel_management`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `companions`
--

CREATE TABLE `companions` (
  `companion_id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `companions`
--

INSERT DELAYED IGNORE INTO `companions` (`companion_id`, `reservation_id`, `name`) VALUES
(1, 1, 'Jane Doe'),
(2, 2, 'Jhon Doe');

-- --------------------------------------------------------

--
-- Struktur dari tabel `guests`
--

CREATE TABLE `guests` (
  `guest_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `id_number` varchar(50) DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `guests`
--

INSERT DELAYED IGNORE INTO `guests` (`guest_id`, `name`, `phone`, `id_number`, `created_at`, `email`) VALUES
(1, 'Jhon Doe', '081397465890', '6382764', '2026-04-27 13:25:19', 'jhondoe@gmail.com'),
(2, 'Jane Doe', '0823874562', '6542890', '2026-04-28 12:56:46', 'jane.doe@gmail.com');

-- --------------------------------------------------------

--
-- Struktur dari tabel `guestservices`
--

CREATE TABLE `guestservices` (
  `guest_service_id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `service_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `total_price` decimal(10,2) NOT NULL,
  `order_time` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `guestservices`
--

INSERT DELAYED IGNORE INTO `guestservices` (`guest_service_id`, `reservation_id`, `service_id`, `quantity`, `total_price`, `order_time`) VALUES
(1, 1, 1, 2, 13.34, '2026-04-27 13:32:17'),
(2, 1, 2, 2, 10.00, '2026-04-27 13:32:17'),
(3, 1, 3, 2, 3.34, '2026-04-27 13:32:17'),
(4, 1, 4, 1, 1.33, '2026-04-27 13:32:17'),
(5, 1, 5, 2, 1.34, '2026-04-27 13:32:17'),
(6, 1, 7, 2, 6.66, '2026-04-27 13:32:17'),
(7, 1, 8, 1, 2.67, '2026-04-27 13:32:17'),
(8, 1, 9, 2, 2.00, '2026-04-27 13:32:17'),
(9, 1, 11, 2, 33.34, '2026-04-27 13:32:17'),
(10, 1, 10, 1, 10.00, '2026-04-27 13:32:17'),
(11, 2, 1, 1, 6.67, '2026-04-28 12:59:49'),
(12, 2, 3, 1, 1.67, '2026-04-28 12:59:49');

-- --------------------------------------------------------

--
-- Struktur dari tabel `invoices`
--

CREATE TABLE `invoices` (
  `invoice_id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL,
  `issued_date` datetime DEFAULT current_timestamp(),
  `status` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `invoices`
--

INSERT DELAYED IGNORE INTO `invoices` (`invoice_id`, `reservation_id`, `total_amount`, `issued_date`, `status`) VALUES
(1, 1, 90.00, '2026-04-27 00:00:00', 'Paid'),
(2, 1, 84.02, '2026-04-27 00:00:00', 'Paid'),
(3, 2, 50.00, '2026-04-28 00:00:00', 'Paid'),
(4, 2, 8.34, '2026-04-28 00:00:00', 'Paid');

-- --------------------------------------------------------

--
-- Struktur dari tabel `payments`
--

CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_method` varchar(50) NOT NULL,
  `amount` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `payments`
--

INSERT DELAYED IGNORE INTO `payments` (`payment_id`, `invoice_id`, `payment_date`, `payment_method`, `amount`) VALUES
(1, 1, '2026-04-27', 'Cash', 90.00),
(2, 2, '2026-04-27', 'Cash', 84.02),
(3, 3, '2026-04-28', 'Cash', 50.00),
(4, 4, '2026-04-28', 'Cash', 8.34);

-- --------------------------------------------------------

--
-- Struktur dari tabel `reservations`
--

CREATE TABLE `reservations` (
  `reservation_id` int(11) NOT NULL,
  `guest_id` int(11) NOT NULL,
  `room_type_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `reservation_date` datetime DEFAULT current_timestamp(),
  `check_in_date` date NOT NULL,
  `check_out_date` date NOT NULL,
  `status` varchar(50) NOT NULL,
  `total_amount` decimal(10,2) NOT NULL DEFAULT 0.00,
  `payment_status` varchar(20) DEFAULT 'Unpaid'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `reservations`
--

INSERT DELAYED IGNORE INTO `reservations` (`reservation_id`, `guest_id`, `room_type_id`, `room_id`, `reservation_date`, `check_in_date`, `check_out_date`, `status`, `total_amount`, `payment_status`) VALUES
(1, 1, 2, 3, '2026-04-27 13:26:32', '2026-04-27', '2026-04-28', 'Checked-Out', 90.00, 'Unpaid'),
(2, 2, 3, 5, '2026-04-28 12:57:43', '2026-04-28', '2026-04-29', 'Checked-Out', 50.00, 'Unpaid');

-- --------------------------------------------------------

--
-- Struktur dari tabel `rooms`
--

CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL,
  `room_number` varchar(100) NOT NULL,
  `room_type_id` int(11) NOT NULL,
  `status_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `rooms`
--

INSERT DELAYED IGNORE INTO `rooms` (`room_id`, `room_number`, `room_type_id`, `status_id`) VALUES
(1, '201', 1, 1),
(2, '202', 1, 1),
(3, '251', 2, 1),
(4, '252', 2, 1),
(5, '301', 3, 1),
(6, '302', 3, 1),
(7, '351', 5, 1),
(8, '352', 5, 1),
(9, '401', 4, 1),
(10, '402', 4, 1),
(11, '501', 6, 1),
(12, '502', 6, 1);

-- --------------------------------------------------------

--
-- Struktur dari tabel `roomstatus`
--

CREATE TABLE `roomstatus` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `roomstatus`
--

INSERT DELAYED IGNORE INTO `roomstatus` (`status_id`, `status_name`) VALUES
(1, 'Available'),
(3, 'Dirty'),
(4, 'Maintenance'),
(2, 'Occupied');

-- --------------------------------------------------------

--
-- Struktur dari tabel `roomtype`
--

CREATE TABLE `roomtype` (
  `room_type_id` int(11) NOT NULL,
  `room_type_name` varchar(50) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `capacity` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `amenities` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `roomtype`
--

INSERT DELAYED IGNORE INTO `roomtype` (`room_type_id`, `room_type_name`, `price`, `capacity`, `description`, `amenities`) VALUES
(1, 'Standard Single Room', 15.00, 1, NULL, '1 Single Bed, Wardrobe, Air Conditioning, Free WiFi, TV, Shower Bathroom'),
(2, 'Standard Room', 30.00, 2, NULL, '1 Queen Bed, Wardrobe, Air Conditioning, Free WiFi, TV, Shower Bathroom'),
(3, 'Superior Room', 50.00, 2, NULL, '1 Queen Bed, Wardrobe, Air Conditioning, Free WiFi, Smart TV, Mini Fridge, Coffee/Tea Maker, Bathtub Bathroom'),
(4, 'Deluxe Room', 80.00, 3, NULL, '1 King Bed, Balcony, Air Conditioning, Wardrobe, Free WiFi, Smart TV, Mini Bar, Bathtub'),
(5, 'Family Room', 120.00, 4, NULL, '2 Queen Beds, Air Conditioning, Wardrobe, Free WiFi, Smart TV, Mini Fridge, Sofa, Bathtub + shower Bathroom'),
(6, 'Suite Room', 180.00, 4, NULL, '1 King Bed + 1 Single Bed, Separate Living Room, Air Conditioning, Wardrobe, Free WiFi, Smart TV (2 units), Mini Bar, Bathtub + Shower, Work Desk');

-- --------------------------------------------------------

--
-- Struktur dari tabel `services`
--

CREATE TABLE `services` (
  `service_id` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `service_name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `services`
--

INSERT DELAYED IGNORE INTO `services` (`service_id`, `category`, `service_name`, `price`) VALUES
(1, 'Food & Beverage', 'Breakfast Buffet', 6.67),
(2, 'Food & Beverage', 'In-Room Dining (Meal Set)', 5.00),
(3, 'Food & Beverage', 'Coffee / Tea', 1.67),
(4, 'Food & Beverage', 'Soft Drinks', 1.33),
(5, 'Food & Beverage', 'Bottled Water', 0.67),
(6, 'Laundry Services', 'Laundry (per kg)', 2.00),
(7, 'Laundry Services', 'Express Laundry (same day)', 3.33),
(8, 'Laundry Services', 'Dry Cleaning', 2.67),
(9, 'Laundry Services', 'Ironing Only', 1.00),
(10, 'Wellness & Leisure', 'Massage (60 minutes)', 10.00),
(11, 'Wellness & Leisure', 'Spa Treatment', 16.67);

-- --------------------------------------------------------

--
-- Struktur dari tabel `stay`
--

CREATE TABLE `stay` (
  `stay_id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `actual_check_in` datetime DEFAULT NULL,
  `actual_check_out` datetime DEFAULT NULL,
  `handled_by` int(11) DEFAULT NULL,
  `check_in_time` datetime DEFAULT NULL,
  `check_out_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `stay`
--

INSERT DELAYED IGNORE INTO `stay` (`stay_id`, `reservation_id`, `actual_check_in`, `actual_check_out`, `handled_by`, `check_in_time`, `check_out_time`) VALUES
(1, 1, NULL, NULL, NULL, '2026-04-27 13:31:03', '2026-04-27 13:33:10'),
(2, 2, NULL, NULL, NULL, '2026-04-28 12:59:00', '2026-04-28 13:01:09');

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT DELAYED IGNORE INTO `users` (`user_id`, `name`, `email`, `password`, `role`, `created_at`) VALUES
(1, 'Administration', 'admin@gmail.com', '$2y$10$MzvUNAnMhaV/agZ8VgHqwONov2xpDU5WFJAhJc.O0BV/u//1rtUJy', 'Admin', '2026-04-28 15:13:09');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `companions`
--
ALTER TABLE `companions`
  ADD PRIMARY KEY (`companion_id`),
  ADD KEY `reservation_id` (`reservation_id`);

--
-- Indeks untuk tabel `guests`
--
ALTER TABLE `guests`
  ADD PRIMARY KEY (`guest_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indeks untuk tabel `guestservices`
--
ALTER TABLE `guestservices`
  ADD PRIMARY KEY (`guest_service_id`),
  ADD KEY `reservation_id` (`reservation_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indeks untuk tabel `invoices`
--
ALTER TABLE `invoices`
  ADD PRIMARY KEY (`invoice_id`),
  ADD KEY `reservation_id` (`reservation_id`);

--
-- Indeks untuk tabel `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `invoice_id` (`invoice_id`);

--
-- Indeks untuk tabel `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`reservation_id`),
  ADD KEY `guest_id` (`guest_id`);

--
-- Indeks untuk tabel `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`room_id`),
  ADD UNIQUE KEY `room_number` (`room_number`),
  ADD KEY `room_type_id` (`room_type_id`),
  ADD KEY `status_id` (`status_id`);

--
-- Indeks untuk tabel `roomstatus`
--
ALTER TABLE `roomstatus`
  ADD PRIMARY KEY (`status_id`),
  ADD UNIQUE KEY `status_name` (`status_name`);

--
-- Indeks untuk tabel `roomtype`
--
ALTER TABLE `roomtype`
  ADD PRIMARY KEY (`room_type_id`);

--
-- Indeks untuk tabel `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`service_id`);

--
-- Indeks untuk tabel `stay`
--
ALTER TABLE `stay`
  ADD PRIMARY KEY (`stay_id`),
  ADD KEY `reservation_id` (`reservation_id`),
  ADD KEY `handled_by` (`handled_by`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `companions`
--
ALTER TABLE `companions`
  MODIFY `companion_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `guests`
--
ALTER TABLE `guests`
  MODIFY `guest_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `guestservices`
--
ALTER TABLE `guestservices`
  MODIFY `guest_service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `invoices`
--
ALTER TABLE `invoices`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `payments`
--
ALTER TABLE `payments`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `reservations`
--
ALTER TABLE `reservations`
  MODIFY `reservation_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `rooms`
--
ALTER TABLE `rooms`
  MODIFY `room_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT untuk tabel `roomstatus`
--
ALTER TABLE `roomstatus`
  MODIFY `status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT untuk tabel `roomtype`
--
ALTER TABLE `roomtype`
  MODIFY `room_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `services`
--
ALTER TABLE `services`
  MODIFY `service_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT untuk tabel `stay`
--
ALTER TABLE `stay`
  MODIFY `stay_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Ketidakleluasaan untuk tabel pelimpahan (Dumped Tables)
--

--
-- Ketidakleluasaan untuk tabel `companions`
--
ALTER TABLE `companions`
  ADD CONSTRAINT `companions_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`reservation_id`);

--
-- Ketidakleluasaan untuk tabel `guestservices`
--
ALTER TABLE `guestservices`
  ADD CONSTRAINT `guestservices_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`reservation_id`),
  ADD CONSTRAINT `guestservices_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `services` (`service_id`);

--
-- Ketidakleluasaan untuk tabel `invoices`
--
ALTER TABLE `invoices`
  ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`reservation_id`);

--
-- Ketidakleluasaan untuk tabel `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`invoice_id`);

--
-- Ketidakleluasaan untuk tabel `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`guest_id`) REFERENCES `guests` (`guest_id`);

--
-- Ketidakleluasaan untuk tabel `rooms`
--
ALTER TABLE `rooms`
  ADD CONSTRAINT `rooms_ibfk_1` FOREIGN KEY (`room_type_id`) REFERENCES `roomtype` (`room_type_id`),
  ADD CONSTRAINT `rooms_ibfk_2` FOREIGN KEY (`status_id`) REFERENCES `roomstatus` (`status_id`);

--
-- Ketidakleluasaan untuk tabel `stay`
--
ALTER TABLE `stay`
  ADD CONSTRAINT `stay_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservations` (`reservation_id`),
  ADD CONSTRAINT `stay_ibfk_2` FOREIGN KEY (`handled_by`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
