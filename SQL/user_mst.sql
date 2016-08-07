CREATE TABLE `user_mst` (
  `id` mediumint(9) NOT NULL AUTO_INCREMENT,
  `loginid` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sex` varchar(2)  NOT NULL,
  PRIMARY KEY (`id`)
);
