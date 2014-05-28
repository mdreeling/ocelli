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
-- Dumping data for table ocelli_grails.access_key: ~1 rows (approximately)
DELETE FROM `access_key`;
/*!40000 ALTER TABLE `access_key` DISABLE KEYS */;
INSERT INTO `access_key` (`id`, `version`, `access_key_type_id`, `data`, `principal`) VALUES
	(1, 0, 1, '-----BEGIN RSA PRIVATE KEY----- MIIEpQIBAAKCAQEA08BJ4I0WYdjMV6d9x8l8mrLMQj5rNKX/69YzkmqwrSD8QnJJno/KMnwvw73/ x1+jVBr0V5lGPNdQyUnCNDzPM8GNC4TXAPmAdhuNhNrmhW5OVB0hHPDjg4Dw/C+Vrk2LRCi3HtkP kBYn1Io+m5wQrNeMVmOdZ3Jsh1Am7UDBNH1MLwwvkwDVMBXr9PgBlwRZuQIlkEvk8mIeF8/KqZZR CdXBic8aXAIUOTzi6XuHl6c/RCWU6pn9o7gYcpcpLXpqnCE4EY+xt7VHQKzUiGB5D2RyMHyWYpsg E+dP0+e7ktIgC/hxDG86lcYGIzhz27jXvdcBjdkNmYUAg3DI+HtHSQIDAQABAoIBAQDD5ypyLRWA AOtMTRD5PVeiZ7jBsK3OT6WtssaTt1EtW08GymWB5NXUT0CBf86bzcd1kFpukMeCklGTaEHbwkaQ Q4kSFxwzMqG+o08SktKir6KX/zsbY2GZ0Dkjl4KLeAJYVLLWP0s+qsC+ygeSP5jNz71uT0rY4eu2 ZFkfNsGIpJLQTqDHO8IDmVGZVNbJuAIiZiFw2YgoYFyCUHawGW6Cc33LMh5R2RJ96omt/4mw/nrV OZ6wfyG/zQ3JYHXKigVteS7cwMzGq8YmSylbijIhySsyjnq2lkDRY6Fjmdqe7e77K5Waj+GlCjQm uZ4BZclf01Uk/bmOcfMigb8yjjQBAoGBAP5bifGDlILt7FqLKm4CPWxQlSyDCpwDKjD9DZS4glij SGd8A6wYuX6fjs+pfa21X09SxLbkm27UhCZPK9605xwETC8vG6lFdp9NK5Jt0WRzDh5xUHD9e5Bv Ro1/y2Uf8p1cJfeEiHyIFyYnefHllBQAxLZtkHdrs18pehktiEQRAoGBANUeUeb0/WykNFrZ83lx hLUF5T0M3vRHpVhE9aZRNVkwzbsRi1krPIqPMA2KD4SgjJdC3WN4NJep4j+HgmX0CHs/x6yc8MRa XJiszZArTC1RrMbPphgzTB2/KIh4iwAcKe5mEzBxr7N11jiCqT3abhV9hBpQ8eLE0s5KXx6h66e5 AoGANs4wfcp1MHTlbWj4/nUbGQCP8+RUX+NKrv2HdJkA9OpRyoJtJCK7rS3iDpqditU+sQ/LdQDz AMFnq/15HWZrOZ0vcSc8VY+zDIYLMmTZLkSgMS0HQSFNA4UGdayofaSRmRhm0dtLsVF9c2okG1v1 OQ4lVI1tCF47avC77zrhVpECgYEAn5otTAF9KLdwXfmLVQ+misr3elkBP3/IW+qI7R00Dq914vqo mQbAOCQzoHAcXv69SypQEgYbnNklDt600RWIpISHTMXbqbDiV5RR/f3u9qGL+vfXM5h3EG/wMwPT VSnCXT8kb8s0AfnljDyN8jx65K0zGWI1Q9aS6NrZkV9B1EECgYEArm2n29UoSJUT32BEGzopL3Cm 0y/7HCAyI0Brrx2VUsUkHtNRLxt/upxAjzX5JPN1l0T/zGzv6WfXfeM9Fir9VLG5ph32m0BHFetU eym8NJKM6dvGFC2phbLI2816duYxdUDNb1VH3+jqfGkl5IdCOq96TcBVvcSRiH1MOqVM7Ow= -----END RSA PRIVATE KEY-----', 'ec2-user');
/*!40000 ALTER TABLE `access_key` ENABLE KEYS */;

-- Dumping data for table ocelli_grails.access_key_type: ~1 rows (approximately)
DELETE FROM `access_key_type`;
/*!40000 ALTER TABLE `access_key_type` DISABLE KEYS */;
INSERT INTO `access_key_type` (`id`, `version`, `access_key_type_description`, `access_key_type_name`) VALUES
	(1, 0, 'SSH 2 Key', 'SSH2KEY');
/*!40000 ALTER TABLE `access_key_type` ENABLE KEYS */;

-- Dumping data for table ocelli_grails.application: ~1 rows (approximately)
DELETE FROM `application`;
/*!40000 ALTER TABLE `application` DISABLE KEYS */;
INSERT INTO `application` (`id`, `version`, `app_description`, `app_name`) VALUES
	(1, 2, 'Ocelli Server Application', 'Ocelli Server');
