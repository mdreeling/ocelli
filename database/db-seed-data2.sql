-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.17 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             8.3.0.4694
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for ocelli_grails
CREATE DATABASE IF NOT EXISTS `ocelli_grails` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `ocelli_grails`;


-- Dumping structure for table ocelli_grails.access_key
CREATE TABLE IF NOT EXISTS `access_key` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `access_key_type_id` bigint(20) NOT NULL,
  `data` text NOT NULL,
  `principal` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKBBF331047E0DEDCA` (`access_key_type_id`),
  KEY `FKBBF3310494582156` (`id`),
  CONSTRAINT `FKBBF331047E0DEDCA` FOREIGN KEY (`access_key_type_id`) REFERENCES `access_key_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table ocelli_grails.access_key: ~2 rows (approximately)
DELETE FROM `access_key`;
/*!40000 ALTER TABLE `access_key` DISABLE KEYS */;
INSERT INTO `access_key` (`id`, `version`, `access_key_type_id`, `data`, `principal`) VALUES
	(1, 2, 1, '-----BEGIN RSA PRIVATE KEY-----\r\nMIIEpQIBAAKCAQEA08BJ4I0WYdjMV6d9x8l8mrLMQj5rNKX/69YzkmqwrSD8QnJJno/KMnwvw73/\r\nx1+jVBr0V5lGPNdQyUnCNDzPM8GNC4TXAPmAdhuNhNrmhW5OVB0hHPDjg4Dw/C+Vrk2LRCi3HtkP\r\nkBYn1Io+m5wQrNeMVmOdZ3Jsh1Am7UDBNH1MLwwvkwDVMBXr9PgBlwRZuQIlkEvk8mIeF8/KqZZR\r\nCdXBic8aXAIUOTzi6XuHl6c/RCWU6pn9o7gYcpcpLXpqnCE4EY+xt7VHQKzUiGB5D2RyMHyWYpsg\r\nE+dP0+e7ktIgC/hxDG86lcYGIzhz27jXvdcBjdkNmYUAg3DI+HtHSQIDAQABAoIBAQDD5ypyLRWA\r\nAOtMTRD5PVeiZ7jBsK3OT6WtssaTt1EtW08GymWB5NXUT0CBf86bzcd1kFpukMeCklGTaEHbwkaQ\r\nQ4kSFxwzMqG+o08SktKir6KX/zsbY2GZ0Dkjl4KLeAJYVLLWP0s+qsC+ygeSP5jNz71uT0rY4eu2\r\nZFkfNsGIpJLQTqDHO8IDmVGZVNbJuAIiZiFw2YgoYFyCUHawGW6Cc33LMh5R2RJ96omt/4mw/nrV\r\nOZ6wfyG/zQ3JYHXKigVteS7cwMzGq8YmSylbijIhySsyjnq2lkDRY6Fjmdqe7e77K5Waj+GlCjQm\r\nuZ4BZclf01Uk/bmOcfMigb8yjjQBAoGBAP5bifGDlILt7FqLKm4CPWxQlSyDCpwDKjD9DZS4glij\r\nSGd8A6wYuX6fjs+pfa21X09SxLbkm27UhCZPK9605xwETC8vG6lFdp9NK5Jt0WRzDh5xUHD9e5Bv\r\nRo1/y2Uf8p1cJfeEiHyIFyYnefHllBQAxLZtkHdrs18pehktiEQRAoGBANUeUeb0/WykNFrZ83lx\r\nhLUF5T0M3vRHpVhE9aZRNVkwzbsRi1krPIqPMA2KD4SgjJdC3WN4NJep4j+HgmX0CHs/x6yc8MRa\r\nXJiszZArTC1RrMbPphgzTB2/KIh4iwAcKe5mEzBxr7N11jiCqT3abhV9hBpQ8eLE0s5KXx6h66e5\r\nAoGANs4wfcp1MHTlbWj4/nUbGQCP8+RUX+NKrv2HdJkA9OpRyoJtJCK7rS3iDpqditU+sQ/LdQDz\r\nAMFnq/15HWZrOZ0vcSc8VY+zDIYLMmTZLkSgMS0HQSFNA4UGdayofaSRmRhm0dtLsVF9c2okG1v1\r\nOQ4lVI1tCF47avC77zrhVpECgYEAn5otTAF9KLdwXfmLVQ+misr3elkBP3/IW+qI7R00Dq914vqo\r\nmQbAOCQzoHAcXv69SypQEgYbnNklDt600RWIpISHTMXbqbDiV5RR/f3u9qGL+vfXM5h3EG/wMwPT\r\nVSnCXT8kb8s0AfnljDyN8jx65K0zGWI1Q9aS6NrZkV9B1EECgYEArm2n29UoSJUT32BEGzopL3Cm\r\n0y/7HCAyI0Brrx2VUsUkHtNRLxt/upxAjzX5JPN1l0T/zGzv6WfXfeM9Fir9VLG5ph32m0BHFetU\r\neym8NJKM6dvGFC2phbLI2816duYxdUDNb1VH3+jqfGkl5IdCOq96TcBVvcSRiH1MOqVM7Ow=\r\n-----END RSA PRIVATE KEY-----', 'ec2-user'),
	(2, 1, 2, '---- BEGIN SSH2 PUBLIC KEY ----\r\nComment: "ocelli"\r\nAAAAB3NzaC1yc2EAAAADAQABAAABAQDTwEngjRZh2MxXp33HyXyassxCPms0pf/r\r\n1jOSarCtIPxCckmej8oyfC/Dvf/HX6NUGvRXmUY811DJScI0PM8zwY0LhNcA+YB2\r\nG42E2uaFbk5UHSEc8OODgPD8L5WuTYtEKLce2Q+QFifUij6bnBCs14xWY51ncmyH\r\nUCbtQME0fUwvDC+TANUwFev0+AGXBFm5AiWQS+TyYh4Xz8qpllEJ1cGJzxpcAhQ5\r\nPOLpe4eXpz9EJZTqmf2juBhylyktemqcITgRj7G3tUdArNSIYHkPZHIwfJZimyAT\r\n50/T57uS0iAL+HEMbzqVxgYjOHPbuNe91wGN2Q2ZhQCDcMj4e0dJ\r\n---- END SSH2 PUBLIC KEY ----', 'mdreeling');
