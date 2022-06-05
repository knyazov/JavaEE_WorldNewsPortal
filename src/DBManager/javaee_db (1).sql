-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 05 2022 г., 14:49
-- Версия сервера: 10.4.22-MariaDB
-- Версия PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `javaee_db`
--

-- --------------------------------------------------------

--
-- Структура таблицы `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Структура таблицы `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `countries`
--

INSERT INTO `countries` (`id`, `name`, `code`) VALUES
(1, 'KAZAKHSTAN', 'KAZ'),
(2, 'GREAT BRITAIN', 'GBR'),
(3, 'UNITED STATES OF AMERICA', 'USA'),
(4, 'CANADA', 'CAD');

-- --------------------------------------------------------

--
-- Структура таблицы `foods`
--

CREATE TABLE `foods` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `name` text DEFAULT NULL,
  `photo` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `paste_date` timestamp NULL DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `foods`
--

INSERT INTO `foods` (`id`, `user_id`, `name`, `photo`, `description`, `paste_date`, `price`) VALUES
(1, 2, 'Soup', 'https://images.immediate.co.uk/production/volatile/sites/30/2020/08/recipe-image-legacy-id-1074500_11-4325965.jpg?quality=90&webp=true&resize=375,341', '<p>Just a few quick pantry ingredients and some choice aromatics bring this soup together in minutes. Have a grilled cheese cooking on the side while you throw this together and you have a comfort-food lunch that will relax and sustain you through a cold day.</p>', '2022-06-02 04:30:33', 500),
(3, 2, 'PLOV', 'https://thumbs.dreamstime.com/b/plov-1644669.jpg', '<p>Uzbek pilaf in a cauldron is rightfully considered the most popular type of this dish. Of course, you can cook it in a saucepan and in a frying pan, but the result will not be convincing enough. The fact is that it is the cauldron - large, heavy and deep - that provides the conditions due to which the ingredients of pilaf acquire the correct texture, and are also saturated with the tastes and aromas of each other. Even the most demanding connoisseur of Uzbek cuisine will not be ashamed to serve such a dish! Although, to be honest, there will always be someone who will note any violation of the classical foundations. We will not argue with him, we will only note that there are many recipes for Uzbek pilaf in a cauldron, and almost every family in this eastern country has its own version.</p>', '2022-06-04 11:01:39', 1250),
(4, 2, 'HOT DOG', 'https://e2.edimdoma.ru/data/posts/0001/6493/16493-ed4_wide.jpg?1631186249', '<p>This sandwich can be easily found in almost any country in the world. People from young to old are happy to eat hot dogs on both cheeks, not really thinking about the strange and not the most appetizing name. Let\'s try to figure out how a sausage in a bun turned into a \"hot dog\" and what hot dog recipes exist in different parts of the globe.</p>', '2022-06-02 07:00:26', 650),
(5, 2, 'PIZZA MARGARITA', 'https://beebom.com/wp-content/uploads/2019/10/pizza-robot.jpg?w=730&h=487&crop=1&quality=75', '<p>This is one of the most versatile options and is especially popular among Italian food lovers and all those who love spicy dishes. The pizza got its name because of the main ingredient - the eponymous type of spicy salami sausage, also from Italy. But at home it is called \"Pizza Diabola\", which translates as \"Devil\'s Pizza\". This is due to the rich spicy taste that is familiar to every gourmet.</p>', '2022-06-04 11:05:01', 2800);

-- --------------------------------------------------------

--
-- Структура таблицы `languages`
--

CREATE TABLE `languages` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `languages`
--

INSERT INTO `languages` (`id`, `name`, `code`) VALUES
(1, 'English', 'ENG'),
(2, 'Русский', 'РУС');

-- --------------------------------------------------------

--
-- Структура таблицы `news`
--

