CREATE TABLE `pet` (
  `identifier` varchar(60) NOT NULL,
  `petmodel` varchar(60) DEFAULT NULL,
  `food` int(2) NOT NULL DEFAULT 0,
  `thirst` int(2) NOT NULL DEFAULT 0,
  `nickname` varchar(60) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
ALTER TABLE `pet`
  ADD PRIMARY KEY (`identifier`);
COMMIT;
