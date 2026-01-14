-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mer. 14 jan. 2026 à 16:09
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `immoform`
--

-- --------------------------------------------------------

--
-- Structure de la table `agences`
--

CREATE TABLE `agences` (
  `id` int(11) NOT NULL,
  `nom` varchar(65) NOT NULL,
  `adresse` varchar(535) NOT NULL,
  `ville` varchar(535) NOT NULL,
  `code_postal` varchar(11) NOT NULL,
  `num_tel` int(10) NOT NULL,
  `adresse_mail` varchar(65) NOT NULL,
  `id_contact_principal` int(11) NOT NULL,
  `id_contact_facturation` int(11) DEFAULT NULL,
  `adherent` tinyint(1) NOT NULL,
  `date_debut_contrat` date NOT NULL,
  `date_fin_contrat` date DEFAULT NULL,
  `statut_contrat` varchar(65) NOT NULL,
  `region` int(3) NOT NULL,
  `type_agence` varchar(65) NOT NULL,
  `nom_reseau` varchar(65) DEFAULT NULL,
  `nom_franchise` varchar(65) DEFAULT NULL,
  `secteur_activite` varchar(65) NOT NULL,
  `nombre_agents` int(11) NOT NULL,
  `transactions_annuelles` int(11) NOT NULL,
  `commentaires` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `agences`
--

INSERT INTO `agences` (`id`, `nom`, `adresse`, `ville`, `code_postal`, `num_tel`, `adresse_mail`, `id_contact_principal`, `id_contact_facturation`, `adherent`, `date_debut_contrat`, `date_fin_contrat`, `statut_contrat`, `region`, `type_agence`, `nom_reseau`, `nom_franchise`, `secteur_activite`, `nombre_agents`, `transactions_annuelles`, `commentaires`) VALUES
(3, 'Agence Alpha', '12 rue des Lilas', 'Paris', '75012', 145789632, 'contact@agencealpha.fr', 1, 1, 1, '2023-01-01', NULL, 'actif', 0, 'indépendante', NULL, NULL, 'résidentiel', 5, 120, NULL),
(4, 'Agence Beta', '45 avenue du Commerce', 'Lyon', '69003', 478562391, 'contact@agencebeta.fr', 2, 2, 0, '0000-00-00', NULL, 'inactif', 0, 'franchise', NULL, NULL, 'commercial', 8, 200, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

CREATE TABLE `compte` (
  `id_utilisateur` int(11) NOT NULL,
  `type_profile` varchar(65) NOT NULL,
  `mdp` varchar(535) NOT NULL,
  `adresse_mail` varchar(65) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `compte`
--

INSERT INTO `compte` (`id_utilisateur`, `type_profile`, `mdp`, `adresse_mail`) VALUES
(1, 'formateurs', '$2y$10$H/74Zv5aYJSocUvrF/8wzeL18QLN3LzeNsfeK8lh35obYNoVaVpC6', 'corentin.joguet@gmail.com'),
(1, 'contacts', '$2y$10$o1hndjXDr0rvFT18lq3hKu69XuZGDS7916PloKEVsDyQAGr5dvcO.', 'gabin.pageot@gmail.com'),
(2, 'contacts', '$2y$10$eHSUM7XavcML2ANnwMaYJOQcVNgFt2eW/TjP.Or302qGgCX3XGF1i', 'nils.grosjean@gmail.com'),
(0, 'contacts', '$2y$10$Gw.cHfC/H/CaasoUuCxu4OUsg3MkBTw50USrxbRNAgQglqkqUl9h.', 'pageot.gab1@gmail.com');

-- --------------------------------------------------------

--
-- Structure de la table `contacts`
--

CREATE TABLE `contacts` (
  `id` int(11) NOT NULL,
  `nom` varchar(65) NOT NULL,
  `prenom` varchar(65) NOT NULL,
  `num_tel` varchar(10) DEFAULT NULL,
  `adresse_mail` varchar(65) NOT NULL,
  `preference_contact` varchar(65) DEFAULT NULL,
  `commentaire` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `contacts`
--

INSERT INTO `contacts` (`id`, `nom`, `prenom`, `num_tel`, `adresse_mail`, `preference_contact`, `commentaire`) VALUES
(1, 'Pageot', 'Gabin', '0600000001', 'gabin.pageot@gmail.com', NULL, NULL),
(2, 'Grosjean', 'Nils', '0600000002', 'nils.grosjean@gmail.com', NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `demande_conseils`
--

CREATE TABLE `demande_conseils` (
  `id` int(11) NOT NULL,
  `id_agence` int(11) NOT NULL,
  `id_contact` int(11) NOT NULL,
  `type_conseil` varchar(65) NOT NULL,
  `description` text NOT NULL,
  `date_demande` date NOT NULL DEFAULT current_timestamp(),
  `statut` varchar(65) NOT NULL,
  `id_formateur` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `formateurs`
--

CREATE TABLE `formateurs` (
  `id` int(11) NOT NULL,
  `nom` varchar(65) NOT NULL,
  `prenom` varchar(65) NOT NULL,
  `num_tel` varchar(10) DEFAULT NULL,
  `adresse_mail` varchar(65) NOT NULL,
  `specialite` varchar(65) DEFAULT NULL,
  `anciennete` varchar(65) DEFAULT NULL,
  `certifications` text DEFAULT NULL,
  `commentaires` text DEFAULT NULL,
  `date_debut_collaborat` date NOT NULL,
  `date_fin_collaboration` date DEFAULT NULL,
  `statut` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `formateurs`
--

INSERT INTO `formateurs` (`id`, `nom`, `prenom`, `num_tel`, `adresse_mail`, `specialite`, `anciennete`, `certifications`, `commentaires`, `date_debut_collaborat`, `date_fin_collaboration`, `statut`) VALUES
(1, 'Joguet', 'Corentin', '0700000001', 'corentin.joguet@gmail.com', NULL, NULL, NULL, NULL, '2025-06-25', NULL, 1);

-- --------------------------------------------------------

--
-- Structure de la table `formateurs_assignes`
--

CREATE TABLE `formateurs_assignes` (
  `type_formation` varchar(65) NOT NULL,
  `id_formation` int(11) NOT NULL,
  `id_formateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `formateurs_assignes`
--

INSERT INTO `formateurs_assignes` (`type_formation`, `id_formation`, `id_formateur`) VALUES
('formations_personnalises', 2, 1),
('formations_personnalises', 3, 1),
('formations_personnalises', 4, 1),
('formations_personnalises', 5, 1);

-- --------------------------------------------------------

--
-- Structure de la table `formations_en_ligne`
--

CREATE TABLE `formations_en_ligne` (
  `id` int(11) NOT NULL,
  `titre` varchar(65) NOT NULL,
  `description` text NOT NULL,
  `duree` decimal(10,0) NOT NULL,
  `niveau` varchar(65) NOT NULL,
  `secteur_concernee` varchar(65) NOT NULL,
  `date_heure` datetime NOT NULL,
  `url_acces` varchar(65) NOT NULL,
  `id_formateur` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `formations_personnalises`
--

CREATE TABLE `formations_personnalises` (
  `id` int(11) NOT NULL,
  `titre` varchar(65) NOT NULL,
  `description` text NOT NULL,
  `duree` decimal(10,0) NOT NULL,
  `date_heure` datetime NOT NULL,
  `cout_formation` int(11) NOT NULL,
  `commentaire` text DEFAULT NULL,
  `liens` int(11) NOT NULL,
  `id_demande` int(11) NOT NULL,
  `adresse` varchar(535) NOT NULL,
  `ville` varchar(535) NOT NULL,
  `code_postal` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `formations_presentiel`
--

CREATE TABLE `formations_presentiel` (
  `id` int(11) NOT NULL,
  `titre` varchar(65) NOT NULL,
  `description` text NOT NULL,
  `duree` decimal(10,0) NOT NULL,
  `niveau` varchar(65) NOT NULL,
  `secteur_concernee` varchar(65) NOT NULL,
  `date_heure_debut` datetime NOT NULL,
  `date_heure_fin` datetime NOT NULL,
  `adresse` varchar(535) NOT NULL,
  `ville` varchar(535) NOT NULL,
  `code_postal` varchar(11) NOT NULL,
  `capacite_acceuil` int(11) NOT NULL,
  `materiel` text DEFAULT NULL,
  `cout_formation` int(11) NOT NULL,
  `modalites_inscription` text DEFAULT NULL,
  `commentaires` text DEFAULT NULL,
  `liens_connexion` varchar(535) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `inscriptions`
--

CREATE TABLE `inscriptions` (
  `id` int(11) NOT NULL,
  `id_agence` int(11) NOT NULL,
  `id_contact` int(11) NOT NULL,
  `type_formation` varchar(65) NOT NULL,
  `date_inscription` date NOT NULL,
  `statut_inscription` varchar(65) NOT NULL,
  `mode_paiement` varchar(65) NOT NULL,
  `statut_paiement` varchar(65) NOT NULL,
  `montant_payé` int(11) NOT NULL,
  `commentaires` text NOT NULL,
  `id_formation` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `travail`
--

CREATE TABLE `travail` (
  `id_contact` int(11) NOT NULL,
  `id_agence` int(11) NOT NULL,
  `fonction` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `travail`
--

INSERT INTO `travail` (`id_contact`, `id_agence`, `fonction`) VALUES
(1, 3, 'PDG'),
(2, 4, 'stagiaire');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `agences`
--
ALTER TABLE `agences`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_contact_facturation` (`id_contact_facturation`),
  ADD KEY `id_contact_principal` (`id_contact_principal`);

--
-- Index pour la table `compte`
--
ALTER TABLE `compte`
  ADD PRIMARY KEY (`adresse_mail`);

--
-- Index pour la table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `demande_conseils`
--
ALTER TABLE `demande_conseils`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_agence` (`id_agence`),
  ADD KEY `id_contact` (`id_contact`),
  ADD KEY `id_formateur` (`id_formateur`);

--
-- Index pour la table `formateurs`
--
ALTER TABLE `formateurs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `formateurs_assignes`
--
ALTER TABLE `formateurs_assignes`
  ADD KEY `id_formateur` (`id_formateur`);

--
-- Index pour la table `formations_en_ligne`
--
ALTER TABLE `formations_en_ligne`
  ADD KEY `id_formateur` (`id_formateur`);

--
-- Index pour la table `formations_personnalises`
--
ALTER TABLE `formations_personnalises`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_demande` (`id_demande`);

--
-- Index pour la table `inscriptions`
--
ALTER TABLE `inscriptions`
  ADD KEY `id_agence` (`id_agence`),
  ADD KEY `id_contact` (`id_contact`);

--
-- Index pour la table `travail`
--
ALTER TABLE `travail`
  ADD KEY `id_agence` (`id_agence`),
  ADD KEY `id_contact` (`id_contact`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `demande_conseils`
--
ALTER TABLE `demande_conseils`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `formations_personnalises`
--
ALTER TABLE `formations_personnalises`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `agences`
--
ALTER TABLE `agences`
  ADD CONSTRAINT `agences_ibfk_1` FOREIGN KEY (`id_contact_facturation`) REFERENCES `contacts` (`id`),
  ADD CONSTRAINT `agences_ibfk_2` FOREIGN KEY (`id_contact_principal`) REFERENCES `contacts` (`id`);

--
-- Contraintes pour la table `demande_conseils`
--
ALTER TABLE `demande_conseils`
  ADD CONSTRAINT `demande_conseils_ibfk_1` FOREIGN KEY (`id_agence`) REFERENCES `agences` (`id`),
  ADD CONSTRAINT `demande_conseils_ibfk_2` FOREIGN KEY (`id_contact`) REFERENCES `contacts` (`id`),
  ADD CONSTRAINT `demande_conseils_ibfk_3` FOREIGN KEY (`id_formateur`) REFERENCES `formateurs` (`id`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Contraintes pour la table `formateurs_assignes`
--
ALTER TABLE `formateurs_assignes`
  ADD CONSTRAINT `formateurs_assignes_ibfk_1` FOREIGN KEY (`id_formateur`) REFERENCES `formateurs` (`id`);

--
-- Contraintes pour la table `formations_en_ligne`
--
ALTER TABLE `formations_en_ligne`
  ADD CONSTRAINT `formations_en_ligne_ibfk_1` FOREIGN KEY (`id_formateur`) REFERENCES `formateurs` (`id`);

--
-- Contraintes pour la table `formations_personnalises`
--
ALTER TABLE `formations_personnalises`
  ADD CONSTRAINT `formations_personnalises_ibfk_1` FOREIGN KEY (`id_demande`) REFERENCES `demande_conseils` (`id`);

--
-- Contraintes pour la table `inscriptions`
--
ALTER TABLE `inscriptions`
  ADD CONSTRAINT `inscriptions_ibfk_1` FOREIGN KEY (`id_agence`) REFERENCES `agences` (`id`),
  ADD CONSTRAINT `inscriptions_ibfk_2` FOREIGN KEY (`id_contact`) REFERENCES `contacts` (`id`);

--
-- Contraintes pour la table `travail`
--
ALTER TABLE `travail`
  ADD CONSTRAINT `travail_ibfk_1` FOREIGN KEY (`id_agence`) REFERENCES `agences` (`id`),
  ADD CONSTRAINT `travail_ibfk_2` FOREIGN KEY (`id_contact`) REFERENCES `contacts` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