CREATE TABLE `news` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `short_content` text DEFAULT NULL,
  `content` text DEFAULT NULL,
  `post_date` timestamp NULL DEFAULT NULL,
  `picture_url` text DEFAULT NULL,
  `language_id` int(11) DEFAULT NULL,
  `publication_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `news`
--

INSERT INTO `news` (`id`, `title`, `short_content`, `content`, `post_date`, `picture_url`, `language_id`, `publication_id`) VALUES
(1, 'Amber Heard and Johnny Depp\'s \'Trial by TikTok\'', 'It wasn\'t meant to be a viral video. I was, like, in my pyjamas.', 'Yasmine Bedward', NULL, 'https://ichef.bbci.co.uk/news/976/cpsprodpb/140BD/production/_124990128_gettyimages-492267182.jpg', 1, 1),
(3, 'Токаев проголосовал на республиканском референдуме', 'Президент Казахстана Касым-Жомарт Токаев проголосовал на республиканском референдуме по внесению поправок в Конституцию страны', 'Глава государства отдал свой голос на избирательном участке №59, расположенном в столичном Дворце школьников.\n\nВ Казахстане проходит республиканский референдум по поправкам в Конституцию.\n\nУчастки по всей стране открылись 5 июня в 7:00. Проголосовать можно будет до 20:00.\n\nВсего в Казахстане работают 10 012 участков, за рубежом – 65.\n\nРеферендум будет признан состоявшимся, если в нем примут участие более половины включенных в списки граждан.', NULL, 'https://zakon-img1.object.pscloud.io/84e8c3dce9834ddaac51f30566d38942.jpeg', 2, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `publications`
--

CREATE TABLE `publications` (
  `id` int(11) NOT NULL,
  `name` text DEFAULT NULL,
  `description` text DEFAULT NULL,
  `rating` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `publications`
--

INSERT INTO `publications` (`id`, `name`, `description`, `rating`) VALUES
(1, 'CNN', 'CNN (read as CNN; abbr. from the English Cable News Network - Cable News Network) is a US television channel headquartered in Atlanta. Founded in 1980 by American entrepreneur Ted Turner. It is a division of CNN Global owned by Warner Bros. discovery. CNN was the first in the world to propose the concept of continuous round-the-clock news broadcasting.', 10),
(2, 'BBC', 'The British Broadcasting Corporation (eng. British Broadcasting Corporation, BBC, BBC) is a British broadcasting organization in the form of a statutory corporation.', 8.5);

-- --------------------------------------------------------

--
-- Структура таблицы `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `role` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `roles`
--

INSERT INTO `roles` (`id`, `role`) VALUES
(1, 'student'),
(2, 'admin');

-- --------------------------------------------------------

--
-- Структура таблицы `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `birth_date` date NOT NULL,
  `city` varchar(255) NOT NULL,
  `country_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `students`
--

INSERT INTO `students` (`id`, `name`, `surname`, `birth_date`, `city`, `country_id`) VALUES
(1, 'Cilian', 'Murphy', '1992-05-18', 'Boston', 3),
(2, 'Akzhol', 'Knyazov', '2020-11-24', 'Almaty', 1),
(3, 'Tom', 'Hardy', '1988-12-12', 'Birmingham', 2),
(4, 'Nurgissa', 'Ussen', '1998-10-13', 'Aktau', 1),
(5, 'Quka', 'Salyq', '1998-07-21', 'Almaty', 1),
(8, 'Dimash', 'Kudaibergen', '1995-11-06', 'Almaty', 1),
(9, 'Adriano', 'Celentano', '1950-10-16', 'Toronto', 4),
(10, 'Ali', 'Emamian', '2004-03-09', 'Almaty', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `name`, `surname`, `email`, `password`, `role`) VALUES
(2, 'Thomas', 'Shelby', 'tom@gmail.com', 'tom123', 1);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_email_uindex` (`email`);

--
-- Индексы таблицы `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `foods`
--
ALTER TABLE `foods`
  ADD PRIMARY KEY (`id`),
  ADD KEY `foods_users__fk` (`user_id`);

--
-- Индексы таблицы `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`),
  ADD KEY `news_languages__fk` (`language_id`),
  ADD KEY `news_publications__fk` (`publication_id`);

--
-- Индексы таблицы `publications`
--
ALTER TABLE `publications`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`),
  ADD KEY `students_countries_id_fk` (`country_id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_uindex` (`email`),
  ADD KEY `users_roles__fk` (`role`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `foods`
--
ALTER TABLE `foods`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `news`
--
ALTER TABLE `news`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `publications`
--
ALTER TABLE `publications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `foods`
--
ALTER TABLE `foods`
  ADD CONSTRAINT `foods_users__fk` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Ограничения внешнего ключа таблицы `news`
--
ALTER TABLE `news`
  ADD CONSTRAINT `news_languages__fk` FOREIGN KEY (`language_id`) REFERENCES `languages` (`id`),
  ADD CONSTRAINT `news_publications__fk` FOREIGN KEY (`publication_id`) REFERENCES `publications` (`id`);

--
-- Ограничения внешнего ключа таблицы `students`
--
ALTER TABLE `students`
  ADD CONSTRAINT `students_countries_id_fk` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`);

--
-- Ограничения внешнего ключа таблицы `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_roles__fk` FOREIGN KEY (`role`) REFERENCES `roles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
