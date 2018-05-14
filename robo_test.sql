-- phpMyAdmin SQL Dump
-- version 3.5.1
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1
-- Время создания: Май 14 2018 г., 19:40
-- Версия сервера: 5.5.25
-- Версия PHP: 5.3.13

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- База данных: `robo_test`
--

-- --------------------------------------------------------

--
-- Структура таблицы `application`
--

CREATE TABLE IF NOT EXISTS `application` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `status` varchar(100) NOT NULL,
  `requested_amount` decimal(10,2) NOT NULL,
  `requested_period` int(11) NOT NULL,
  `approved_amount` decimal(10,2) NOT NULL,
  `approved_period` int(11) NOT NULL,
  `offer_id` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Дамп данных таблицы `application`
--

INSERT INTO `application` (`id`, `client_id`, `status`, `requested_amount`, `requested_period`, `approved_amount`, `approved_period`, `offer_id`, `created_at`, `updated_at`) VALUES
(1, 2, 'Тестовая заявка 1', '100000.00', 30, '10000.00', 20, 0, '2018-05-14 07:24:08', '0000-00-00 00:00:00'),
(2, 2, 'Тестовая заявка 2', '200000.00', 30, '10000.00', 20, 1, '2018-05-14 07:24:17', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `credit`
--

CREATE TABLE IF NOT EXISTS `credit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `application_id` int(11) NOT NULL,
  `status` varchar(100) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Дамп данных таблицы `credit`
--

INSERT INTO `credit` (`id`, `client_id`, `application_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 'Тестовый статус', '2018-05-14 07:43:23', '0000-00-00 00:00:00'),
(2, 2, 1, 'Тестовый статус 2', '2018-05-14 07:43:38', '0000-00-00 00:00:00'),
(3, 3, 1, 'Тестовый статус 2', '2018-05-14 07:43:43', '0000-00-00 00:00:00'),
(4, 3, 1, 'Тестовый статус 2', '2018-05-14 07:43:47', '0000-00-00 00:00:00'),
(5, 2, 1, 'Тестовый статус 2', '2018-05-14 07:43:51', '0000-00-00 00:00:00');

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
