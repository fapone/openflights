CREATE DATABASE openflights;

CONNECT openflights;

DROP TABLE IF EXISTS `airlines`;
CREATE TABLE `airlines` (
  `name` text,
  `iata` varchar(2) default NULL,
  `icao` varchar(3) default NULL,
  `callsign` text,
  `country` text,
  `alid` int(11) NOT NULL auto_increment,
  `uid` int(11) default NULL,
  `alias` text,
  `mode` char(1) default 'F',
  `active` varchar(1) default 'N',
  PRIMARY KEY  (`alid`),
  KEY `iata` (`iata`),
  KEY `icao` (`icao`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `airports`;
CREATE TABLE `airports` (
  `name` text NOT NULL,
  `city` text,
  `country` text,
  `iata` varchar(3) default NULL,
  `icao` varchar(4) default NULL,
  `x` double NOT NULL,
  `y` double NOT NULL,
  `elevation` int(11) default NULL,
  `apid` int(11) NOT NULL auto_increment,
  `uid` int(11) default NULL,
  `timezone` float default NULL,
  `dst` char(1) default NULL,
  `tz_id` text,
  PRIMARY KEY  (`apid`),
  KEY `x` (`x`),
  KEY `y` (`y`),
  KEY `iata` (`iata`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
CREATE UNIQUE INDEX `iata_idx` ON airports(iata);
CREATE UNIQUE INDEX `icao_idx` ON airports(icao);

DROP TABLE IF EXISTS `countries`;
CREATE TABLE `countries` (
  `junk` text,
  `code` varchar(2) NOT NULL,
  `name` text,
  `oa_code` varchar(2) default NULL,
  `dst` char(1) default NULL,
  PRIMARY KEY  (`code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `planes`;
CREATE TABLE `planes` (
  `name` text,
  `abbr` text,
  `speed` double default NULL,
  `plid` int(11) NOT NULL auto_increment,
  `public` char(1) default NULL,
  PRIMARY KEY  (`plid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `routes`;
CREATE TABLE `routes` (
  `airline` varchar(3) default NULL,
  `alid` int(11) default NULL,
  `src_ap` varchar(4) default NULL,
  `src_apid` int(11) default NULL,
  `dst_ap` varchar(4) default NULL,
  `dst_apid` int(11) default NULL,
  `codeshare` text,
  `stops` text,
  `equipment` text,
  `added` varchar(1) default NULL,
  `rid` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`rid`),
  UNIQUE KEY `alid` (`alid`,`src_apid`,`dst_apid`),
  KEY `src_apid` (`src_apid`),
  KEY `dst_apid` (`dst_apid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

\! echo Done, next run sql/load-data.sql