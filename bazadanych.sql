-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Lip 29, 2024 at 01:33 PM
-- Wersja serwera: 10.4.32-MariaDB
-- Wersja PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rpg3`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `country`
--

CREATE TABLE `country` (
  `country_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `primary_language` varchar(255) DEFAULT NULL,
  `probability` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `country`
--

INSERT INTO `country` (`country_id`, `name`, `primary_language`, `probability`) VALUES
(1, 'England', 'English', 60),
(2, 'Spain', 'Spanish', 20),
(3, 'Portugal', 'Portuguese', 7),
(4, 'Dutch', 'Dutch', 4),
(5, 'France', 'French', 4),
(6, 'Maghreb', 'Arabic', 3),
(7, 'Guinea', 'Fula', 1),
(8, 'Kongo', 'Kikongo', 1),
(9, 'NativeAmerican', 'Native', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `feat`
--

CREATE TABLE `feat` (
  `feat_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `feat`
--

INSERT INTO `feat` (`feat_id`, `name`, `description`) VALUES
(1, 'Mighty Strike', 'Deliver a powerful blow that deals significant damage.'),
(2, 'Acrobatic Dodge', 'Perform a nimble dodge maneuver to evade attacks.'),
(3, 'Master of Tactics', 'Strategically position allies to gain tactical advantages.'),
(4, 'Arcane Mastery', 'Cast spells with exceptional control and potency.'),
(5, 'Sniper Shot', 'Take careful aim and shoot with deadly precision from a distance.'),
(6, 'Sneak Attack', 'Exploit enemy vulnerabilities to strike with stealth and surprise.'),
(7, 'Weapon Specialization', 'Master the use of a specific type of weapon for maximum effectiveness.'),
(8, 'Shield Bash', 'Use a shield to both defend and attack in close combat.'),
(9, 'Evasive Maneuvers', 'Swiftly maneuver through obstacles and avoid danger.'),
(10, 'Inspiring Presence', 'Inspire allies with charismatic leadership and morale boosting.'),
(11, 'Divine Intervention', 'Call upon divine powers to aid allies or smite enemies.'),
(12, 'Stealthy Infiltration', 'Infiltrate enemy territory without being detected.'),
(13, 'Natural Explorer', 'Navigate and survive in various natural environments with ease.'),
(14, 'Master Negotiator', 'Negotiate effectively to achieve favorable outcomes in diplomatic situations.'),
(15, 'Quick Reflexes', 'React swiftly to danger, allowing for faster movement and actions.'),
(16, 'Expert Healer', 'Heal wounds and ailments with great skill and efficiency.'),
(17, 'Artillery Mastery', 'Command and operate large-scale artillery for devastating attacks.'),
(18, 'Critical Focus', 'Focus attacks on vulnerable points to increase critical hit chances.'),
(19, 'Tactical Retreat', 'Strategically withdraw from combat to regroup or reposition.'),
(20, 'Spell Resistance', 'Harness magical defenses to resist hostile spells and effects.');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `name`
--

CREATE TABLE `name` (
  `name_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `name`
--

INSERT INTO `name` (`name_id`, `name`, `country_id`) VALUES
(1, 'James', 1),
(2, 'John', 1),
(3, 'Robert', 1),
(4, 'Michael', 1),
(5, 'William', 1),
(6, 'David', 1),
(7, 'Richard', 1),
(8, 'Charles', 1),
(9, 'Joseph', 1),
(10, 'Thomas', 1),
(11, 'Daniel', 1),
(12, 'Matthew', 1),
(13, 'Anthony', 1),
(14, 'Donald', 1),
(15, 'Mark', 1),
(16, 'Paul', 1),
(17, 'Steven', 1),
(18, 'Andrew', 1),
(19, 'Kenneth', 1),
(20, 'Joshua', 1),
(21, 'George', 1),
(22, 'Kevin', 1),
(23, 'Brian', 1),
(24, 'Edward', 1),
(25, 'Ronald', 1),
(26, 'Timothy', 1),
(27, 'Jason', 1),
(28, 'Jeffrey', 1),
(29, 'Ryan', 1),
(30, 'Jacob', 1),
(31, 'Gary', 1),
(32, 'Nicholas', 1),
(33, 'Eric', 1),
(34, 'Stephen', 1),
(35, 'Jonathan', 1),
(36, 'Larry', 1),
(37, 'Justin', 1),
(38, 'Scott', 1),
(39, 'Brandon', 1),
(40, 'Benjamin', 1),
(41, 'Samuel', 1),
(42, 'Gregory', 1),
(43, 'Frank', 1),
(44, 'Alexander', 1),
(45, 'Raymond', 1),
(46, 'Patrick', 1),
(47, 'Jack', 1),
(48, 'Dennis', 1),
(49, 'Jerry', 1),
(50, 'Tyler', 1),
(51, 'Aaron', 1),
(52, 'Jose', 1),
(53, 'Henry', 1),
(54, 'Douglas', 1),
(55, 'Adam', 1),
(56, 'Peter', 1),
(57, 'Zachary', 1),
(58, 'Nathan', 1),
(59, 'Walter', 1),
(60, 'Kyle', 1),
(61, 'Harold', 1),
(62, 'Carl', 1),
(63, 'Roger', 1),
(64, 'Jeremy', 1),
(65, 'Terry', 1),
(66, 'Sean', 1),
(67, 'Austin', 1),
(68, 'Arthur', 1),
(69, 'Christian', 1),
(70, 'Ethan', 1),
(71, 'Joe', 1),
(72, 'Albert', 1),
(73, 'Jesse', 1),
(74, 'Willie', 1),
(75, 'Billy', 1),
(76, 'Bryan', 1),
(77, 'Bruce', 1),
(78, 'Jordan', 1),
(79, 'Ralph', 1),
(80, 'Roy', 1),
(81, 'Alan', 1),
(82, 'Juan', 1),
(83, 'Wayne', 1),
(84, 'Eugene', 1),
(85, 'Gabriel', 1),
(86, 'Louis', 1),
(87, 'Russell', 1),
(88, 'Vincent', 1),
(89, 'Philip', 1),
(90, 'Logan', 1),
(91, 'Bobby', 1),
(92, 'Johnny', 1),
(93, 'Phillip', 1),
(94, 'Shawn', 1),
(95, 'Bradley', 1),
(96, 'Juan', 2),
(97, 'Antonio', 2),
(98, 'José', 2),
(99, 'Manuel', 2),
(100, 'Francisco', 2),
(101, 'David', 2),
(102, 'José Luis', 2),
(103, 'Javier', 2),
(104, 'Francisco Javier', 2),
(105, 'Daniel', 2),
(106, 'José Manuel', 2),
(107, 'Jesús', 2),
(108, 'Carlos', 2),
(109, 'Alejandro', 2),
(110, 'Miguel', 2),
(111, 'Ángel', 2),
(112, 'Rafael', 2),
(113, 'Pedro', 2),
(114, 'Pablo', 2),
(115, 'José María', 2),
(116, 'Santiago', 2),
(117, 'Jorge', 2),
(118, 'Enrique', 2),
(119, 'Víctor', 2),
(120, 'Luis', 2),
(121, 'Fernando', 2),
(122, 'Diego', 2),
(123, 'Adrián', 2),
(124, 'Rubén', 2),
(125, 'Sergio', 2),
(126, 'Alberto', 2),
(127, 'Alonso', 2),
(128, 'Andrés', 2),
(129, 'Emilio', 2),
(130, 'Iván', 2),
(131, 'Óscar', 2),
(132, 'Guillermo', 2),
(133, 'Juan Carlos', 2),
(134, 'Mario', 2),
(135, 'Manuel Jesús', 2),
(136, 'Marcos', 2),
(137, 'Tomás', 2),
(138, 'Ricardo', 2),
(139, 'Eduardo', 2),
(140, 'Gabriel', 2),
(141, 'Israel', 2),
(142, 'Hugo', 2),
(143, 'Félix', 2),
(144, 'Gonzalo', 2),
(145, 'Raúl', 2),
(146, 'Joaquín', 2),
(147, 'Julio', 2),
(148, 'Ismael', 2),
(149, 'Bruno', 2),
(150, 'Jaime', 2),
(151, 'Roberto', 2),
(152, 'Arturo', 2),
(153, 'Diego', 2),
(154, 'Aitor', 2),
(155, 'Esteban', 2),
(156, 'Mariano', 2),
(157, 'Xavier', 2),
(158, 'Mateo', 2),
(159, 'Cristian', 2),
(160, 'Gerardo', 2),
(161, 'Lorenzo', 2),
(162, 'Nicolás', 2),
(163, 'Alex', 2),
(164, 'Josué', 2),
(165, 'Erick', 2),
(166, 'Fernando', 2),
(167, 'Vicente', 2),
(168, 'Alvaro', 2),
(169, 'Álvaro', 2),
(170, 'Diego', 2),
(171, 'Ezequiel', 2),
(172, 'Juan Pablo', 2),
(173, 'Gustavo', 2),
(174, 'Jesús María', 2),
(175, 'Marcial', 2),
(176, 'Noé', 2),
(177, 'Óscar', 2),
(178, 'Román', 2),
(179, 'Tadeo', 2),
(180, 'Valentín', 2),
(181, 'Wilfredo', 2),
(182, 'Xavier', 2),
(183, 'Yago', 2),
(184, 'Yeray', 2),
(185, 'Zacarías', 2),
(186, 'Zenón', 2),
(187, 'João', 3),
(188, 'José', 3),
(189, 'António', 3),
(190, 'Manuel', 3),
(191, 'Luís', 3),
(192, 'Carlos', 3),
(193, 'Joaquim', 3),
(194, 'Jorge', 3),
(195, 'Miguel', 3),
(196, 'Rui', 3),
(197, 'Paulo', 3),
(198, 'Fernando', 3),
(199, 'Pedro', 3),
(200, 'Nuno', 3),
(201, 'Artur', 3),
(202, 'Ricardo', 3),
(203, 'Daniel', 3),
(204, 'Bruno', 3),
(205, 'Sérgio', 3),
(206, 'Alberto', 3),
(207, 'André', 3),
(208, 'David', 3),
(209, 'Vítor', 3),
(210, 'Hugo', 3),
(211, 'Gustavo', 3),
(212, 'Rúben', 3),
(213, 'Marco', 3),
(214, 'Eduardo', 3),
(215, 'Gonçalo', 3),
(216, 'Tomás', 3),
(217, 'Tiago', 3),
(218, 'Simão', 3),
(219, 'Luis', 3),
(220, 'Júlio', 3),
(221, 'Alexandre', 3),
(222, 'Álvaro', 3),
(223, 'Javier', 3),
(224, 'Lucas', 3),
(225, 'Ivan', 3),
(226, 'Ramon', 3),
(227, 'Javier', 3),
(228, 'Mateus', 3),
(229, 'Felipe', 3),
(230, 'Guilherme', 3),
(231, 'Diego', 3),
(232, 'Vasco', 3),
(233, 'Nicolau', 3),
(234, 'Adriano', 3),
(235, 'Jaime', 3),
(236, 'Jan', 4),
(237, 'Peter', 4),
(238, 'Pieter', 4),
(239, 'Johannes', 4),
(240, 'Johan', 4),
(241, 'Cornelis', 4),
(242, 'Willem', 4),
(243, 'Hendrik', 4),
(244, 'Gerard', 4),
(245, 'Jacob', 4),
(246, 'Gerrit', 4),
(247, 'Dirk', 4),
(248, 'Arie', 4),
(249, 'Michiel', 4),
(250, 'Adrianus', 4),
(251, 'Bastiaan', 4),
(252, 'Martinus', 4),
(253, 'Antonius', 4),
(254, 'Hendrikus', 4),
(255, 'Jozef', 4),
(256, 'Karel', 4),
(257, 'Lucas', 4),
(258, 'Simon', 4),
(259, 'Theodorus', 4),
(260, 'Evert', 4),
(261, 'Albert', 4),
(262, 'Marius', 4),
(263, 'Petrus', 4),
(264, 'Wilhelmus', 4),
(265, 'Paul', 4),
(266, 'Rudolf', 4),
(267, 'Thijs', 4),
(268, 'Maarten', 4),
(269, 'Sander', 4),
(270, 'Victor', 4),
(271, 'Dirk-Jan', 4),
(272, 'Matthijs', 4),
(273, 'Coen', 4),
(274, 'Teun', 4),
(275, 'Henk', 4),
(276, 'Sjoerd', 4),
(277, 'Bram', 4),
(278, 'Wouter', 4),
(279, 'Jelle', 4),
(280, 'Tim', 4),
(281, 'Stefan', 4),
(282, 'Bart', 4),
(283, 'Robert', 4),
(284, 'Maurits', 4),
(285, 'Jean', 5),
(286, 'Pierre', 5),
(287, 'Jacques', 5),
(288, 'Michel', 5),
(289, 'Paul', 5),
(290, 'André', 5),
(291, 'Louis', 5),
(292, 'Henri', 5),
(293, 'François', 5),
(294, 'Philippe', 5),
(295, 'Alain', 5),
(296, 'Marc', 5),
(297, 'Bernard', 5),
(298, 'Patrick', 5),
(299, 'Thierry', 5),
(300, 'Sylvain', 5),
(301, 'Didier', 5),
(302, 'Gérard', 5),
(303, 'Vincent', 5),
(304, 'Luc', 5),
(305, 'David', 5),
(306, 'Olivier', 5),
(307, 'Mathieu', 5),
(308, 'Éric', 5),
(309, 'Sébastien', 5),
(310, 'Christophe', 5),
(311, 'Alexandre', 5),
(312, 'Julien', 5),
(313, 'Antoine', 5),
(314, 'Nicolas', 5),
(315, 'Guillaume', 5),
(316, 'Yves', 5),
(317, 'Denis', 5),
(318, 'Maxime', 5),
(319, 'Laurent', 5),
(320, 'Bruno', 5),
(321, 'Fabrice', 5),
(322, 'Jérôme', 5),
(323, 'Cédric', 5),
(324, 'Georges', 5),
(325, 'Emmanuel', 5),
(326, 'Xavier', 5),
(327, 'Damien', 5),
(328, 'Grégoire', 5),
(329, 'Hervé', 5),
(330, 'Stéphane', 5),
(331, 'René', 5),
(332, 'Thibault', 5),
(333, 'Mohamed', 6),
(334, 'Ahmed', 6),
(335, 'Youssef', 6),
(336, 'Omar', 6),
(337, 'Ali', 6),
(338, 'Hassan', 6),
(339, 'Abdallah', 6),
(340, 'Hamza', 6),
(341, 'Anas', 6),
(342, 'Karim', 6),
(343, 'Mustapha', 6),
(344, 'Said', 6),
(345, 'Brahim', 6),
(346, 'Mehdi', 6),
(347, 'Fares', 6),
(348, 'Nabil', 6),
(349, 'Rachid', 6),
(350, 'Zakaria', 6),
(351, 'Adil', 6),
(352, 'Khalid', 6),
(353, 'Bilal', 6),
(354, 'Sami', 6),
(355, 'Hicham', 6),
(356, 'Walid', 6),
(357, 'Moussa', 6),
(358, 'Tarik', 6),
(359, 'Ismail', 6),
(360, 'Reda', 6),
(361, 'Nadir', 6),
(362, 'Larbi', 6),
(363, 'Sekou', 7),
(364, 'Alpha', 7),
(365, 'Ibrahima', 7),
(366, 'Mamadou', 7),
(367, 'Lansana', 7),
(368, 'Fode', 7),
(369, 'Mohamed', 7),
(370, 'Ousmane', 7),
(371, 'Sory', 7),
(372, 'Karamo', 7),
(373, 'Boubacar', 7),
(374, 'Djibril', 7),
(375, 'Fanta', 7),
(376, 'Balla', 7),
(377, 'Amara', 7),
(378, 'Yacouba', 7),
(379, 'Thierno', 7),
(380, 'Samba', 7),
(381, 'Sékou', 7),
(382, 'Abdoulaye', 7),
(383, 'Mory', 7),
(384, 'Mamadouba', 7),
(385, 'Ibrahima', 7),
(386, 'Fodé', 7),
(387, 'Lamine', 7),
(388, 'Mamady', 7),
(389, 'Moriba', 7),
(390, 'Tidiane', 7),
(391, 'Souleymane', 7),
(392, 'Saidou', 7),
(393, 'Kwame', 8),
(394, 'Kofi', 8),
(395, 'Kwesi', 8),
(396, 'Kwaku', 8),
(397, 'Kwabena', 8),
(398, 'Kwadwo', 8),
(399, 'Kwasi', 8),
(400, 'Kwame', 8),
(401, 'Nana', 8),
(402, 'Kofi', 8),
(403, 'Yaw', 8),
(404, 'Kwasi', 8),
(405, 'Kwaku', 8),
(406, 'Kwadwo', 8),
(407, 'Kojo', 8),
(408, 'Kwabena', 8),
(409, 'Akwasi', 8),
(410, 'Kweku', 8),
(411, 'Yaw', 8),
(412, 'Kwaku', 8),
(413, 'Kwame', 8),
(414, 'Kwesi', 8),
(415, 'Nii', 8),
(416, 'Yaw', 8),
(417, 'Kwabena', 8),
(418, 'Kofi', 8),
(419, 'Ato', 8),
(420, 'Kwesi', 8),
(421, 'Kwaku', 8),
(422, 'Kwadwo', 8),
(423, 'Running Bear', 9),
(424, 'Sitting Bull', 9),
(425, 'Crazy Horse', 9),
(426, 'Geronimo', 9),
(427, 'Red Cloud', 9),
(428, 'Black Hawk', 9),
(429, 'Tecumseh', 9),
(430, 'Cochise', 9),
(431, 'Squanto', 9),
(432, 'Hiawatha', 9),
(433, 'Pontiac', 9),
(434, 'Seattle', 9),
(435, 'Pocahontas', 9),
(436, 'Cherokee', 9),
(437, 'Navajo', 9),
(438, 'Dakota', 9),
(439, 'Cheyenne', 9),
(440, 'Shawnee', 9),
(441, 'Apache', 9),
(442, 'Kickapoo', 9),
(443, 'Comanche', 9),
(444, 'Crow', 9),
(445, 'Nez Perce', 9),
(446, 'Osage', 9),
(447, 'Seminole', 9),
(448, 'Chickasaw', 9),
(449, 'Choctaw', 9),
(450, 'Sioux', 9),
(451, 'Pueblo', 9),
(452, 'Cherokee', 9);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `npc`
--

CREATE TABLE `npc` (
  `npc_id` int(11) NOT NULL,
  `name_id` int(11) DEFAULT NULL,
  `surname_id` int(11) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `npc_feat`
--

CREATE TABLE `npc_feat` (
  `npc_id` int(11) NOT NULL,
  `feat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `npc_skill`
--

CREATE TABLE `npc_skill` (
  `npc_id` int(11) NOT NULL,
  `skill_id` int(11) NOT NULL,
  `proficiency_level` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `npc_stat`
--

CREATE TABLE `npc_stat` (
  `npc_id` int(11) NOT NULL,
  `stat_id` int(11) NOT NULL,
  `proficiency_level` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `npc_trait`
--

CREATE TABLE `npc_trait` (
  `npc_id` int(11) NOT NULL,
  `trait_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `skill`
--

CREATE TABLE `skill` (
  `skill_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `stat_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `skill`
--

INSERT INTO `skill` (`skill_id`, `name`, `stat_id`) VALUES
(1, 'Atletyka', 1),
(2, 'Odporność', 1),
(3, 'Bijatyka', 1),
(4, 'Broń Dwuręczna', 1),
(5, 'Łucznictwo', 1),
(6, 'Machlojki', 2),
(7, 'Koordynacja', 2),
(8, 'Broń Lekka', 2),
(9, 'Rewolwery', 2),
(10, 'Rzucanie', 2),
(11, 'Karabiny', 2),
(12, 'Astronawigacja', 3),
(13, 'Geografia', 3),
(14, 'Wycena', 3),
(15, 'Natura', 3),
(16, 'Alchemia', 3),
(17, 'Medycyna', 3),
(18, 'Artyleria', 3),
(19, 'Pierwsza Pomoc', 4),
(20, 'Piśmienność', 4),
(21, 'Ukrywanie', 4),
(22, 'Orientacja', 4),
(23, 'Przeszukiwanie', 4),
(24, 'Oszustwo', 4),
(25, 'Czujność', 5),
(26, 'Opanowanie', 5),
(27, 'Przymuszenie', 5),
(28, 'Mity', 6),
(29, 'Urok', 6),
(30, 'Dowodzenie', 6),
(31, 'Negocjacje', 6);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `skill_description`
--

CREATE TABLE `skill_description` (
  `skill_id` int(11) NOT NULL,
  `proficiency_level` int(11) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `stat`
--

CREATE TABLE `stat` (
  `stat_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stat`
--

INSERT INTO `stat` (`stat_id`, `name`) VALUES
(1, 'Brawn'),
(2, 'Agility'),
(3, 'Intellect'),
(4, 'Cunning'),
(5, 'Willpower'),
(6, 'Presence');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `stat_description`
--

CREATE TABLE `stat_description` (
  `stat_id` int(11) NOT NULL,
  `proficiency_level` int(11) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `stat_description`
--

INSERT INTO `stat_description` (`stat_id`, `proficiency_level`, `description`) VALUES
(1, 1, 'Może utrzymasz piwo w łapie.'),
(1, 2, 'Podniesiesz garnek pełen złota.'),
(1, 3, 'Podniesiesz beczkę rumu.'),
(1, 4, 'Zrzucisz działo z pokładu statku.'),
(1, 5, 'Możesz podnieść dwa okręty naraz.'),
(2, 1, 'Potykasz się na własnych nogach.'),
(2, 2, 'Potrafisz uchylić się przed toporem.'),
(2, 3, 'Skaczesz z jednego masztu na drugi.'),
(2, 4, 'Mógłbyś tańczyć na linie rozpiętej między statkami.'),
(2, 5, 'Umiesz manewrować po rufie statku podczas sztormu.'),
(3, 1, 'Masz trudnośći z trafieniem na własny statek.'),
(3, 2, 'Po kilku kuflach rumu to masz nawet ciekaw pomysły.'),
(3, 3, 'Rozwiązałbyś szyfr piracki.'),
(3, 4, 'W wolnych chwilach opracowujesz plany abordażu.'),
(3, 5, 'Bez trudu przekonasz flotę za pomocą jednego manewru.'),
(4, 1, 'Wpadłbyś we własną pułapkę, gdybyś tylko potrafił ją zrobić'),
(4, 2, 'Często wpadasz w zasadzkę.'),
(4, 3, 'Z łatwością wychwycisz każdą piracką pułapką.'),
(4, 4, 'Zawsze znajdziesz lukę w planach przeciwnika.'),
(4, 5, 'To pewnie tylko wiatr.'),
(5, 1, 'Zawahałby się przed wejściem do bunkra.'),
(5, 2, 'Przetrwasz przesłuchanie przez marynarzy.'),
(5, 3, 'Nie wysprzęglisz się na załogę.'),
(5, 4, 'Nic nie robi na tobie wrażenia.'),
(5, 5, 'Totalna chillera i bomba.'),
(6, 1, 'Mógłbyś zostać oszukany przez papugę'),
(6, 2, 'Znasz jeden kawał.'),
(6, 3, 'Wygadasz się z niebezpiecznej sytuacji.'),
(6, 4, 'Twoje historie są niewiarygodne, ale ludzię chcą w nie wierzyć.'),
(6, 5, 'Wiatr zmieni swój kurs na twoją prośbę.');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `surname`
--

CREATE TABLE `surname` (
  `surname_id` int(11) NOT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `country_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `surname`
--

INSERT INTO `surname` (`surname_id`, `surname`, `country_id`) VALUES
(1, 'Smith', 1),
(2, 'Johnson', 1),
(3, 'Williams', 1),
(4, 'Jones', 1),
(5, 'Brown', 1),
(6, 'Davis', 1),
(7, 'Miller', 1),
(8, 'Wilson', 1),
(9, 'Moore', 1),
(10, 'Taylor', 1),
(11, 'Anderson', 1),
(12, 'Thomas', 1),
(13, 'Jackson', 1),
(14, 'White', 1),
(15, 'Harris', 1),
(16, 'Martin', 1),
(17, 'Thompson', 1),
(18, 'Garcia', 1),
(19, 'Martinez', 1),
(20, 'Robinson', 1),
(21, 'Clark', 1),
(22, 'Rodriguez', 1),
(23, 'Lewis', 1),
(24, 'Lee', 1),
(25, 'Walker', 1),
(26, 'Hall', 1),
(27, 'Allen', 1),
(28, 'Young', 1),
(29, 'King', 1),
(30, 'Wright', 1),
(31, 'Scott', 1),
(32, 'Green', 1),
(33, 'Adams', 1),
(34, 'Baker', 1),
(35, 'Nelson', 1),
(36, 'Hill', 1),
(37, 'Ramirez', 1),
(38, 'Campbell', 1),
(39, 'Mitchell', 1),
(40, 'Roberts', 1),
(41, 'Carter', 1),
(42, 'Phillips', 1),
(43, 'Evans', 1),
(44, 'Turner', 1),
(45, 'Torres', 1),
(46, 'Parker', 1),
(47, 'Collins', 1),
(48, 'Edwards', 1),
(49, 'Stewart', 1),
(50, 'Flores', 1),
(51, 'Morris', 1),
(52, 'Nguyen', 1),
(53, 'Murphy', 1),
(54, 'Rivera', 1),
(55, 'Cook', 1),
(56, 'Rogers', 1),
(57, 'Morgan', 1),
(58, 'Peterson', 1),
(59, 'Cooper', 1),
(60, 'Reed', 1),
(61, 'Bailey', 1),
(62, 'Bell', 1),
(63, 'Gomez', 1),
(64, 'Kelly', 1),
(65, 'Howard', 1),
(66, 'Ward', 1),
(67, 'Cox', 1),
(68, 'Diaz', 1),
(69, 'Richardson', 1),
(70, 'Wood', 1),
(71, 'Watson', 1),
(72, 'Brooks', 1),
(73, 'Bennett', 1),
(74, 'Gray', 1),
(75, 'James', 1),
(76, 'Reyes', 1),
(77, 'Cruz', 1),
(78, 'Hughes', 1),
(79, 'Price', 1),
(80, 'Myers', 1),
(81, 'Long', 1),
(82, 'Foster', 1),
(83, 'Sanders', 1),
(84, 'Ross', 1),
(85, 'Morales', 1),
(86, 'Powell', 1),
(87, 'Sullivan', 1),
(88, 'Russell', 1),
(89, 'Ortiz', 1),
(90, 'Jenkins', 1),
(91, 'Gutierrez', 1),
(92, 'García', 2),
(93, 'Fernández', 2),
(94, 'González', 2),
(95, 'Rodríguez', 2),
(96, 'López', 2),
(97, 'Martínez', 2),
(98, 'Sánchez', 2),
(99, 'Pérez', 2),
(100, 'Martín', 2),
(101, 'Gómez', 2),
(102, 'Ruiz', 2),
(103, 'Díaz', 2),
(104, 'Hernández', 2),
(105, 'Jiménez', 2),
(106, 'Álvarez', 2),
(107, 'Moreno', 2),
(108, 'Molina', 2),
(109, 'Romero', 2),
(110, 'Navarro', 2),
(111, 'Ortega', 2),
(112, 'Torres', 2),
(113, 'Domínguez', 2),
(114, 'Gil', 2),
(115, 'Vázquez', 2),
(116, 'Serrano', 2),
(117, 'Ramírez', 2),
(118, 'Blanco', 2),
(119, 'Suárez', 2),
(120, 'Morales', 2),
(121, 'Ortiz', 2),
(122, 'Delgado', 2),
(123, 'Castro', 2),
(124, 'Ortega', 2),
(125, 'Rubio', 2),
(126, 'Marín', 2),
(127, 'Santiago', 2),
(128, 'Carmona', 2),
(129, 'Pascual', 2),
(130, 'Esteban', 2),
(131, 'Méndez', 2),
(132, 'Bravo', 2),
(133, 'Aguilar', 2),
(134, 'Flores', 2),
(135, 'Medina', 2),
(136, 'Vidal', 2),
(137, 'Ibáñez', 2),
(138, 'Gallego', 2),
(139, 'Pardo', 2),
(140, 'Rivas', 2),
(141, 'Calvo', 2),
(142, 'Lorenzo', 2),
(143, 'Redondo', 2),
(144, 'Vega', 2),
(145, 'Soto', 2),
(146, 'Iglesias', 2),
(147, 'Guerrero', 2),
(148, 'Cortés', 2),
(149, 'Acosta', 2),
(150, 'Arias', 2),
(151, 'Nieto', 2),
(152, 'Reyes', 2),
(153, 'Parra', 2),
(154, 'Mora', 2),
(155, 'Solís', 2),
(156, 'Herrero', 2),
(157, 'Pacheco', 2),
(158, 'Giménez', 2),
(159, 'Crespo', 2),
(160, 'Herrera', 2),
(161, 'Aguilera', 2),
(162, 'Martínez', 2),
(163, 'Hidalgo', 2),
(164, 'Santos', 2),
(165, 'Moya', 2),
(166, 'Velasco', 2),
(167, 'Guillén', 2),
(168, 'Sáez', 2),
(169, 'Arroyo', 2),
(170, 'Garrido', 2),
(171, 'Luna', 2),
(172, 'Barrios', 2),
(173, 'Márquez', 2),
(174, 'Campos', 2),
(175, 'Costa', 2),
(176, 'Caballero', 2),
(177, 'Mendez', 2),
(178, 'Suarez', 2),
(179, 'Bermúdez', 2),
(180, 'Cruz', 2),
(181, 'Benítez', 2),
(182, 'Gutiérrez', 2),
(183, 'Lucas', 2),
(184, 'Silva', 3),
(185, 'Santos', 3),
(186, 'Ferreira', 3),
(187, 'Pereira', 3),
(188, 'Oliveira', 3),
(189, 'Costa', 3),
(190, 'Rodrigues', 3),
(191, 'Martins', 3),
(192, 'Jesus', 3),
(193, 'Sousa', 3),
(194, 'Fernandes', 3),
(195, 'Gomes', 3),
(196, 'Lopes', 3),
(197, 'Marques', 3),
(198, 'Almeida', 3),
(199, 'Carvalho', 3),
(200, 'Ribeiro', 3),
(201, 'Teixeira', 3),
(202, 'Mendes', 3),
(203, 'Moreira', 3),
(204, 'Cardoso', 3),
(205, 'Rocha', 3),
(206, 'Reis', 3),
(207, 'Neves', 3),
(208, 'Mota', 3),
(209, 'Barbosa', 3),
(210, 'Ramos', 3),
(211, 'Correia', 3),
(212, 'Henriques', 3),
(213, 'Fonseca', 3),
(214, 'Moura', 3),
(215, 'Matos', 3),
(216, 'Araújo', 3),
(217, 'Esteves', 3),
(218, 'Morais', 3),
(219, 'Pinto', 3),
(220, 'Batista', 3),
(221, 'Cunha', 3),
(222, 'Castro', 3),
(223, 'Gonçalves', 3),
(224, 'Vieira', 3),
(225, 'Duarte', 3),
(226, 'Campos', 3),
(227, 'Figueiredo', 3),
(228, 'Machado', 3),
(229, 'Dias', 3),
(230, 'Monteiro', 3),
(231, 'Pires', 3),
(232, 'Simões', 3),
(233, 'De Jong', 4),
(234, 'Jansen', 4),
(235, 'De Vries', 4),
(236, 'Van den Berg', 4),
(237, 'Bakker', 4),
(238, 'Van Dijk', 4),
(239, 'Visser', 4),
(240, 'Smit', 4),
(241, 'Meijer', 4),
(242, 'De Boer', 4),
(243, 'Mulder', 4),
(244, 'Bos', 4),
(245, 'Vos', 4),
(246, 'Peters', 4),
(247, 'Hendriks', 4),
(248, 'Van der Meer', 4),
(249, 'Van der Linden', 4),
(250, 'Kok', 4),
(251, 'Jacobs', 4),
(252, 'Vermeer', 4),
(253, 'Van der Heijden', 4),
(254, 'Van Beek', 4),
(255, 'Van der Veen', 4),
(256, 'Hoekstra', 4),
(257, 'Kramer', 4),
(258, 'Postma', 4),
(259, 'Willems', 4),
(260, 'Maas', 4),
(261, 'Scholten', 4),
(262, 'Bosch', 4),
(263, 'Schmidt', 4),
(264, 'Van der Wal', 4),
(265, 'Kuijpers', 4),
(266, 'Van Leeuwen', 4),
(267, 'Vermeulen', 4),
(268, 'Van den Broek', 4),
(269, 'Van Doorn', 4),
(270, 'Verhoeven', 4),
(271, 'Van Wijk', 4),
(272, 'Dekker', 4),
(273, 'Janssen', 4),
(274, 'Van der Laan', 4),
(275, 'Schouten', 4),
(276, 'Gerritsen', 4),
(277, 'Van Loon', 4),
(278, 'Van der Velde', 4),
(279, 'Van Dam', 4),
(280, 'Nieuwenhuis', 4),
(281, 'Van der Spek', 4),
(282, 'Martin', 5),
(283, 'Bernard', 5),
(284, 'Dubois', 5),
(285, 'Thomas', 5),
(286, 'Robert', 5),
(287, 'Richard', 5),
(288, 'Petit', 5),
(289, 'Durand', 5),
(290, 'Lefèvre', 5),
(291, 'Moreau', 5),
(292, 'Simon', 5),
(293, 'Laurent', 5),
(294, 'Lefevre', 5),
(295, 'Michel', 5),
(296, 'Garcia', 5),
(297, 'David', 5),
(298, 'Bertrand', 5),
(299, 'Roux', 5),
(300, 'Vincent', 5),
(301, 'Fournier', 5),
(302, 'Morel', 5),
(303, 'Girard', 5),
(304, 'Lambert', 5),
(305, 'Bonnet', 5),
(306, 'François', 5),
(307, 'Martinez', 5),
(308, 'Legrand', 5),
(309, 'Guerin', 5),
(310, 'Dupont', 5),
(311, 'Deschamps', 5),
(312, 'Moulin', 5),
(313, 'Rivière', 5),
(314, 'Lemoine', 5),
(315, 'Faure', 5),
(316, 'Mercier', 5),
(317, 'Leroy', 5),
(318, 'Huet', 5),
(319, 'Barbier', 5),
(320, 'Marchand', 5),
(321, 'Lecomte', 5),
(322, 'Colin', 5),
(323, 'Perrin', 5),
(324, 'Rodriguez', 5),
(325, 'Rodrigues', 5),
(326, 'Caron', 5),
(327, 'Picard', 5),
(328, 'Garnier', 5),
(329, 'Pierre', 5),
(330, 'Lefevre', 5),
(331, 'Ben Mohamed', 6),
(332, 'Ben Ahmed', 6),
(333, 'Ben Youssef', 6),
(334, 'Ben Omar', 6),
(335, 'El Hassan', 6),
(336, 'El Abdi', 6),
(337, 'El Hajji', 6),
(338, 'El Khalifa', 6),
(339, 'El Hadi', 6),
(340, 'El Amrani', 6),
(341, 'El Mansouri', 6),
(342, 'El Fassi', 6),
(343, 'El Alaoui', 6),
(344, 'El Makhloufi', 6),
(345, 'El Moussaoui', 6),
(346, 'El Ouazzani', 6),
(347, 'El Mahjoub', 6),
(348, 'El Bachiri', 6),
(349, 'El Akkari', 6),
(350, 'El Azzouzi', 6),
(351, 'El Madani', 6),
(352, 'El Hamdaoui', 6),
(353, 'El Kaddouri', 6),
(354, 'El Baraka', 6),
(355, 'El Hadj', 6),
(356, 'El Hajjaji', 6),
(357, 'El Maghraoui', 6),
(358, 'El Mansour', 6),
(359, 'El Messaoudi', 6),
(360, 'El Moutawakil', 6),
(361, 'Camara', 7),
(362, 'Bangoura', 7),
(363, 'Keita', 7),
(364, 'Condé', 7),
(365, 'Sylla', 7),
(366, 'Diallo', 7),
(367, 'Barry', 7),
(368, 'Traoré', 7),
(369, 'Kourouma', 7),
(370, 'Bah', 7),
(371, 'Kamano', 7),
(372, 'Touré', 7),
(373, 'Dembélé', 7),
(374, 'Diané', 7),
(375, 'Kaba', 7),
(376, 'Sow', 7),
(377, 'Soumah', 7),
(378, 'Kante', 7),
(379, 'Cisse', 7),
(380, 'Dabo', 7),
(381, 'Camara', 7),
(382, 'Balde', 7),
(383, 'Diallo', 7),
(384, 'Diarra', 7),
(385, 'Camara', 7),
(386, 'Conde', 7),
(387, 'Mansare', 7),
(388, 'Sylla', 7),
(389, 'Kaba', 7),
(390, 'Bangoura', 7),
(391, 'Addo', 8),
(392, 'Appiah', 8),
(393, 'Darko', 8),
(394, 'Boateng', 8),
(395, 'Mensah', 8),
(396, 'Owusu', 8),
(397, 'Acheampong', 8),
(398, 'Osei', 8),
(399, 'Gyan', 8),
(400, 'Amoako', 8),
(401, 'Asante', 8),
(402, 'Agyeman', 8),
(403, 'Ankrah', 8),
(404, 'Yeboah', 8),
(405, 'Ofori', 8),
(406, 'Quaye', 8),
(407, 'Adjei', 8),
(408, 'Danso', 8),
(409, 'Adu', 8),
(410, 'Ampadu', 8),
(411, 'Adjaye', 8),
(412, 'Aidoo', 8),
(413, 'Aikins', 8),
(414, 'Agyei', 8),
(415, 'Akoto', 8),
(416, 'Ankoma', 8),
(417, 'Antwi', 8),
(418, 'Asamoah', 8),
(419, 'Asumadu', 8),
(420, 'Atsu', 8),
(421, 'Yellow Feather', 9),
(422, 'Running Water', 9),
(423, 'Black Eagle', 9),
(424, 'Sitting Bear', 9),
(425, 'Red Wolf', 9),
(426, 'White Cloud', 9),
(427, 'Blue Thunder', 9),
(428, 'Morning Star', 9),
(429, 'Swift Deer', 9),
(430, 'Quiet Bear', 9),
(431, 'Strong Wind', 9),
(432, 'Falling Rain', 9),
(433, 'Little Crow', 9),
(434, 'Broken Nose', 9),
(435, 'Brave Heart', 9),
(436, 'Fierce Hawk', 9),
(437, 'White Buffalo', 9),
(438, 'Standing Elk', 9),
(439, 'Laughing Fox', 9),
(440, 'Swift Horse', 9),
(441, 'Rushing River', 9),
(442, 'Thunderbird', 9),
(443, 'Soaring Eagle', 9),
(444, 'Morning Star', 9),
(445, 'Silver Moon', 9),
(446, 'Night Thunder', 9),
(447, 'Dancing Cloud', 9),
(448, 'Blue Sky', 9),
(449, 'Winter Wolf', 9),
(450, 'Lone Tree', 9);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `trait`
--

CREATE TABLE `trait` (
  `trait_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `contrast_trait_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `trait`
--

INSERT INTO `trait` (`trait_id`, `name`, `description`, `contrast_trait_id`) VALUES
(1, 'Odważny', 'Charakteryzuje się gotowością do podejmowania ryzyka i stawiania czoła niebezpieczeństwom.', 2),
(2, 'Tchórzliwy', 'Unika ryzyka i boi się niebezpieczeństw, często z powodu braku odwagi.', 1),
(3, 'Spokojny', 'Zachowuje opanowanie i spokój nawet w stresujących sytuacjach.', 4),
(4, 'Gniewny', 'Szybko wpada w gniew i ma skłonność do wybuchów złości.', 3),
(5, 'Czysty', 'Żyje wstrzemięźliwie, unikając cielesnych pokus i grzesznych myśli.', 6),
(6, 'Pożądliwy', 'Ma silne pragnienia seksualne i łatwo ulega pokusom cielesnym.', 5),
(7, 'Zadowolony', 'Jest szczęśliwy z tym, co ma i nie odczuwa potrzeby posiadania więcej.', 8),
(8, 'Ambitny', 'Stawia sobie wysokie cele i dąży do ich osiągnięcia za wszelką cenę.', 7),
(9, 'Sumienny', 'Pracuje ciężko i starannie, przykładając dużą wagę do detali.', 10),
(10, 'Leniwy', 'Unika pracy i wysiłku, preferując odpoczynek i łatwe życie.', 9),
(11, 'Wybaczający', 'Łatwo przebacza innym ich przewinienia i nie chowa urazy.', 12),
(12, 'Mściwy', 'Pamięta krzywdy i dąży do zemsty za doznane krzywdy.', 11),
(13, 'Hojny', 'Chętnie dzieli się swoim bogactwem i zasobami z innymi.', 14),
(14, 'Chciwy', 'Ma nienasycone pragnienie posiadania więcej bogactwa i zasobów.', 13),
(15, 'Towarzyski', 'Lubi przebywać w towarzystwie innych ludzi i czerpie radość z interakcji społecznych.', 16),
(16, 'Nieśmiały', 'Unika interakcji społecznych z powodu niepewności i braku pewności siebie.', 15),
(17, 'Szczery', 'Zawsze mówi prawdę i unika oszustw oraz kłamstw.', 18),
(18, 'Podstępny', 'Często używa kłamstw i oszustw, aby osiągnąć swoje cele.', 17),
(19, 'Pokorny', 'Nie chełpi się swoimi osiągnięciami i traktuje innych z szacunkiem.', 20),
(20, 'Arogancki', 'Ma wysokie mniemanie o sobie i często lekceważy innych.', 19),
(21, 'Sprawiedliwy', 'Działa zgodnie z zasadami sprawiedliwości i równości.', 22),
(22, 'Samowolny', 'Działa według własnych kaprysów, nie zważając na zasady sprawiedliwości.', 21),
(23, 'Cierpliwy', 'Potrafi wytrwale czekać na rezultaty bez frustracji.', 24),
(24, 'Niecierpliwy', 'Trudno mu czekać na rezultaty i łatwo się denerwuje.', 23),
(25, 'Wstrzemięźliwy', 'Zachowuje umiar we wszystkich aspektach życia, unikając przesady.', 26),
(26, 'Obżartuch', 'Ma niekontrolowane pragnienie jedzenia i picia w nadmiarze.', 25),
(27, 'Ufny', 'Łatwo ufa innym i wierzy w ich dobre intencje.', 28),
(28, 'Paranoiczny', 'Często podejrzewa innych o złe intencje i nieufność.', 27),
(29, 'Gorliwy', 'Posiada silne, często fanatyczne przekonania i z pasją je broni.', 30),
(30, 'Cyniczny', 'Jest sceptyczny wobec intencji innych i często zakłada najgorsze.', 29),
(31, 'Współczujący', 'Ma silne poczucie empatii i chętnie pomaga innym w potrzebie.', 32),
(32, 'Bezwzględny', 'Brak mu empatii i współczucia dla innych.', 31),
(33, 'Kapryśny', 'Często zmienia swoje opinie i decyzje, jest niestały w swoich postanowieniach.', 34),
(34, 'Uparty', 'Trzyma się swojego zdania i decyzji, nawet w obliczu przeciwnych argumentów.', 33);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `country`
--
ALTER TABLE `country`
  ADD PRIMARY KEY (`country_id`);

--
-- Indeksy dla tabeli `feat`
--
ALTER TABLE `feat`
  ADD PRIMARY KEY (`feat_id`);

--
-- Indeksy dla tabeli `name`
--
ALTER TABLE `name`
  ADD PRIMARY KEY (`name_id`),
  ADD KEY `country_id` (`country_id`);

--
-- Indeksy dla tabeli `npc`
--
ALTER TABLE `npc`
  ADD PRIMARY KEY (`npc_id`),
  ADD KEY `name_id` (`name_id`),
  ADD KEY `surname_id` (`surname_id`),
  ADD KEY `country_id` (`country_id`);

--
-- Indeksy dla tabeli `npc_feat`
--
ALTER TABLE `npc_feat`
  ADD PRIMARY KEY (`npc_id`,`feat_id`),
  ADD KEY `feat_id` (`feat_id`);

--
-- Indeksy dla tabeli `npc_skill`
--
ALTER TABLE `npc_skill`
  ADD PRIMARY KEY (`npc_id`,`skill_id`),
  ADD KEY `skill_id` (`skill_id`);

--
-- Indeksy dla tabeli `npc_stat`
--
ALTER TABLE `npc_stat`
  ADD PRIMARY KEY (`npc_id`,`stat_id`),
  ADD KEY `stat_id` (`stat_id`);

--
-- Indeksy dla tabeli `npc_trait`
--
ALTER TABLE `npc_trait`
  ADD PRIMARY KEY (`npc_id`,`trait_id`),
  ADD KEY `trait_id` (`trait_id`);

--
-- Indeksy dla tabeli `skill`
--
ALTER TABLE `skill`
  ADD PRIMARY KEY (`skill_id`);

--
-- Indeksy dla tabeli `skill_description`
--
ALTER TABLE `skill_description`
  ADD PRIMARY KEY (`skill_id`,`proficiency_level`);

--
-- Indeksy dla tabeli `stat`
--
ALTER TABLE `stat`
  ADD PRIMARY KEY (`stat_id`);

--
-- Indeksy dla tabeli `stat_description`
--
ALTER TABLE `stat_description`
  ADD PRIMARY KEY (`stat_id`,`proficiency_level`);

--
-- Indeksy dla tabeli `surname`
--
ALTER TABLE `surname`
  ADD PRIMARY KEY (`surname_id`),
  ADD KEY `country_id` (`country_id`);

--
-- Indeksy dla tabeli `trait`
--
ALTER TABLE `trait`
  ADD PRIMARY KEY (`trait_id`),
  ADD KEY `contrast_trait_id` (`contrast_trait_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `country`
--
ALTER TABLE `country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `feat`
--
ALTER TABLE `feat`
  MODIFY `feat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `name`
--
ALTER TABLE `name`
  MODIFY `name_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=453;

--
-- AUTO_INCREMENT for table `npc`
--
ALTER TABLE `npc`
  MODIFY `npc_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `skill`
--
ALTER TABLE `skill`
  MODIFY `skill_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `stat`
--
ALTER TABLE `stat`
  MODIFY `stat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `surname`
--
ALTER TABLE `surname`
  MODIFY `surname_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=451;

--
-- AUTO_INCREMENT for table `trait`
--
ALTER TABLE `trait`
  MODIFY `trait_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `name`
--
ALTER TABLE `name`
  ADD CONSTRAINT `name_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`);

--
-- Constraints for table `npc`
--
ALTER TABLE `npc`
  ADD CONSTRAINT `npc_ibfk_1` FOREIGN KEY (`name_id`) REFERENCES `name` (`name_id`),
  ADD CONSTRAINT `npc_ibfk_2` FOREIGN KEY (`surname_id`) REFERENCES `surname` (`surname_id`),
  ADD CONSTRAINT `npc_ibfk_3` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`);

--
-- Constraints for table `npc_feat`
--
ALTER TABLE `npc_feat`
  ADD CONSTRAINT `npc_feat_ibfk_1` FOREIGN KEY (`npc_id`) REFERENCES `npc` (`npc_id`),
  ADD CONSTRAINT `npc_feat_ibfk_2` FOREIGN KEY (`feat_id`) REFERENCES `feat` (`feat_id`);

--
-- Constraints for table `npc_skill`
--
ALTER TABLE `npc_skill`
  ADD CONSTRAINT `npc_skill_ibfk_1` FOREIGN KEY (`npc_id`) REFERENCES `npc` (`npc_id`),
  ADD CONSTRAINT `npc_skill_ibfk_2` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`skill_id`);

--
-- Constraints for table `npc_stat`
--
ALTER TABLE `npc_stat`
  ADD CONSTRAINT `npc_stat_ibfk_1` FOREIGN KEY (`npc_id`) REFERENCES `npc` (`npc_id`),
  ADD CONSTRAINT `npc_stat_ibfk_2` FOREIGN KEY (`stat_id`) REFERENCES `stat` (`stat_id`);

--
-- Constraints for table `npc_trait`
--
ALTER TABLE `npc_trait`
  ADD CONSTRAINT `npc_trait_ibfk_1` FOREIGN KEY (`npc_id`) REFERENCES `npc` (`npc_id`),
  ADD CONSTRAINT `npc_trait_ibfk_2` FOREIGN KEY (`trait_id`) REFERENCES `trait` (`trait_id`);

--
-- Constraints for table `skill_description`
--
ALTER TABLE `skill_description`
  ADD CONSTRAINT `skill_description_ibfk_1` FOREIGN KEY (`skill_id`) REFERENCES `skill` (`skill_id`);

--
-- Constraints for table `stat_description`
--
ALTER TABLE `stat_description`
  ADD CONSTRAINT `stat_description_ibfk_1` FOREIGN KEY (`stat_id`) REFERENCES `stat` (`stat_id`);

--
-- Constraints for table `surname`
--
ALTER TABLE `surname`
  ADD CONSTRAINT `surname_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`country_id`);

--
-- Constraints for table `trait`
--
ALTER TABLE `trait`
  ADD CONSTRAINT `trait_ibfk_1` FOREIGN KEY (`contrast_trait_id`) REFERENCES `trait` (`trait_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
