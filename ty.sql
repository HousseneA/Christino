DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(65) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,

  PRIMARY KEY (`id`)
);

DROP TABLE IF EXISTS `token`;
CREATE TABLE IF NOT EXISTS `token` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(250)  NULL,

  PRIMARY KEY (`id`)
);