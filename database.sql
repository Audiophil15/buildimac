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
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (1, 1, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (1, 2, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (1, 3, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (1, 4, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (1, 5, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (1, 6, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (1, 7, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (1, 8, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (1, 9, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (1, 10, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (1, 11, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (1, 12, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (1, 13, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (1, 14, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (1, 15, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (1, 16, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (1, 17, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (1, 18, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (1, 19, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (1, 20, 2);

/* -- Points disolation thermique -- */
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (2, 1, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (2, 2, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (2, 3, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (2, 4, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (2, 5, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (2, 6, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (2, 7, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (2, 8, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (2, 9, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (2, 10, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (2, 11, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (2, 12, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (2, 13, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (2, 14, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (2, 15, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (2, 16, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (2, 17, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (2, 18, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (2, 19, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (2, 20, 2);

/* -- Points disolation sonore -- */
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (3, 1, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (3, 2, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (3, 3, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (3, 4, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (3, 5, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (3, 6, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (3, 7, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (3, 8, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (3, 9, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (3, 10, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (3, 11, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (3, 12, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (3, 13, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (3, 14, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (3, 15, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (3, 16, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (3, 17, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (3, 18, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (3, 19, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (3, 20, 2);


/* -- Points de solitidé -- */
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (4, 1, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (4, 2, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (4, 3, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (4, 4, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (4, 5, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (4, 6, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (4, 7, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (4, 8, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (4, 9, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (4, 10, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (4, 11, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (4, 12, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (4, 13, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (4, 14, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (4, 15, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (4, 16, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (4, 17, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (4, 18, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (4, 19, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (4, 20, 2);

/* -- Points de résistance au feu -- */
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (5, 1, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (5, 2, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (5, 3, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (5, 4, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (5, 5, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (5, 6, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (5, 7, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (5, 8, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (5, 9, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (5, 10, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (5, 11, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (5, 12, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (5, 13, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (5, 14, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (5, 15, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (5, 16, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (5, 17, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (5, 18, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (5, 19, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (5, 20, 2);

/* -- Points d'étanchéité -- */
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (6, 1, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (6, 2, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (6, 3, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (6, 4, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (6, 5, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (6, 6, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (6, 7, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (6, 8, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (6, 9, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (6, 10, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (6, 11, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (6, 12, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (6, 13, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (6, 14, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (6, 15, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (6, 16, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (6, 17, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (6, 18, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (6, 19, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (6, 20, 2);

/* -- Points de luminosité -- */
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (7, 1, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (7, 2, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (7, 3, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (7, 4, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (7, 5, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (7, 6, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (7, 7, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (7, 8, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (7, 9, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (7, 10, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (7, 11, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (7, 12, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (7, 13, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (7, 14, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (7, 15, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (7, 16, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (7, 17, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (7, 18, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (7, 19, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (7, 20, 2);

/* -- Points d'accessibilité' -- */
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (8, 1, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (8, 2, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (8, 3, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (8, 4, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (8, 5, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (8, 6, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (8, 7, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (8, 8, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (8, 9, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (8, 10, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (8, 11, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (8, 12, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (8, 13, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (8, 14, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (8, 15, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (8, 16, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (8, 17, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (8, 18, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (8, 19, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (8, 20, 2);

/* -- Points de sécurité -- */
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (9, 1, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (9, 2, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (9, 3, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (9, 4, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (9, 5, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (9, 6, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (9, 7, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (9, 8, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (9, 9, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (9, 10, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (9, 11, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (9, 12, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (9, 13, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (9, 14, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (9, 15, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (9, 16, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (9, 17, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (9, 18, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (9, 19, 2);
INSERT INTO RELA_INDICATOR_ELEMENT (Id_I, Id_E, Points)
VALUES (9, 20, 2);

