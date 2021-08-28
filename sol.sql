-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : ven. 27 août 2021 à 20:58
-- Version du serveur : 10.4.20-MariaDB
-- Version de PHP : 8.0.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `sol`
--

-- --------------------------------------------------------

--
-- Structure de la table `clients`
--

CREATE TABLE `clients` (
  `id_client` int(11) NOT NULL,
  `rs_client` text NOT NULL,
  `ref_client` varchar(255) NOT NULL,
  `fj_client` text NOT NULL,
  `email_client` text NOT NULL,
  `adresse_client` varchar(50) NOT NULL,
  `ville_client` text NOT NULL,
  `pays_client` text NOT NULL,
  `tel_client` text NOT NULL,
  `sw_client` text NOT NULL,
  `mf_client` text NOT NULL,
  `riprib_client` bigint(20) NOT NULL,
  `tauxtva_client` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `clients`
--

INSERT INTO `clients` (`id_client`, `rs_client`, `ref_client`, `fj_client`, `email_client`, `adresse_client`, `ville_client`, `pays_client`, `tel_client`, `sw_client`, `mf_client`, `riprib_client`, `tauxtva_client`) VALUES
(9, 'Maher', 'MANU', 'SA', 'maher@gmail.com', 'Defense', 'Paris', 'France', '336678290', 'www.sss.Com', '13267', 12222, 212112),
(10, 'Houssem', 'CA1920', 'SA', 'houssem.hannachi@enis.tn', 'Meya ', 'Metouia', 'Tunisie', '52215947', 'www.houssem.Com', '13267', 12222, 212112);

-- --------------------------------------------------------

--
-- Structure de la table `devis`
--

CREATE TABLE `devis` (
  `nom_client` text NOT NULL,
  `id_devis` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `adresse_client` text NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `baseht` double NOT NULL,
  `remise` double NOT NULL,
  `totalht` double NOT NULL,
  `TVArate` int(11) NOT NULL,
  `TVAamount` int(11) NOT NULL,
  `totalttc` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `devis_item`
--

CREATE TABLE `devis_item` (
  `id_devis` int(11) NOT NULL,
  `item_code` varchar(255) NOT NULL,
  `item_name` varchar(255) NOT NULL,
  `order_item_quantity` int(11) NOT NULL,
  `order_item_price` int(11) NOT NULL,
  `order_item_final_amount` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `devis_item`
--

INSERT INTO `devis_item` (`id_devis`, `item_code`, `item_name`, `order_item_quantity`, `order_item_price`, `order_item_final_amount`) VALUES
(5, '55', '0', 10, 10, 100),
(6, '1', '0', 3, 300, 900),
(7, 'REFJHSJ', 'SitewEB', 1, 10000, 10000),
(7, '322', 'ORdinateur', 2, 9877, 19754),
(8, '2112', 'MAMAMAMA', 5, 10, 50),
(9, 'ZZAZ', 'ZAZAZA', 4444, 4, 17776),
(9, '2212', 'SQSQ', 33, 33, 1089);

-- --------------------------------------------------------

--
-- Structure de la table `facture`
--

CREATE TABLE `facture` (
  `id_facture` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `order_total_before_tax` varchar(255) NOT NULL,
  `order_total_tax` varchar(255) NOT NULL,
  `order_tax_per` varchar(255) NOT NULL,
  `order_total_after_tax` varchar(255) NOT NULL,
  `order_amount_paid` varchar(255) NOT NULL,
  `order_total_amount_due` varchar(255) NOT NULL,
  `order_date` datetime NOT NULL DEFAULT current_timestamp(),
  `note` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `facture`
--

INSERT INTO `facture` (`id_facture`, `id_client`, `order_total_before_tax`, `order_total_tax`, `order_tax_per`, `order_total_after_tax`, `order_amount_paid`, `order_total_amount_due`, `order_date`, `note`) VALUES
(6, 9, '4000', '120', '3', '4120', '0', '4120', '2021-08-27 18:42:38', '');

-- --------------------------------------------------------

--
-- Structure de la table `facture_item`
--

CREATE TABLE `facture_item` (
  `item_code` varchar(255) NOT NULL,
  `id_facture` int(11) DEFAULT NULL,
  `item_name` varchar(255) NOT NULL,
  `order_item_quantity` varchar(255) NOT NULL,
  `order_item_price` varchar(255) NOT NULL,
  `order_item_final_amount` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `facture_item`
--

INSERT INTO `facture_item` (`item_code`, `id_facture`, `item_name`, `order_item_quantity`, `order_item_price`, `order_item_final_amount`) VALUES
('', 1, '', '', '', ''),
('MM', 3, 'AAA', '3', '10', '30'),
('dsqs', 3, 'qdsdqs', '66', '555', '36630'),
('EZZZ', 2, 'CD', '1', '444', '444'),
('DSD', 4, 'SDD', '10', '222', '2220'),
('SSS', 5, 'SSS', '10', '10', '100'),
('SQS', 6, 'PC', '2', '2000', '4000');

-- --------------------------------------------------------

--
-- Structure de la table `paiements`
--

CREATE TABLE `paiements` (
  `id_paiement` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `date_paiement` date NOT NULL,
  `mode_de_paiement` varchar(255) NOT NULL,
  `id_facture` int(11) NOT NULL,
  `prix` double NOT NULL,
  `status_paiement` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure de la table `propects`
--

CREATE TABLE `propects` (
  `id_prospect` int(11) NOT NULL,
  `rs_prospect` text NOT NULL,
  `adresse_prospect` text NOT NULL,
  `email_prospect` text NOT NULL,
  `ville_prospect` text NOT NULL,
  `pays_prospect` text NOT NULL,
  `tel_prospect` int(11) NOT NULL,
  `facebook_prospect` text NOT NULL,
  `siteweb_prospect` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `propects`
--

INSERT INTO `propects` (`id_prospect`, `rs_prospect`, `adresse_prospect`, `email_prospect`, `ville_prospect`, `pays_prospect`, `tel_prospect`, `facebook_prospect`, `siteweb_prospect`) VALUES
(1, 'Houssem', 'Rue el Afrah', 'houssem.hannachi@enis.tn', 'Metouia', 'Tunisie', 52215947, 'Houssem Hannachi', 'www.houssem.com');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `user_name` varchar(88) NOT NULL,
  `password` varchar(88) NOT NULL,
  `name` varchar(88) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `user_name`, `password`, `name`) VALUES
(4, 'admin', 'admin', 'Solixy');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`id_client`) USING BTREE,
  ADD UNIQUE KEY `ref_client` (`ref_client`);

--
-- Index pour la table `devis`
--
ALTER TABLE `devis`
  ADD PRIMARY KEY (`id_devis`);

--
-- Index pour la table `facture`
--
ALTER TABLE `facture`
  ADD PRIMARY KEY (`id_facture`),
  ADD KEY `ID_client` (`id_client`);

--
-- Index pour la table `paiements`
--
ALTER TABLE `paiements`
  ADD PRIMARY KEY (`id_paiement`),
  ADD KEY `id_cl` (`id_client`),
  ADD KEY `id_fa` (`id_facture`);

--
-- Index pour la table `propects`
--
ALTER TABLE `propects`
  ADD PRIMARY KEY (`id_prospect`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `clients`
--
ALTER TABLE `clients`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `devis`
--
ALTER TABLE `devis`
  MODIFY `id_devis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `facture`
--
ALTER TABLE `facture`
  MODIFY `id_facture` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `paiements`
--
ALTER TABLE `paiements`
  MODIFY `id_paiement` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `propects`
--
ALTER TABLE `propects`
  MODIFY `id_prospect` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `facture`
--
ALTER TABLE `facture`
  ADD CONSTRAINT `ID_client` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`);

--
-- Contraintes pour la table `paiements`
--
ALTER TABLE `paiements`
  ADD CONSTRAINT `id_cl` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`),
  ADD CONSTRAINT `id_fa` FOREIGN KEY (`id_facture`) REFERENCES `facture` (`id_facture`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
