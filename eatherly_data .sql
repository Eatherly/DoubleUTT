-- phpMyAdmin SQL Dump
-- version 4.7.5
-- https://www.phpmyadmin.net/
--
-- Хост: eatherly.mysql.ukraine.com.ua
-- Время создания: Дек 15 2017 г., 07:29
-- Версия сервера: 5.7.16-10-log
-- Версия PHP: 7.0.24

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `eatherly_data`
--

-- --------------------------------------------------------

--
-- Структура таблицы `id_customers`
--

CREATE TABLE `id_customers` (
  `id_customer` int(11) NOT NULL,
  `name_customer` varchar(250) NOT NULL,
  `company` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `id_customers`
--

INSERT INTO `id_customers` (`id_customer`, `name_customer`, `company`) VALUES
(1, 'Andrii', 'ESCO'),
(2, 'Leonid', 'Bosch');

-- --------------------------------------------------------

--
-- Структура таблицы `obj_contracts`
--

CREATE TABLE `obj_contracts` (
  `id_contract` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `number` varchar(100) NOT NULL,
  `date_sign` date NOT NULL,
  `staff_number` varchar(100) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `obj_contracts`
--

INSERT INTO `obj_contracts` (`id_contract`, `id_customer`, `number`, `date_sign`, `staff_number`) VALUES
(1, 1, '011', '2017-12-01', '10'),
(2, 1, '012', '2017-12-02', '20'),
(3, 1, '013', '2017-12-14', '30'),
(4, 2, '021', '2017-12-13', '15'),
(5, 2, '022', '2017-12-07', '25'),
(6, 2, '023', '2017-12-20', '35');

-- --------------------------------------------------------

--
-- Структура таблицы `obj_services`
--

CREATE TABLE `obj_services` (
  `id_service` int(11) NOT NULL,
  `id_contract` int(11) NOT NULL,
  `title_service` varchar(250) NOT NULL,
  `status` enum('work','connecting','disconnected') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `obj_services`
--

INSERT INTO `obj_services` (`id_service`, `id_contract`, `title_service`, `status`) VALUES
(1, 1, 'service_1', 'work'),
(2, 1, 'service_2', 'connecting'),
(3, 1, 'service_3', 'disconnected'),
(4, 2, 'service_4', 'work'),
(5, 2, 'service_5', 'connecting'),
(6, 2, 'service_6', 'disconnected'),
(7, 3, 'service_7', 'work'),
(8, 3, 'service_8', 'connecting'),
(9, 3, 'service_9', 'disconnected'),
(10, 4, 'service_10', 'work'),
(11, 4, 'service_11', 'connecting'),
(12, 4, 'service_12', ''),
(13, 5, 'service_13', 'work'),
(14, 5, 'service_14', 'connecting'),
(15, 5, 'service_15', 'disconnected'),
(16, 6, 'service_16', 'work'),
(17, 6, 'service_17', 'connecting'),
(18, 6, 'service_18', 'disconnected');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `id_customers`
--
ALTER TABLE `id_customers`
  ADD PRIMARY KEY (`id_customer`);

--
-- Индексы таблицы `obj_contracts`
--
ALTER TABLE `obj_contracts`
  ADD PRIMARY KEY (`id_contract`);

--
-- Индексы таблицы `obj_services`
--
ALTER TABLE `obj_services`
  ADD PRIMARY KEY (`id_service`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `id_customers`
--
ALTER TABLE `id_customers`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `obj_contracts`
--
ALTER TABLE `obj_contracts`
  MODIFY `id_contract` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `obj_services`
--
ALTER TABLE `obj_services`
  MODIFY `id_service` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
