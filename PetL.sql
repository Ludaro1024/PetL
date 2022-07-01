ALTER TABLE `users` ADD COLUMN IF NOT EXISTS `pet` TINYINT;

CREATE TABLE IF NOT EXISTS `pet` (
  `identifier` varchar(60) NOT NULL,
  `petmodel` varchar(100) NOT NULL,
   `food` INT(11) DEFAULT `0`, 
   `thirst` INT(11) DEFAULT `0`,
   `nickname`varchar(100),
  PRIMARY KEY (`identifer`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
