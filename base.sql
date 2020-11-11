-- ============================================================
--   Nom de la base   :  Fédération sportive de Hand-ball                                
--   Nom de SGBD      :                      
--   Date de creation :  10/11/20  09:08                       
-- ============================================================


-- ============================================================
--   Table : JOUEUR                                            
-- ============================================================
create table JOUEUR
(
    NUMERO_LICENCE                   NUMBER(10)             not null,
    NOM_JOUEUR                       CHAR(20)               not null,
    PRENOM_JOUEUR                    CHAR(20)                       ,
    ADRESSE_JOUEUR                   CHAR(20)                       ,
    DATE_DE_NAISSANCE_JOUEUR         DATE                           ,
    constraint pk_joueur primary key (NUMERO_LICENCE)
);


-- ============================================================
--   Table : EQUIPE                                            
-- ============================================================

create table EQUIPE
(
    NUMERO_EQUIPE                   NUMBER(10)              not null,
    NOM_CATEGORIE                   CHAR(20)                not null,
    NUMERO_CATEGORIE                NUMBER(10)                      ,
    constraint pk_joueur primary key (NUMERO_EQUIPE)
);


-- ============================================================
--   Table : CLUB                                            
-- ============================================================

create table CLUB
(
    NUMERO_CLUB                     NUMBER(10)              not null,                 
    constraint pk_joueur primary key (NUMERO_CLUB)
);


-- ============================================================
--   Table : MEMBRE                                            
-- ============================================================

create table MEMBRE
(
    NUMERO_MEMBRE                   NUMBER(10)              not null,
    NOM_MEMBRE                      CHAR(20)                not null,
    PRENOM_MEMBRE                   CHAR(20)                        ,
    NUMERO_TEL_MEMBRE               CHAR(20)                        ,
    ADRESSE_MAIL_MEMBRE             CHAR(20)                        ,
    DATE_DE_NAISSANCE_MEMBRE        DATE                            ,
    ADRESSE_MEMBRE                  CHAR(20)                        ,                 
    constraint pk_joueur primary key (NUMERO_MEMBRE)
);


-- ============================================================
--   Table : ENTRAINEUR                                            
-- ============================================================

create table ENTRAINEUR
(
    NUMERO_ENTRAINEUR                NUMBER(10)             not null,
    NOM_ENTRAINEUR                   CHAR(20)               not null,
    PRENOM_ENTRAINEUR                CHAR(20)                       ,
    DATE_ENTREE_ENTRAINEUR           DATE                           ,
    constraint pk_joueur primary key (NUMERO_ENTRAINEUR)
);


-- ============================================================
--   Table : RENCONTRE                                            
-- ============================================================

create table RENCONTRE
(
    NUMERO_RENCONTRE                NUMBER(10)             not null,
    DATE_RENCONTRE                  DATE                           ,
    SCORE                           NUMBER(10)                     ,
    constraint pk_joueur primary key (NUMERO_RENCONTRE)
);

