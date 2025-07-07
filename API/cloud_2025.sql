-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 07-07-2025 a las 06:10:47
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cloud 2025`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActivarUsuario` (IN `p_user_id` INT)   BEGIN
    UPDATE User
    SET state = 1
    WHERE id = p_user_id AND state = 0;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateGame` (IN `p_game_name` VARCHAR(100), IN `p_created_by` INT)   BEGIN
    INSERT INTO Games (game_name, created_by, modified_by, state)
    VALUES (p_game_name, p_created_by, p_created_by, 1);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateGameScore` (IN `p_gameid` INT, IN `p_userID` INT, IN `p_score` INT, IN `p_created_by` INT)   BEGIN
    INSERT INTO GameScores (gameid, userID, score, created_by, modified_by, state)
    VALUES (p_gameid, p_userID, p_score, p_created_by, p_created_by, 1);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateLogin` (IN `p_user_id` INT, IN `p_ip_address` VARCHAR(45), IN `p_attempt_count` INT, IN `p_created_by` INT)   BEGIN
    INSERT INTO Login (user_id, ip_address, attempt_count, created_by, modified_by, state)
    VALUES (p_user_id, p_ip_address, p_attempt_count, p_created_by, p_created_by, 1);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateUser` (IN `p_username` VARCHAR(50), IN `p_email` VARCHAR(100), IN `p_password` VARCHAR(255), IN `p_created_by` INT)   BEGIN
    INSERT INTO User (username, email, password, created_by, modified_by, state)
    VALUES (p_username, p_email, p_password, p_created_by, p_created_by, 0);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `CreateUserToken` (IN `p_userid` INT, IN `p_token` VARCHAR(255), IN `p_created_by` INT)   BEGIN
    INSERT INTO UserTokens (userid, token, created_by, modified_by, state)
    VALUES (p_userid, p_token, p_created_by, p_created_by, 1);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteGame` (IN `p_id` INT)   BEGIN
    UPDATE Games
    SET state = 3
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteGameScore` (IN `p_id` INT)   BEGIN
    UPDATE GameScores
    SET state = 3
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteLogin` (IN `p_id` INT)   BEGIN
    UPDATE Login
    SET state = 3
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteUser` (IN `p_id` INT)   BEGIN
    UPDATE User
    SET state = 3
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DeleteUserToken` (IN `p_id` INT)   BEGIN
    UPDATE UserTokens
    SET state = 3
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `LoginProcedure` (IN `p_email` VARCHAR(100), IN `p_password` VARCHAR(255))   BEGIN
    SELECT * FROM User
    WHERE email = p_email AND password = p_password AND state = 1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ReadGames` ()   BEGIN
    SELECT * FROM Games;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ReadGameScores` ()   BEGIN
    SELECT * FROM GameScores;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ReadLogins` ()   BEGIN
    SELECT * FROM Login;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ReadUsers` ()   BEGIN
    SELECT * FROM User;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ReadUserTokens` ()   BEGIN
    SELECT * FROM UserTokens;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateGame` (IN `p_id` INT, IN `p_game_name` VARCHAR(100), IN `p_modified_by` INT)   BEGIN
    UPDATE Games
    SET game_name = p_game_name,
        modified_by = p_modified_by,
        modified_at = CURRENT_TIMESTAMP
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateGameScore` (IN `p_id` INT, IN `p_score` INT, IN `p_modified_by` INT)   BEGIN
    UPDATE GameScores
    SET score = p_score,
        modified_by = p_modified_by,
        modified_at = CURRENT_TIMESTAMP
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateLogin` (IN `p_id` INT, IN `p_ip_address` VARCHAR(45), IN `p_attempt_count` INT, IN `p_modified_by` INT)   BEGIN
    UPDATE Login
    SET ip_address = p_ip_address,
        attempt_count = p_attempt_count,
        modified_by = p_modified_by,
        modified_at = CURRENT_TIMESTAMP
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateUser` (IN `p_id` INT, IN `p_username` VARCHAR(50), IN `p_email` VARCHAR(100), IN `p_password` VARCHAR(255), IN `p_modified_by` INT)   BEGIN
    UPDATE User
    SET username = p_username,
        email = p_email,
        password = p_password,
        modified_by = p_modified_by,
        modified_at = CURRENT_TIMESTAMP
    WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `UpdateUserToken` (IN `p_id` INT, IN `p_token` VARCHAR(255), IN `p_login_attempts` INT, IN `p_modified_by` INT)   BEGIN
    UPDATE UserTokens
    SET token = p_token,
        login_attempts = p_login_attempts,
        modified_by = p_modified_by,
        modified_at = CURRENT_TIMESTAMP
    WHERE id = p_id;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `games`
--

CREATE TABLE `games` (
  `id` int(11) NOT NULL,
  `gamename` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `created_by` varchar(50) DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `modified_by` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `game_scores`
--

CREATE TABLE `game_scores` (
  `id` int(11) NOT NULL,
  `game_id` int(11) DEFAULT NULL,
  `time` time DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `state_type`
--

CREATE TABLE `state_type` (
  `id` tinyint(4) NOT NULL,
  `description` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `created_by` varchar(100) DEFAULT NULL,
  `modified_at` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `modified_by` varchar(100) DEFAULT NULL,
  `state` tinyint(4) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user_tokens`
--

CREATE TABLE `user_tokens` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `token` varchar(255) NOT NULL,
  `login_attempt` int(11) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `created_by` varchar(50) DEFAULT NULL,
  `modified_at` datetime DEFAULT NULL ON UPDATE current_timestamp(),
  `modified_by` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `games`
--
ALTER TABLE `games`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `game_scores`
--
ALTER TABLE `game_scores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `game_id` (`game_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indices de la tabla `state_type`
--
ALTER TABLE `state_type`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `state` (`state`);

--
-- Indices de la tabla `user_tokens`
--
ALTER TABLE `user_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token` (`token`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `games`
--
ALTER TABLE `games`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `game_scores`
--
ALTER TABLE `game_scores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `user_tokens`
--
ALTER TABLE `user_tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `game_scores`
--
ALTER TABLE `game_scores`
  ADD CONSTRAINT `game_scores_ibfk_1` FOREIGN KEY (`game_id`) REFERENCES `games` (`id`),
  ADD CONSTRAINT `game_scores_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Filtros para la tabla `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`state`) REFERENCES `state_type` (`id`);

--
-- Filtros para la tabla `user_tokens`
--
ALTER TABLE `user_tokens`
  ADD CONSTRAINT `user_tokens_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
