ALTER TABLE `users` ADD COLUMN IF NOT EXISTS `pet` TINYINT;

CREATE TABLE IF NOT EXISTS `pet` (
  `identifier` varchar(60) NOT NULL,
  `petmodel` varchar(100) NOT NULL,
  `food` int(11) NOT NULL, DEFAULT `0`, INT CHECK (`food` BETWEEN 0 and 100));
  `thirst` int(11) NOT NULL, DEFAULT `0`,   INT CHECK (`food` BETWEEN 0 and 100));
  PRIMARY KEY (`identifer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
