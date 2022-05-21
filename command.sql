# 1st Create Table
CREATE TABLE `test_data` 
(
  `id`		bigint(20)       NOT NULL     AUTO_INCREMENT,
  `memberId`	int(11)          NOT NULL,
  `randomData`  decimal(50, 3)   NOT NULL,
  `fixedValue`  decimal(50, 3)   NOT NULL,
  `date`	datetime         NOT NULL,

  PRIMARY KEY (`id`)
);


#2nd generate random test data in two date range and between min and max number in MySQL Procedure
DELIMITER $$
CREATE PROCEDURE generate_data()
BEGIN
  DECLARE startDate varchar(255) DEFAULT '2014-01-01 01:00:00';
  DECLARE endDate varchar(255) DEFAULT '2014-02-01 01:00:00';
  DECLARE min INT DEFAULT 10;
  DECLARE max INT DEFAULT 100;
  
  WHILE UNIX_TIMESTAMP(endDate) >= UNIX_TIMESTAMP(startDate) DO
    INSERT INTO `test_data` (`memberId`,`randomData`,`fixedValue`, `date`) VALUES (
      ROUND(RAND()*100),
      ROUND((RAND()* (max-min))+min, 3),
      0.370,
      startDate
    );
    SET startDate = FROM_UNIXTIME(UNIX_TIMESTAMP(startDate)+FLOOR(900));
    
  END WHILE;
END$$
DELIMITER ;

CALL generate_data();