/*!40000 ALTER TABLE `access_key` ENABLE KEYS */;


-- Dumping structure for table ocelli_grails.access_key_type
CREATE TABLE IF NOT EXISTS `access_key_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `access_key_type_description` varchar(255) NOT NULL,
  `access_key_type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table ocelli_grails.access_key_type: ~2 rows (approximately)
DELETE FROM `access_key_type`;
/*!40000 ALTER TABLE `access_key_type` DISABLE KEYS */;
INSERT INTO `access_key_type` (`id`, `version`, `access_key_type_description`, `access_key_type_name`) VALUES
	(1, 1, 'Private SSH 2 Key', 'PRIVSSH2KEY'),
	(2, 0, 'Public SSH2 Key', 'PUBSSH2KEY');
/*!40000 ALTER TABLE `access_key_type` ENABLE KEYS */;


-- Dumping structure for table ocelli_grails.application
CREATE TABLE IF NOT EXISTS `application` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `app_description` varchar(255) NOT NULL,
  `app_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table ocelli_grails.application: ~1 rows (approximately)
DELETE FROM `application`;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` (`id`, `version`, `app_description`, `app_name`) VALUES
	(1, 4, 'Ocelli Server Application', 'Ocelli Server');
/*!40000 ALTER TABLE `application` ENABLE KEYS */;


