-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июл 17 2022 г., 00:34
-- Версия сервера: 10.4.21-MariaDB
-- Версия PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `traffic`
--
CREATE DATABASE IF NOT EXISTS `traffic` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `traffic`;

-- --------------------------------------------------------

--
-- Структура таблицы `client`
--

CREATE TABLE `client` (
  `ID_Client` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `login` varchar(40) NOT NULL,
  `password` varchar(20) NOT NULL,
  `IP` varchar(15) NOT NULL,
  `balance` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `client`
--

INSERT INTO `client` (`ID_Client`, `name`, `login`, `password`, `IP`, `balance`) VALUES
(1, 'Денис', 'cherivashenkodenis@gmail.com', '587209gdfh32', '192.168.5.255', -123),
(2, 'Мария', 'mariapetrova@gmail.com', 'zxcvbnm,', '255.255.255.0', 1078),
(3, 'Александр', 'sashaaleks23gmail.com', 'asdfghjk89', '1.1.1.1', 4986),
(4, 'Наталия', 'Nataliadymanova@gmail.com', 'safdsg436', '192.168.5.0', -1),
(5, 'Юрий', 'yuriyklimov34@gmail.com', '1249877dfvdfb45', '10.0.0.0', 93);

-- --------------------------------------------------------

--
-- Структура таблицы `seanse`
--

CREATE TABLE `seanse` (
  `ID_Seanse` int(11) NOT NULL,
  `start` datetime NOT NULL,
  `stop` datetime NOT NULL,
  `in_traffic` int(11) NOT NULL,
  `out_traffic` int(11) NOT NULL,
  `FID_Client` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `seanse`
--

INSERT INTO `seanse` (`ID_Seanse`, `start`, `stop`, `in_traffic`, `out_traffic`, `FID_Client`) VALUES
(1, '2022-03-23 12:13:56', '2022-04-08 23:23:59', 3487163, 47827, 4),
(2, '2022-12-22 17:56:01', '2022-12-30 19:11:11', 6742, 456, 2),
(3, '2021-05-01 21:21:34', '2021-05-26 07:44:44', 689176836, 5667104, 1),
(4, '2022-10-10 12:54:34', '2022-10-20 01:15:12', 6487234, 78956, 5);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`ID_Client`);

--
-- Индексы таблицы `seanse`
--
ALTER TABLE `seanse`
  ADD PRIMARY KEY (`ID_Seanse`),
  ADD KEY `FID_Client` (`FID_Client`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `client`
--
ALTER TABLE `client`
  MODIFY `ID_Client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT для таблицы `seanse`
--
ALTER TABLE `seanse`
  MODIFY `ID_Seanse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `seanse`
--
ALTER TABLE `seanse`
  ADD CONSTRAINT `seanse_ibfk_1` FOREIGN KEY (`FID_Client`) REFERENCES `client` (`ID_Client`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