/*!40000 ALTER TABLE `application` ENABLE KEYS */;

-- Dumping data for table ocelli_grails.application_environment: ~2 rows (approximately)
DELETE FROM `application_environment`;
/*!40000 ALTER TABLE `application_environment` DISABLE KEYS */;
INSERT INTO `application_environment` (`application_environments_id`, `environment_id`) VALUES
	(1, 1),
	(1, 2);
/*!40000 ALTER TABLE `application_environment` ENABLE KEYS */;

-- Dumping data for table ocelli_grails.artifact: ~1 rows (approximately)
DELETE FROM `artifact`;
/*!40000 ALTER TABLE `artifact` DISABLE KEYS */;
INSERT INTO `artifact` (`id`, `version`, `artifact_location`, `artifact_type_id`) VALUES
	(1, 0, '/logs-a/SUSY.csv', 1);
/*!40000 ALTER TABLE `artifact` ENABLE KEYS */;

-- Dumping data for table ocelli_grails.artifact_type: ~1 rows (approximately)
DELETE FROM `artifact_type`;
/*!40000 ALTER TABLE `artifact_type` DISABLE KEYS */;
INSERT INTO `artifact_type` (`id`, `version`, `artifact_type_description`, `artifact_type_name`) VALUES
	(1, 0, 'Text Log File', 'Text Log');
/*!40000 ALTER TABLE `artifact_type` ENABLE KEYS */;

-- Dumping data for table ocelli_grails.environment: ~2 rows (approximately)
DELETE FROM `environment`;
/*!40000 ALTER TABLE `environment` DISABLE KEYS */;
INSERT INTO `environment` (`id`, `version`, `env_type_id`, `environment_description`, `environment_name`) VALUES
	(1, 1, 1, 'Ocelli Dev Environment on EC2', 'Ocelli Dev'),
	(2, 0, 2, 'Ocelli Test Environment', 'Ocelli Test');
/*!40000 ALTER TABLE `environment` ENABLE KEYS */;

-- Dumping data for table ocelli_grails.environment_node: ~1 rows (approximately)
DELETE FROM `environment_node`;
/*!40000 ALTER TABLE `environment_node` DISABLE KEYS */;
INSERT INTO `environment_node` (`environment_nodes_id`, `node_id`) VALUES
	(1, 1);
/*!40000 ALTER TABLE `environment_node` ENABLE KEYS */;

-- Dumping data for table ocelli_grails.environment_type: ~4 rows (approximately)
DELETE FROM `environment_type`;
/*!40000 ALTER TABLE `environment_type` DISABLE KEYS */;
INSERT INTO `environment_type` (`id`, `version`, `environment_type`, `environment_type_description`) VALUES
	(1, 0, 'DEVEL', 'Development'),
	(2, 0, 'TEST', 'Test Environment'),
	(3, 0, 'STAGE', 'Staging Environment'),
	(4, 0, 'PROD', 'Production Environment');
/*!40000 ALTER TABLE `environment_type` ENABLE KEYS */;

-- Dumping data for table ocelli_grails.node: ~1 rows (approximately)
DELETE FROM `node`;
/*!40000 ALTER TABLE `node` DISABLE KEYS */;
INSERT INTO `node` (`id`, `version`, `access_key_id`, `node_description`, `node_host_name`, `node_name`) VALUES
	(1, 1, 1, 'Dev Box 1', 'ec2-54-187-127-192.us-west-2.compute.amazonaws.com', 'Server 1');
/*!40000 ALTER TABLE `node` ENABLE KEYS */;

-- Dumping data for table ocelli_grails.node_artifact: ~1 rows (approximately)
DELETE FROM `node_artifact`;
/*!40000 ALTER TABLE `node_artifact` DISABLE KEYS */;
INSERT INTO `node_artifact` (`node_artifacts_id`, `artifact_id`) VALUES
	(1, 1);
/*!40000 ALTER TABLE `node_artifact` ENABLE KEYS */;

-- Dumping data for table ocelli_grails.profile: ~2 rows (approximately)
DELETE FROM `profile`;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` (`id`, `version`, `profile_desc`, `profile_name`) VALUES
	(1, 1, 'Micks Dreeling\'s Profile', 'Mick - Dev Apps'),
	(2, 0, 'Micks Dreeling\'s Profile', 'Mick - Test Apps');
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;

-- Dumping data for table ocelli_grails.profile_application: ~1 rows (approximately)
DELETE FROM `profile_application`;
/*!40000 ALTER TABLE `profile_application` DISABLE KEYS */;
INSERT INTO `profile_application` (`profile_applications_id`, `application_id`) VALUES
	(1, 1);
/*!40000 ALTER TABLE `profile_application` ENABLE KEYS */;

-- Dumping data for table ocelli_grails.user: ~1 rows (approximately)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `version`, `date_created`, `email`, `last_updated`, `password`, `user_id`) VALUES
	(1, 1, '2014-05-27 23:26:21', 'mdreeling@riotgames.com', '2014-05-27 23:26:26', 'lithium', 'mdreeling');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

-- Dumping data for table ocelli_grails.user_profile: ~1 rows (approximately)
DELETE FROM `user_profile`;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` (`user_profiles_id`, `profile_id`) VALUES
	(1, 1);
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
