#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------


#------------------------------------------------------------
# Table: ADMINISTRATOR
#------------------------------------------------------------

CREATE TABLE ADMINISTRATOR(
        Id_A            Int  Auto_increment  NOT NULL ,
        Login_A          Varchar (25) NOT NULL ,
        Password_A        Varchar (30) NOT NULL  
    ,PRIMARY KEY (Id_A)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: TYPE
#------------------------------------------------------------

CREATE TABLE TYPE(
        Id_T       Int  Auto_increment  NOT NULL ,
        Name_T     Enum ("Toit","Mur","Fenêtres","Porte","Terrain") NOT NULL
	,PRIMARY KEY (Id_T)
)ENGINE=InnoDB;

#------------------------------------------------------------
# Table: ELEMENT
#------------------------------------------------------------

CREATE TABLE ELEMENT(
        Id_E          Int  Auto_increment  NOT NULL ,
        Name_E         Varchar (50) NOT NULL ,
        Image_E         Varchar (50) NOT NULL ,
        Description_E   Text, 
        Id_type         Int NOT NULL 
	,PRIMARY KEY (Id_E) 
    ,FOREIGN KEY (Id_type) REFERENCES TYPE(Id_T)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: HOUSE
#------------------------------------------------------------

CREATE TABLE HOUSE(
        Id_H      Int Auto_increment NOT NULL ,
        Date_H    DATETIME DEFAULT CURRENT_TIMESTAMP
	,PRIMARY KEY (Id_H)

)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: INDICATOR
#------------------------------------------------------------

CREATE TABLE INDICATOR(
        Id_I       Int  Auto_increment  NOT NULL ,
        Name_I      Varchar (50) NOT NULL 
	,PRIMARY KEY (Id_I)
    
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: RELA_INDICATOR_ELEMENT
#------------------------------------------------------------

CREATE TABLE RELA_INDICATOR_ELEMENT(
        Id_I       Int NOT NULL ,
        Id_E       Int NOT NULL ,        
        Points     Int NOT NULL  
    ,PRIMARY KEY (Id_I, Id_E)
    ,FOREIGN KEY (Id_E) REFERENCES ELEMENT(Id_E)
    ,FOREIGN KEY (Id_I) REFERENCES INDICATOR(Id_I)
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: RELA_HOUSE_ELEMENT
#------------------------------------------------------------

CREATE TABLE RELA_HOUSE_ELEMENT(
        Id_H       Int NOT NULL ,
        Id_E       Int NOT NULL 
    ,PRIMARY KEY (Id_H, Id_E)
    ,FOREIGN KEY (Id_E) REFERENCES ELEMENT(Id_E)
    ,FOREIGN KEY (Id_H) REFERENCES HOUSE(Id_H)
)ENGINE=InnoDB;


#------------------------------------------------------------
# INSERT INTO
#------------------------------------------------------------

INSERT INTO `ADMINISTRATOR`(`Id_A`, `Login_A`, `Password_A`) 
VALUES (1,'admin','azerty');

/* -- Toit -- */
INSERT INTO TYPE (Id_T, Name_T)
VALUES (1, 'Toit');
INSERT INTO TYPE (Id_T, Name_T)
VALUES (2, 'Mur');
INSERT INTO TYPE (Id_T, Name_T)
VALUES (3, 'Fenêtres');
INSERT INTO TYPE (Id_T, Name_T)
VALUES (4, 'Porte');
INSERT INTO TYPE (Id_T, Name_T)
VALUES (5, 'Terrain');

/* -- Critères -- */
INSERT INTO INDICATOR (Id_I, Name_I)
VALUES (1, 'Esthétique');
INSERT INTO INDICATOR (Id_I, Name_I)
VALUES (2, 'Isolation thermique');
INSERT INTO INDICATOR (Id_I, Name_I)
VALUES (3, 'Isolation sonore');
INSERT INTO INDICATOR (Id_I, Name_I)
VALUES (4, 'Solidité');
INSERT INTO INDICATOR (Id_I, Name_I)
VALUES (5, 'Résistance au feu');
INSERT INTO INDICATOR (Id_I, Name_I)
VALUES (6, 'Etanchéité');
INSERT INTO INDICATOR (Id_I, Name_I)
VALUES (7, 'Luminosité');
INSERT INTO INDICATOR (Id_I, Name_I)
VALUES (8, 'Accessibilité');
INSERT INTO INDICATOR (Id_I, Name_I)
VALUES (9, 'Sécurité');

/* -- Eléments -- */
INSERT INTO ELEMENT (Id_E, Name_E, Image_E, Description_E, Id_type)
VALUES (1, 'Toit en béton', '"../images/Toit_en_beton.png"', 'Lorem ipsum dolor sit amet, consectetur adipiscing" elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 1);
INSERT INTO ELEMENT (Id_E, Name_E, Image_E, Description_E, Id_type)
VALUES (2, 'Toit de tuiles', '"../images/Toit_de_tuiles.png"', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 1);
INSERT INTO ELEMENT (Id_E, Name_E, Image_E, Description_E, Id_type)
VALUES (3, 'Toit en ardoises', '"../images/Toit_en_ardoises.png"', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 1);
INSERT INTO ELEMENT (Id_E, Name_E, Image_E, Description_E, Id_type)
VALUES (4, 'Toit en métal', '"../images/Toit_en_metal.png"', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 1);
INSERT INTO ELEMENT (Id_E, Name_E, Image_E, Description_E, Id_type)
VALUES (5, 'Toit en paille', '"../images/Toit_en_paille.png"', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 1);

INSERT INTO ELEMENT (Id_E, Name_E, Image_E, Description_E, Id_type)
VALUES (6, 'Mur en brique', '"../images/Mur_en_brique.png"', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 2);
INSERT INTO ELEMENT (Id_E, Name_E, Image_E, Description_E, Id_type)
VALUES (7, 'Mur en bois', '"../images/Mur_en_bois.png"', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 2);
INSERT INTO ELEMENT (Id_E, Name_E, Image_E, Description_E, Id_type)
VALUES (8, 'Mur en pierre', '"../images/Mur_en_pierre.png"', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 2);
INSERT INTO ELEMENT (Id_E, Name_E, Image_E, Description_E, Id_type)
VALUES (9, 'Mur en paille', '"../images/Mur_en_paille.png"', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 2);

INSERT INTO ELEMENT (Id_E, Name_E, Image_E, Description_E, Id_type)
VALUES (10, 'Double vitrage', '"../images/Double_vitrage.png"', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 3);
INSERT INTO ELEMENT (Id_E, Name_E, Image_E, Description_E, Id_type)
VALUES (11, 'Vitraux', '"../images/Vitraux.png"', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 3);
INSERT INTO ELEMENT (Id_E, Name_E, Image_E, Description_E, Id_type)
VALUES (12, 'Fenêtre à barreaux', '"../images/Fenetre_a_barreaux.png"', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 3);

INSERT INTO ELEMENT (Id_E, Name_E, Image_E, Description_E, Id_type)
VALUES (13, 'Porte blindée', '"../images/Porte_blindee.png"', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 4);
INSERT INTO ELEMENT (Id_E, Name_E, Image_E, Description_E, Id_type)
VALUES (14, 'Porte en bois', '"../images/Porte_en_bois.png"', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 4);
INSERT INTO ELEMENT (Id_E, Name_E, Image_E, Description_E, Id_type)
VALUES (15, 'Porte en PVC', '"../images/Porte_en_PVC.png"', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 4);
INSERT INTO ELEMENT (Id_E, Name_E, Image_E, Description_E, Id_type)
VALUES (16, 'Porte en verre', '"../images/Porte_en_verre.png"', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 4);

INSERT INTO ELEMENT (Id_E, Name_E, Image_E, Description_E, Id_type)
VALUES (17, 'Maison sur pilotis', '"../images/Maison_sur_pilotis.png"', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 5);
INSERT INTO ELEMENT (Id_E, Name_E, Image_E, Description_E, Id_type)
VALUES (18, 'Maison dans la forêt', '"../images/Maison_dans_la_foret.png"', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 5);
INSERT INTO ELEMENT (Id_E, Name_E, Image_E, Description_E, Id_type)
VALUES (19, 'Maison de ville', '"../images/Maison_de_ville.png"', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 5);
INSERT INTO ELEMENT (Id_E, Name_E, Image_E, Description_E, Id_type)
VALUES (20, 'Maison en montagne', '"../images/Maison_en_montagne.png"', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', 5);

/* -- Points d'estétique -- */

INSERT INTO `rela_indicator_element` (`Id_I`, `Id_E`, `Points`) VALUES
(1, 1, 3),
(1, 2, 6),
(1, 3, 4),
(1, 4, 2),
(1, 5, 6),
(1, 6, 6),
(1, 7, 8),
(1, 8, 5),
(1, 9, 3),
(1, 10, 5),
(1, 11, 7),
(1, 12, 1),
(1, 13, 2),
(1, 14, 6),
(1, 15, 3),
(1, 16, 7),
(1, 17, 5),
(1, 18, 8),
(1, 19, 3),
(1, 20, 6),
(2, 1, 7),
(2, 2, 3),
(2, 3, 3),
(2, 4, 1),
(2, 5, 6),
(2, 6, 7),
(2, 7, 4),
(2, 8, 7),
(2, 9, 5),
(2, 10, 8),
(2, 11, 4),
(2, 12, 4),
(2, 13, 7),
(2, 14, 4),
(2, 15, 5),
(2, 16, 4),
(2, 17, 0),
(2, 18, 0),
(2, 19, 0),
(2, 20, 0),
(3, 1, 7),
(3, 2, 2),
(3, 3, 2),
(3, 4, 2),
(3, 5, 2),
(3, 6, 6),
(3, 7, 4),
(3, 8, 7),
(3, 9, 2),
(3, 10, 7),
(3, 11, 3),
(3, 12, 3),
(3, 13, 6),
(3, 14, 3),
(3, 15, 3),
(3, 16, 5),
(3, 17, 0),
(3, 18, 0),
(3, 19, 0),
(3, 20, 0),
(4, 1, 0),
(4, 2, 0),
(4, 3, 0),
(4, 4, 0),
(4, 5, 0),
(4, 6, 7),
(4, 7, 4),
(4, 8, 9),
(4, 9, 2),
(4, 10, 0),
(4, 11, 0),
(4, 12, 0),
(4, 13, 0),
(4, 14, 0),
(4, 15, 0),
(4, 16, 0),
(4, 17, 3),
(4, 18, 4),
(4, 19, 5),
(4, 20, 8),
(5, 1, 9),
(5, 2, 5),
(5, 3, 5),
(5, 4, 6),
(5, 5, 1),
(5, 6, 7),
(5, 7, 2),
(5, 8, 9),
(5, 9, 0),
(5, 10, 0),
(5, 11, 0),
(5, 12, 0),
(5, 13, 0),
(5, 14, 0),
(5, 15, 0),
(5, 16, 0),
(5, 17, 7),
(5, 18, 2),
(5, 19, 5),
(5, 20, 5),
(6, 1, 9),
(6, 2, 8),
(6, 3, 8),
(6, 4, 8),
(6, 5, 5),
(6, 6, 7),
(6, 7, 4),
(6, 8, 7),
(6, 9, 2),
(6, 10, 0),
(6, 11, 0),
(6, 12, 0),
(6, 13, 0),
(6, 14, 0),
(6, 15, 0),
(6, 16, 0),
(6, 17, 2),
(6, 18, 5),
(6, 19, 5),
(6, 20, 5),
(7, 1, 0),
(7, 2, 0),
(7, 3, 0),
(7, 4, 0),
(7, 5, 0),
(7, 6, 0),
(7, 7, 0),
(7, 8, 0),
(7, 9, 0),
(7, 10, 7),
(7, 11, 4),
(7, 12, 5),
(7, 13, 0),
(7, 14, 0),
(7, 15, 0),
(7, 16, 0),
(7, 17, 0),
(7, 18, 0),
(7, 19, 0),
(7, 20, 0),
(8, 1, 0),
(8, 2, 0),
(8, 3, 0),
(8, 4, 0),
(8, 5, 0),
(8, 6, 0),
(8, 7, 0),
(8, 8, 0),
(8, 9, 0),
(8, 10, 0),
(8, 11, 0),
(8, 12, 0),
(8, 13, 3),
(8, 14, 5),
(8, 15, 6),
(8, 16, 6),
(8, 17, 2),
(8, 18, 4),
(8, 19, 7),
(8, 20, 2),
(9, 1, 0),
(9, 2, 0),
(9, 3, 0),
(9, 4, 0),
(9, 5, 0),
(9, 6, 7),
(9, 7, 4),
(9, 8, 9),
(9, 9, 1),
(9, 10, 4),
(9, 11, 2),
(9, 12, 8),
(9, 13, 8),
(9, 14, 5),
(9, 15, 3),
(9, 16, 2),
(9, 17, 7),
(9, 18, 4),
(9, 19, 3),
(9, 20, 7);



