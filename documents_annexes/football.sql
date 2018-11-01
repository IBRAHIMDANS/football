-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Client :  localhost:3306
-- Généré le :  Mar 20 Février 2018 à 16:47
-- Version du serveur :  10.1.26-MariaDB-0+deb9u1
-- Version de PHP :  7.0.27-0+deb9u1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `football`
--

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add group', 2, 'add_group'),
(5, 'Can change group', 2, 'change_group'),
(6, 'Can delete group', 2, 'delete_group'),
(7, 'Can add permission', 3, 'add_permission'),
(8, 'Can change permission', 3, 'change_permission'),
(9, 'Can delete permission', 3, 'delete_permission'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'group'),
(3, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2018-02-20 15:36:35'),
(2, 'auth', '0001_initial', '2018-02-20 15:36:44'),
(3, 'admin', '0001_initial', '2018-02-20 15:36:46'),
(4, 'admin', '0002_logentry_remove_auto_add', '2018-02-20 15:36:47'),
(5, 'contenttypes', '0002_remove_content_type_name', '2018-02-20 15:36:48'),
(6, 'auth', '0002_alter_permission_name_max_length', '2018-02-20 15:36:49'),
(7, 'auth', '0003_alter_user_email_max_length', '2018-02-20 15:36:50'),
(8, 'auth', '0004_alter_user_username_opts', '2018-02-20 15:36:50'),
(9, 'auth', '0005_alter_user_last_login_null', '2018-02-20 15:36:50'),
(10, 'auth', '0006_require_contenttypes_0002', '2018-02-20 15:36:50'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2018-02-20 15:36:50'),
(12, 'auth', '0008_alter_user_username_max_length', '2018-02-20 15:36:52'),
(13, 'sessions', '0001_initial', '2018-02-20 15:36:53');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `Entraineur`
--

CREATE TABLE `Entraineur` (
  `Id_Entraineur` int(11) NOT NULL,
  `Nom` varchar(15) DEFAULT NULL,
  `Prenom` varchar(10) DEFAULT NULL,
  `mot_de_passe` varchar(25) NOT NULL,
  `Id_Equipe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `Equipe`
--

CREATE TABLE `Equipe` (
  `Id_Equipe` int(11) NOT NULL,
  `Nom` varchar(10) DEFAULT NULL,
  `Nb_joueurs` varchar(10) DEFAULT NULL,
  `Systeme_jeu` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `Equipe`
--

INSERT INTO `Equipe` (`Id_Equipe`, `Nom`, `Nb_joueurs`, `Systeme_jeu`) VALUES
(0, 'CA Boulay', '25', NULL),
(1, 'CA Metz', '25', NULL),
(2, 'ES Fameck', '25', NULL),
(3, 'UL Rombas', '25', NULL),
(4, 'ES Metz', '25', NULL),
(5, 'FC Yutz', '25', NULL),
(6, 'AS Vagney', '25', NULL),
(8, 'FC Toul', '25', NULL),
(9, 'Epinal', '25', NULL),
(10, 'US Forbach', '25', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `Joueur`
--

CREATE TABLE `Joueur` (
  `Id_Joueur` int(11) NOT NULL,
  `Nom` varchar(15) DEFAULT NULL,
  `Prenom` varchar(25) DEFAULT NULL,
  `Age` int(11) DEFAULT NULL,
  `Taille` int(11) DEFAULT NULL,
  `Poste` varchar(10) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `Disponible` tinyint(1) DEFAULT NULL,
  `Position` int(11) DEFAULT NULL,
  `Id_Equipe` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `Joueur`
--

INSERT INTO `Joueur` (`Id_Joueur`, `Nom`, `Prenom`, `Age`, `Taille`, `Poste`, `Status`, `Disponible`, `Position`, `Id_Equipe`) VALUES
(2, 'Benjamin', 'Lopez', 26, 166, 'G', 1, 1, 1, 1),
(3, 'Bradley', 'Richards', 31, 178, 'D', 1, 1, 3, 1),
(4, 'Castro', 'Daniel', 23, 156, 'D', 1, 1, 5, 1),
(5, 'Ingram', 'Branch', 24, 181, 'D', 1, 1, 4, 1),
(6, 'Rocha', 'Fowler', 26, 200, 'D', 2, 1, 3, 1),
(7, 'Dickson', 'Foley', 23, 180, 'D', 3, 0, 2, 1),
(8, 'Guy', 'Keller', 29, 214, 'A', 3, 1, 10, 1),
(9, 'Diaz', 'Oneill', 38, 194, 'D', 2, 1, 4, 1),
(10, 'Guerra', 'Goodwin', 38, 189, 'G', 2, 1, 1, 1),
(11, 'Sweeney', 'Schroeder', 39, 169, 'M', 1, 1, 8, 1),
(12, 'Whitaker', 'Benton', 26, 171, 'M', 1, 1, 6, 1),
(13, 'Palmer', 'Sargent', 40, 177, 'D', 2, 1, 4, 1),
(14, 'Alvarez', 'Albert', 33, 177, 'G', 3, 0, 1, 1),
(15, 'Henry', 'Wilkinson', 35, 185, 'M', 3, 1, 9, 1),
(16, 'Valencia', 'Houston', 24, 210, 'D', 3, 0, 2, 1),
(17, 'Odonnell', 'Summers', 32, 200, 'A', 3, 0, 10, 1),
(18, 'Harding', 'Cain', 26, 187, 'A', 1, 1, 10, 1),
(19, 'Goff', 'Ellis', 37, 205, 'A', 1, 1, 11, 1),
(20, 'Wagner', 'Gates', 35, 191, 'M', 1, 1, 7, 1),
(21, 'Marks', 'Schwartz', 34, 178, 'D', 1, 1, 2, 1),
(22, 'Tanner', 'Nguyen', 40, 171, 'M', 1, 1, 8, 1),
(23, 'Parks', 'Salazar', 35, 160, 'A', 3, 1, 11, 1),
(24, 'Richards', 'Estrada', 29, 169, 'A', 2, 1, 11, 1),
(25, 'Mendez', 'Pruitt', 26, 207, 'M', 2, 1, 8, 1),
(36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `Statistique`
--

CREATE TABLE `Statistique` (
  `Id_stat` int(11) NOT NULL,
  `Temps_jeu` int(11) DEFAULT NULL,
  `But` int(11) DEFAULT NULL,
  `Passe_decisive` int(11) DEFAULT NULL,
  `Match_dispute` int(11) DEFAULT NULL,
  `Id_Joueur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `Statistique`
--

INSERT INTO `Statistique` (`Id_stat`, `Temps_jeu`, `But`, `Passe_decisive`, `Match_dispute`, `Id_Joueur`) VALUES
(0, 180, 0, 0, 2, 0);

--
-- Index pour les tables exportées
--

--
-- Index pour la table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Index pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Index pour la table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Index pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Index pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Index pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk` (`user_id`);

--
-- Index pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Index pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Index pour la table `Entraineur`
--
ALTER TABLE `Entraineur`
  ADD PRIMARY KEY (`Id_Entraineur`),
  ADD KEY `Id_Entraineur` (`Id_Entraineur`),
  ADD KEY `Id_Equipe` (`Id_Equipe`);

--
-- Index pour la table `Equipe`
--
ALTER TABLE `Equipe`
  ADD PRIMARY KEY (`Id_Equipe`),
  ADD KEY `Id_Equipe` (`Id_Equipe`);

--
-- Index pour la table `Joueur`
--
ALTER TABLE `Joueur`
  ADD PRIMARY KEY (`Id_Joueur`),
  ADD KEY `Id_Joueur` (`Id_Joueur`,`Id_Equipe`),
  ADD KEY `Id_Equipe` (`Id_Equipe`);

--
-- Index pour la table `Statistique`
--
ALTER TABLE `Statistique`
  ADD PRIMARY KEY (`Id_stat`),
  ADD KEY `FK_Statistique_Id_Joueur` (`Id_Joueur`) USING BTREE,
  ADD KEY `Id_stat` (`Id_stat`,`Id_Joueur`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT pour la table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT pour la table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT pour la table `Joueur`
--
ALTER TABLE `Joueur`
  MODIFY `Id_Joueur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT pour la table `Statistique`
--
ALTER TABLE `Statistique`
  MODIFY `Id_stat` int(11) NOT NULL AUTO_INCREMENT;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Contraintes pour la table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Contraintes pour la table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Contraintes pour la table `Entraineur`
--
ALTER TABLE `Entraineur`
  ADD CONSTRAINT `Entraineur_ibfk_1` FOREIGN KEY (`Id_Equipe`) REFERENCES `Equipe` (`Id_Equipe`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Joueur`
--
ALTER TABLE `Joueur`
  ADD CONSTRAINT `Joueur_ibfk_1` FOREIGN KEY (`Id_Equipe`) REFERENCES `Equipe` (`Id_Equipe`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
