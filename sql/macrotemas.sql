-- MySQL dump 9.09
--
-- Host: localhost    Database: papers
-- ------------------------------------------------------
-- Server version	4.0.16-log

--
-- Table structure for table `macrotemas`
--

CREATE TABLE macrotemas (
  cod int(10) unsigned NOT NULL auto_increment,
  tstamp timestamp(14) NOT NULL,
  titulo varchar(40) default NULL,
  titulo_en varchar(40) default NULL,
  descr text,
  descr_en text,
  espacos int not null default 0,
  PRIMARY KEY  (cod)
) TYPE=MyISAM;

--
-- Dumping data for table `macrotemas`
--

INSERT INTO macrotemas (cod, tstamp, titulo, titulo_en, descr, descr_en) VALUES (1,20040202190512,'Desenvolvimento','Development','Este tema engloba: linguagens de programa��o, ferramentas de desenvolvimento, linguagens de script, etc.','This theme includes: program languages, development tools, script languages, etc.');
INSERT INTO macrotemas (cod, tstamp, titulo, titulo_en, descr, descr_en) VALUES (2,20040202193214,'Bancos de Dados','Databases','Quest�es gerais sobre bancos de dados, comparativos, PostgreSQL, MySQL, Firebird, etc.','General issues about databases, like PostgreSQL, MySQL, Firebird, among others.');
INSERT INTO macrotemas (cod, tstamp, titulo, titulo_en, descr, descr_en) VALUES (3,20040202193346,'Desktop','Desktop','Este tema engloba softwares destinados � uso em desktop ex. gnome, openoffice.org, evolution, kde, blwm, windowmaker, mozilla, etc.','This theme includes softwares and projects to desktops, like Gnome, OpenOffice.org, KDE, Mozilla, among others.');
INSERT INTO macrotemas (cod, tstamp, titulo, titulo_en, descr, descr_en) VALUES (4,20040202193519,'Redes','Network','Servi�os de rede como qmail, postfix, ldap, radius, monitora��o, apache, tomcat, etc.','Network stuff, like Qmail, Postfix, LDAP, Radius, monitoring, servers, routing, etc.');
INSERT INTO macrotemas (cod, tstamp, titulo, titulo_en, descr, descr_en) VALUES (5,20040202193612,'Seguran�a','Security','Ferramentas de seguran�a, firewall, sistemas de detec��o de intrusos, pol�tica de seguran�a de sistemas, etc.','Security tools, firewall, intrusion detection, policies, crypto, etc.');
INSERT INTO macrotemas (cod, tstamp, titulo, titulo_en, descr, descr_en) VALUES (6,20040202193816,'Cases','Cases','Apresenta��o de projetos que usaram software livre, migra��es, ex: telecentros, migra��o da empresa X, etc.','Presentations of successful works where free software has been used, like migrations, etc.');
INSERT INTO macrotemas (cod, tstamp, titulo, titulo_en, descr, descr_en) VALUES (7,20040202194132,'Comunidade','Community','Projetos sociais relacionados � comunidade de software livre, como ONGs, grupos de usu�rios, etc.','Social projects linked to the free software community, like NGOs, users groups, etc.');
INSERT INTO macrotemas (cod, tstamp, titulo, titulo_en, descr, descr_en) VALUES (8,20040202194812,'Governos','Governments','Casos governamentais de implementa��o e uso de software livre, projetos de lei, plano de migra��o, estrat�gias e decis�es de governos sobre o software livre.','Government cases about free software implementation, projects of laws, migration plans, strategies and decisions about free software.');
INSERT INTO macrotemas (cod, tstamp, titulo, titulo_en, descr, descr_en) VALUES (9,20040202195606,'Pol�tica / Filosofia','Politics / Philosophy','Quest�es pol�ticas e filos�ficas em torno de software livre, como licenciamento, discuss�es n�o-t�cnicas, vantagens no uso do software livre, etc.','Political and philosophical issues around free software, like licensing, non-technical talks, advantages with the free software use, etc.');
INSERT INTO macrotemas (cod, tstamp, titulo, titulo_en, descr, descr_en) VALUES (10,20040202195731,'Inclus�o Social / Digital','Digital / Social Inclusion','Temas relacionados � inclus�o social e inclus�o digital: mulheres e software livre, software livre e inclus�o digital, etc.','Talks linked to digital and social inclusion, like free software and women, tele-centers, etc.');
INSERT INTO macrotemas (cod, tstamp, titulo, titulo_en, descr, descr_en) VALUES (11,20050508224900,'Organiza��o','Organization','Espa�o reservado � organiza��o do evento','Space reserved to the event\'s organization');

