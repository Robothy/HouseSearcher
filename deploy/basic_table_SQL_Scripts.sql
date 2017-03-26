CREATE TABLE `ent_agent` (\n  `DATA_ID` int(11) NOT NULL AUTO_INCREMENT,\n  `H_HREF` varchar(100) DEFAULT NULL,\n  `NAME` varchar(30) DEFAULT NULL,\n  `PHONE` varchar(20) DEFAULT NULL,\n  `C_HREF` varchar(100) DEFAULT NULL,\n  PRIMARY KEY (`DATA_ID`),\n  UNIQUE KEY `H_HREF` (`H_HREF`)\n) ENGINE=InnoDB DEFAULT CHARSET=utf8

drop table `ent_agent` 
drop table `ent_community`
drop table `ent_house`
