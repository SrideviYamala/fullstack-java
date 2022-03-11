CREATE TABLE `skills` (
  `id` smallint UNSIGNED NOT NULL AUTO_INCREMENT,
  `skillName` varchar(25) NOT NULL,
  CONSTRAINT `PK_skills` PRIMARY KEY (`id`),
  CONSTRAINT `UQ_skills_skillName` UNIQUE (`skillName`),
  INDEX `IX_skills_skillName` (`skillName`)
) ENGINE=InnoDB;
