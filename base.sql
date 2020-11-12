-- ============================================================
--   Nom de la base   :  Fédération sportive de Hand-ball                                
--   Nom de SGBD      :  ORACLE Version 7.0                    
--   Date de creation :  10/11/20  09:08                       
-- ============================================================

drop table JOUEUR cascade constraints;

drop table EQUIPE cascade constraints;

drop table CLUB cascade constraints;

drop table MEMBRE cascade constraints;

drop table ENTRAINEUR cascade constraints;

drop table RENCONTRE cascade constraints;

drop table Entrainer cascade constraints;

drop table Participer cascade constraints;

drop table Effectuer cascade constraints;

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
    constraint pk_equipe primary key (NUMERO_EQUIPE)
);


-- ============================================================
--   Table : CLUB                                            
-- ============================================================

create table CLUB
(
    NUMERO_CLUB                     NUMBER(10)              not null,                              
    constraint pk_club primary key (NUMERO_CLUB)
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
    POSTE                           CHAR(20)                        ,                 
    constraint pk_membre primary key (NUMERO_MEMBRE)
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
    constraint pk_entraineur primary key (NUMERO_ENTRAINEUR)
);


-- ============================================================
--   Table : RENCONTRE                                            
-- ============================================================

create table RENCONTRE
(
    NUMERO_RENCONTRE                NUMBER(10)             not null,
    DATE_RENCONTRE                  DATE                           ,
    SCORE                           NUMBER(10)                     ,
    constraint pk_rencontre primary key (NUMERO_RENCONTRE)
);

-- ============================================================
--   Table : Entrainer                                            
-- ============================================================

create table Entrainer
(
    NUMERO_EQUIPE                   NUMBER(10)              not null,
    NUMERO_ENTRAINEUR               NUMBER(10)              not null,
    DATE_ENTREE_EQUIPE              DATE                            ,
    constraint pk_entrainer primary key (NUMERO_EQUIPE, NUMERO_ENTRAINEUR)
);

-- ============================================================
--   Table : Participer                                            
-- ============================================================

create table Participer
(
    NUMERO_EQUIPE                   NUMBER(10)              not null,
    NUMERO_RENCONTRE                NUMBER(10)              not null,                         ,
    constraint pk_participer primary key (NUMERO_EQUIPE, NUMERO_RENCONTRE)
);

-- ============================================================
--   Table : Effectuer                                            
-- ============================================================

create table Effectuer
(
    NUMERO_LICENCE                  NUMBER(10)              not null,
    NUMERO_RENCONTRE                NUMBER(10)              not null, 
    NOMBRE_POINTS_MARQUES           NUMBER(10)                      ,
    NOMBRE_FAUTES                   NUMBER(10)                      ,
    constraint pk_effectuer primary key (NUMERO_LICENCE, NUMERO_RENCONTRE)
);

alter table MEMBRE 
    add constraint fk_NUMERO_MEMBRE_CLUB foreign key (NUMERO_CLUB) 
    references  CLUB (NUMERO_CLUB);

alter table CLUB 
    add constraint fk_NUMERO_CLUB_LICENCE foreign key (NUMERO_LICENCE) 
    references  JOUEUR (NUMERO_LICENCE);

alter table JOUEUR 
    add constraint fk_NUMERO_JOUEUR_EQUIPE foreign key (NUMERO_EQUIPE) 
    references  EQUIPE (NUMERO_EQUIPE);

alter table EQUIPE 
    add constraint fk_NUMERO_EQUIPE_CLUB foreign key (NUMERO_CLUB) 
    references  CLUB (NUMERO_CLUB);

alter table Entrainer 
    add constraint fk_NUMERO_Entrainer_EQUIPE foreign key (NUMERO_EQUIPE) 
    references  EQUIPE (NUMERO_EQUIPE);
alter table Entrainer 
    add constraint fk_NUMERO_Entrainer_ENTRAINEUR foreign key (NUMERO_ENTRAINEUR) 
    references  ENTRAINEUR (NUMERO_ENTRAINEUR);

alter table Participer 
    add constraint fk_NUMERO_Participer_EQUIPE foreign key (NUMERO_EQUIPE) 
    references  EQUIPE (NUMERO_EQUIPE);
alter table Participer 
    add constraint fk_NUMERO_Participer_RENCONTRE foreign key (NUMERO_RENCONTRE) 
    references  RENCONTRE (NUMERO_RENCONTRE);

alter table Effectuer 
    add constraint fk_NUMERO_Effectuer_LICENCE foreign key (NUMERO_LICENCE) 
    references  JOUEUR (NUMERO_LICENCE);
alter table Effectuer 
    add constraint fk_NUMERO_Effectuer_RENCONTRE foreign key (NUMERO_RENCONTRE) 
    references  RENCONTRE (NUMERO_RENCONTRE);


