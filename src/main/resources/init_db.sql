CREATE SCHEMA `taxi_service` DEFAULT CHARACTER SET utf8;

CREATE TABLE `cars`
(
    `id`              bigint       NOT NULL AUTO_INCREMENT,
    `car_name`        varchar(100) NOT NULL,
    `manufacturer_id` bigint  DEFAULT NULL,
    `deleted`         tinyint DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `manufacturer_id` (`manufacturer_id`),
    CONSTRAINT `cars_ibfk_1` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturers` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `drivers`
(
    `id`             bigint       NOT NULL AUTO_INCREMENT,
    `driver_name`    varchar(100) NOT NULL,
    `license_number` varchar(100) NOT NULL,
    `deleted`        tinyint(1)   NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

CREATE TABLE `manufacturers`
(
    `id`                   bigint       NOT NULL AUTO_INCREMENT,
    `manufacturer_name`    varchar(100) NOT NULL,
    `manufacturer_country` varchar(100) NOT NULL,
    `deleted`              tinyint(1)   NOT NULL DEFAULT '0',
    PRIMARY KEY (`id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  DEFAULT CHARSET = utf8;

CREATE TABLE `cars_drivers`
(
    `driver_id` bigint NOT NULL AUTO_INCREMENT,
    `car_id`    bigint DEFAULT NULL,
    KEY `driver_id` (`driver_id`),
    KEY `car_id` (`car_id`),
    CONSTRAINT `cars_drivers_ibfk_1` FOREIGN KEY (`driver_id`) REFERENCES `drivers` (`id`),
    CONSTRAINT `cars_drivers_ibfk_2` FOREIGN KEY (`car_id`) REFERENCES `cars` (`id`)
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;