-- Dumping structure for table ocelli_grails.application_artifact
CREATE TABLE IF NOT EXISTS `application_artifact` (
  `application_artifacts_id` bigint(20) DEFAULT NULL,
  `artifact_id` bigint(20) DEFAULT NULL,
  KEY `FK1E2C2BE145A08AA8` (`application_artifacts_id`),
  KEY `FK1E2C2BE148DE38EA` (`artifact_id`),
  CONSTRAINT `FK1E2C2BE145A08AA8` FOREIGN KEY (`application_artifacts_id`) REFERENCES `application` (`id`),
  CONSTRAINT `FK1E2C2BE148DE38EA` FOREIGN KEY (`artifact_id`) REFERENCES `artifact` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ocelli_grails.application_artifact: ~1 rows (approximately)
DELETE FROM `application_artifact`;
/*!40000 ALTER TABLE `application_artifact` DISABLE KEYS */;
INSERT INTO `application_artifact` (`application_artifacts_id`, `artifact_id`) VALUES
	(1, 1);
/*!40000 ALTER TABLE `application_artifact` ENABLE KEYS */;


-- Dumping structure for table ocelli_grails.application_environment
CREATE TABLE IF NOT EXISTS `application_environment` (
  `application_environments_id` bigint(20) DEFAULT NULL,
  `environment_id` bigint(20) DEFAULT NULL,
  KEY `FK74841DA4E753E2EB` (`application_environments_id`),
  KEY `FK74841DA4756A4E6A` (`environment_id`),
  CONSTRAINT `FK74841DA4756A4E6A` FOREIGN KEY (`environment_id`) REFERENCES `environment` (`id`),
  CONSTRAINT `FK74841DA4E753E2EB` FOREIGN KEY (`application_environments_id`) REFERENCES `application` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ocelli_grails.application_environment: ~4 rows (approximately)
DELETE FROM `application_environment`;
/*!40000 ALTER TABLE `application_environment` DISABLE KEYS */;
INSERT INTO `application_environment` (`application_environments_id`, `environment_id`) VALUES
	(1, 1),
	(1, 2),
	(1, 2),
	(1, 2);
/*!40000 ALTER TABLE `application_environment` ENABLE KEYS */;


-- Dumping structure for table ocelli_grails.artifact
CREATE TABLE IF NOT EXISTS `artifact` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `artifact_location` varchar(255) NOT NULL,
  `artifact_type_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB6C205D26F1F236F` (`artifact_type_id`),
  CONSTRAINT `FKB6C205D26F1F236F` FOREIGN KEY (`artifact_type_id`) REFERENCES `artifact_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table ocelli_grails.artifact: ~1 rows (approximately)
DELETE FROM `artifact`;
/*!40000 ALTER TABLE `artifact` DISABLE KEYS */;
INSERT INTO `artifact` (`id`, `version`, `artifact_location`, `artifact_type_id`) VALUES
	(1, 0, '/logs-a/SUSY.csv', 1);
/*!40000 ALTER TABLE `artifact` ENABLE KEYS */;


-- Dumping structure for table ocelli_grails.artifact_type
CREATE TABLE IF NOT EXISTS `artifact_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `artifact_type_description` varchar(255) NOT NULL,
  `artifact_type_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table ocelli_grails.artifact_type: ~1 rows (approximately)
DELETE FROM `artifact_type`;
/*!40000 ALTER TABLE `artifact_type` DISABLE KEYS */;
INSERT INTO `artifact_type` (`id`, `version`, `artifact_type_description`, `artifact_type_name`) VALUES
	(1, 0, 'Text Log File', 'Text Log');
/*!40000 ALTER TABLE `artifact_type` ENABLE KEYS */;


-- Dumping structure for table ocelli_grails.environment
CREATE TABLE IF NOT EXISTS `environment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `env_type_id` bigint(20) NOT NULL,
  `environment_description` varchar(255) NOT NULL,
  `environment_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKFAE132132804F86B` (`env_type_id`),
  CONSTRAINT `FKFAE132132804F86B` FOREIGN KEY (`env_type_id`) REFERENCES `environment_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table ocelli_grails.environment: ~2 rows (approximately)
DELETE FROM `environment`;
/*!40000 ALTER TABLE `environment` DISABLE KEYS */;
INSERT INTO `environment` (`id`, `version`, `env_type_id`, `environment_description`, `environment_name`) VALUES
	(1, 1, 1, 'Ocelli Dev Environment on EC2', 'Ocelli Dev'),
	(2, 0, 2, 'Ocelli Test Environment', 'Ocelli Test');
/*!40000 ALTER TABLE `environment` ENABLE KEYS */;


-- Dumping structure for table ocelli_grails.environment_node
CREATE TABLE IF NOT EXISTS `environment_node` (
  `environment_nodes_id` bigint(20) DEFAULT NULL,
  `node_id` bigint(20) DEFAULT NULL,
  KEY `FK21E888AE125CC2EA` (`node_id`),
  KEY `FK21E888AEC554E5B8` (`environment_nodes_id`),
  CONSTRAINT `FK21E888AE125CC2EA` FOREIGN KEY (`node_id`) REFERENCES `node` (`id`),
  CONSTRAINT `FK21E888AEC554E5B8` FOREIGN KEY (`environment_nodes_id`) REFERENCES `environment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ocelli_grails.environment_node: ~1 rows (approximately)
DELETE FROM `environment_node`;
/*!40000 ALTER TABLE `environment_node` DISABLE KEYS */;
INSERT INTO `environment_node` (`environment_nodes_id`, `node_id`) VALUES
	(1, 1);
/*!40000 ALTER TABLE `environment_node` ENABLE KEYS */;


-- Dumping structure for table ocelli_grails.environment_type
CREATE TABLE IF NOT EXISTS `environment_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `environment_type` varchar(255) NOT NULL,
  `environment_type_description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Dumping data for table ocelli_grails.environment_type: ~4 rows (approximately)
DELETE FROM `environment_type`;
/*!40000 ALTER TABLE `environment_type` DISABLE KEYS */;
INSERT INTO `environment_type` (`id`, `version`, `environment_type`, `environment_type_description`) VALUES
	(1, 0, 'DEVEL', 'Development'),
	(2, 0, 'TEST', 'Test Environment'),
	(3, 0, 'STAGE', 'Staging Environment'),
	(4, 0, 'PROD', 'Production Environment');
/*!40000 ALTER TABLE `environment_type` ENABLE KEYS */;


-- Dumping structure for table ocelli_grails.node
CREATE TABLE IF NOT EXISTS `node` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `access_key_id` bigint(20) NOT NULL,
  `node_description` varchar(255) NOT NULL,
  `node_host_name` varchar(255) NOT NULL,
  `node_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK33AE024CDBD621` (`access_key_id`),
  CONSTRAINT `FK33AE024CDBD621` FOREIGN KEY (`access_key_id`) REFERENCES `access_key` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table ocelli_grails.node: ~1 rows (approximately)
DELETE FROM `node`;
/*!40000 ALTER TABLE `node` DISABLE KEYS */;
INSERT INTO `node` (`id`, `version`, `access_key_id`, `node_description`, `node_host_name`, `node_name`) VALUES
	(1, 1, 1, 'Dev Box 1', 'ec2-54-187-127-192.us-west-2.compute.amazonaws.com', 'Server 1');
/*!40000 ALTER TABLE `node` ENABLE KEYS */;


-- Dumping structure for table ocelli_grails.node_artifact
CREATE TABLE IF NOT EXISTS `node_artifact` (
  `node_artifacts_id` bigint(20) DEFAULT NULL,
  `artifact_id` bigint(20) DEFAULT NULL,
  KEY `FK18CA2B6F9C636AC8` (`node_artifacts_id`),
  KEY `FK18CA2B6F48DE38EA` (`artifact_id`),
  CONSTRAINT `FK18CA2B6F48DE38EA` FOREIGN KEY (`artifact_id`) REFERENCES `artifact` (`id`),
  CONSTRAINT `FK18CA2B6F9C636AC8` FOREIGN KEY (`node_artifacts_id`) REFERENCES `node` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ocelli_grails.node_artifact: ~1 rows (approximately)
DELETE FROM `node_artifact`;
/*!40000 ALTER TABLE `node_artifact` DISABLE KEYS */;
INSERT INTO `node_artifact` (`node_artifacts_id`, `artifact_id`) VALUES
	(1, 1);
/*!40000 ALTER TABLE `node_artifact` ENABLE KEYS */;


-- Dumping structure for table ocelli_grails.profile
CREATE TABLE IF NOT EXISTS `profile` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `profile_desc` varchar(255) NOT NULL,
  `profile_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- Dumping data for table ocelli_grails.profile: ~2 rows (approximately)
DELETE FROM `profile`;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` (`id`, `version`, `profile_desc`, `profile_name`) VALUES
	(1, 1, 'Micks Dreeling\'s Profile', 'Mick - Dev Apps'),
	(2, 0, 'Micks Dreeling\'s Profile', 'Mick - Test Apps');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;


-- Dumping structure for table ocelli_grails.profile_application
CREATE TABLE IF NOT EXISTS `profile_application` (
  `profile_applications_id` bigint(20) DEFAULT NULL,
  `application_id` bigint(20) DEFAULT NULL,
  KEY `FKD318B7BA6631294A` (`application_id`),
  KEY `FKD318B7BA90874E5A` (`profile_applications_id`),
  CONSTRAINT `FKD318B7BA6631294A` FOREIGN KEY (`application_id`) REFERENCES `application` (`id`),
  CONSTRAINT `FKD318B7BA90874E5A` FOREIGN KEY (`profile_applications_id`) REFERENCES `profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ocelli_grails.profile_application: ~1 rows (approximately)
DELETE FROM `profile_application`;
/*!40000 ALTER TABLE `profile_application` DISABLE KEYS */;
INSERT INTO `profile_application` (`profile_applications_id`, `application_id`) VALUES
	(1, 1);
/*!40000 ALTER TABLE `profile_application` ENABLE KEYS */;


-- Dumping structure for table ocelli_grails.user
CREATE TABLE IF NOT EXISTS `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `date_created` datetime NOT NULL,
  `email` varchar(255) NOT NULL,
  `last_updated` datetime NOT NULL,
  `password` varchar(255) NOT NULL,
  `user_id` varchar(255) NOT NULL,
  `access_key_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK36EBCB5B657106` (`id`),
  KEY `FK36EBCB4CDBD621` (`access_key_id`),
  CONSTRAINT `FK36EBCB4CDBD621` FOREIGN KEY (`access_key_id`) REFERENCES `access_key` (`id`),
  CONSTRAINT `FK36EBCB5B657106` FOREIGN KEY (`id`) REFERENCES `access_key` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Dumping data for table ocelli_grails.user: ~1 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `version`, `date_created`, `email`, `last_updated`, `password`, `user_id`, `access_key_id`) VALUES
	(1, 3, '2014-05-27 23:26:21', 'mdreeling@riotgames.com', '2014-06-02 00:59:01', 'lithium', 'mdreeling', 2);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


-- Dumping structure for table ocelli_grails.user_profile
CREATE TABLE IF NOT EXISTS `user_profile` (
  `user_profiles_id` bigint(20) DEFAULT NULL,
  `profile_id` bigint(20) DEFAULT NULL,
  KEY `FK487E213541FE4B57` (`user_profiles_id`),
  KEY `FK487E2135AA7666AA` (`profile_id`),
  CONSTRAINT `FK487E213541FE4B57` FOREIGN KEY (`user_profiles_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK487E2135AA7666AA` FOREIGN KEY (`profile_id`) REFERENCES `profile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table ocelli_grails.user_profile: ~3 rows (approximately)
DELETE FROM `user_profile`;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` (`user_profiles_id`, `profile_id`) VALUES
	(1, 2),
	(1, 2),
	(1, 1);
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
