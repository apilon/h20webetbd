-- phpMyAdmin SQL Dump
-- version 4.4.15.9
-- https://www.phpmyadmin.net
--
-- Client :  localhost
-- Généré le :  Lun 12 Mars 2018 à 20:56
-- Version du serveur :  5.6.37
-- Version de PHP :  5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `Blogue`
--

-- --------------------------------------------------------

--
-- Structure de la table `Articles`
--

CREATE TABLE IF NOT EXISTS `Articles` (
  `id` int(11) NOT NULL,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sous_titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `utilisateur_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `texte` text COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `Articles`
--

INSERT INTO `Articles` (`id`, `titre`, `sous_titre`, `utilisateur_id`, `date`, `texte`, `type`) VALUES
(1, 'Premier article', 'Premier sous-titre', 1, '2018-01-24', 'Texte du premier article', 'un type'),
(2, 'Deuxième article', 'Deuxième sous-titre', 1, '2018-02-26', 'Texte du deuxième article', 'un type');

-- --------------------------------------------------------

--
-- Structure de la table `Commentaires`
--

CREATE TABLE IF NOT EXISTS `Commentaires` (
  `id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `auteur` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `titre` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `texte` text COLLATE utf8_unicode_ci NOT NULL,
  `prive` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `Commentaires`
--

INSERT INTO `Commentaires` (`id`, `article_id`, `date`, `auteur`, `titre`, `texte`, `prive`) VALUES
(5, 1, '2018-01-24', 'Moi mod.', 'Mon commentaire mod.', 'Voici mon commentaire modifié', 1),
(7, 1, '2018-01-29', 'Lui mod.', 'Son commentaire mod.', 'Voici son commentaire modifié', 1),
(9, 2, '2018-01-30', 'Nous', 'notre commentaire', 'Le texte de notre commentaire', 1),
(10, 2, '2018-02-01', 'Vous', 'Votre commentaire', 'Le texte de votre commentaire', 0),
(23, 1, '2018-03-12', 'Toi', 'Ton commentaire', 'Le texte de ton commentaire', 1),
(29, 2, '2018-03-12', 'a@b.c', 'Test de courriel', 'Commentaire d''un auteur avec courriel', 1);

-- --------------------------------------------------------

--
-- Structure de la table `Types`
--

CREATE TABLE IF NOT EXISTS `Types` (
  `id` int(11) NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `Types`
--

INSERT INTO `Types` (`id`, `type`) VALUES
(1, 'ActionScript'),
(2, 'AppleScript'),
(3, 'Asp'),
(4, 'BASIC'),
(5, 'C'),
(6, 'C++'),
(7, 'Clojure'),
(8, 'COBOL'),
(9, 'ColdFusion'),
(10, 'Erlang'),
(11, 'Fortran'),
(12, 'Groovy'),
(13, 'Haskell'),
(14, 'Java'),
(15, 'JavaScript'),
(16, 'Lisp'),
(17, 'Perl'),
(18, 'PHP'),
(19, 'Python'),
(20, 'Ruby'),
(21, 'Scala'),
(22, 'Scheme');

-- --------------------------------------------------------

--
-- Structure de la table `Utilisateurs`
--

CREATE TABLE IF NOT EXISTS `Utilisateurs` (
  `id` int(11) NOT NULL,
  `nom` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `identifiant` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mot_de_passe` varchar(255) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Contenu de la table `Utilisateurs`
--

INSERT INTO `Utilisateurs` (`id`, `nom`, `identifiant`, `mot_de_passe`) VALUES
(1, 'André Pilon', 'apilon', 'prof');

--
-- Index pour les tables exportées
--

--
-- Index pour la table `Articles`
--
ALTER TABLE `Articles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `utilisateur_id` (`utilisateur_id`);

--
-- Index pour la table `Commentaires`
--
ALTER TABLE `Commentaires`
  ADD PRIMARY KEY (`id`),
  ADD KEY `article_id` (`article_id`);

--
-- Index pour la table `Types`
--
ALTER TABLE `Types`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Utilisateurs`
--
ALTER TABLE `Utilisateurs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `Articles`
--
ALTER TABLE `Articles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `Commentaires`
--
ALTER TABLE `Commentaires`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT pour la table `Types`
--
ALTER TABLE `Types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=23;
--
-- AUTO_INCREMENT pour la table `Utilisateurs`
--
ALTER TABLE `Utilisateurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `Articles`
--
ALTER TABLE `Articles`
  ADD CONSTRAINT `articles_ibfk_1` FOREIGN KEY (`utilisateur_id`) REFERENCES `Utilisateurs` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `Commentaires`
--
ALTER TABLE `Commentaires`
  ADD CONSTRAINT `commentaires_ibfk_1` FOREIGN KEY (`article_id`) REFERENCES `Articles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
