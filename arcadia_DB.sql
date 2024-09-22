-- Active: 1725459962771@@127.0.0.1@3308@arcadia


CREATE TABLE roles (
role_id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
label VARCHAR(30) NOT NULL
);

CREATE TABLE utilisateurs (
    username VARCHAR(50) PRIMARY KEY NOT NULL,
    role_id INT(11) NOT NULL,
    FOREIGN KEY (role_id) REFERENCES roles(role_id),
    password VARCHAR(60) NOT NULL,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL
);


CREATE TABLE habitats (
    habitat_id INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nom VARCHAR(50) NOT NULL,
    description VARCHAR(50) NOT NULL,
    commentaire_habitat VARCHAR(50)
);

CREATE TABLE races (
    race_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    label VARCHAR(50) NOT NULL
);

CREATE TABLE animaux (
    animal_id INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    etat VARCHAR(50) NOT NULL,
    description TEXT,
    habitat_id INT(11) NOT NULL,
    race_id INT(11) NOT NULL,
    FOREIGN KEY (habitat_id) REFERENCES habitats(habitat_id),
    FOREIGN KEY (race_id) REFERENCES races(race_id)
);

CREATE TABLE rapports_veterinaires (
    rapport_veterinaire_id INT(11)PRIMARY KEY AUTO_INCREMENT NOT NULL,
    username VARCHAR(50) NOT NULL,
    animal_id INT(11) NOT NULL,
    FOREIGN KEY (username) REFERENCES utilisateurs(username) ON DELETE CASCADE,
    FOREIGN KEY (animal_id) REFERENCES animaux(animal_id) ON DELETE CASCADE,
    etat_animal VARCHAR(50) NOT NULL,
    nourriture_proposee VARCHAR(50) NOT NULL,
    grammage_nourriture INT(11) NOT NULL,
    date_passage DATE NOT NULL ,
    detail_etat_animal VARCHAR(50) 
);

CREATE TABLE services (
    service_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(255) NOT NULL,
    description TEXT NOT NULL
);
CREATE TABLE images (
    image_id INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    image_data BLOB NOT NULL,
    habitat_id INT, 
    animal_id INT,  
    service_id INT,
    FOREIGN KEY (habitat_id) REFERENCES habitats(habitat_id) ON DELETE CASCADE,
    FOREIGN KEY (animal_id) REFERENCES animaux(animal_id) ON DELETE CASCADE,
    FOREIGN KEY (service_id) REFERENCES services(service_id) ON DELETE CASCADE
);


CREATE TABLE avis (
    avis_id INT(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
    pseudo VARCHAR(50) NOT NULL,
    commentaire TEXT NOT NULL,
    isVisible BOOL NOT NULL
    );


    CREATE TABLE horaires_ouverture (
    horaire_id INT(11) AUTO_INCREMENT PRIMARY KEY,
    type_jour VARCHAR(50) NOT NULL,
    heure_ouverture VARCHAR(20) NOT NULL,
    heure_fermeture VARCHAR(20) NOT NULL
    );

    INSERT INTO roles (label) VALUES ('admin'),('employe'),('veterinaire');

    INSERT INTO habitats(nom, description) VALUES('La Savane', 'Un habitat spacieux imitant les plaines africaines, où éléphants, girafes, et gazelles vivent ensemble. Des rochers et quelques acacias décoratifs complètent ce paysage aride.');
    ALTER TABLE images MODIFY COLUMN image_data LONGBLOB;
    INSERT INTO races(label) VALUES('éléphant'),('girafe'),('gazelle'),('macaque'),('orangoutan'),('perroquet'),('loutre'),('tortue'),('heron pourpre');
    INSERT INTO horaires_ouverture (type_jour) VALUES ('L à V'), ('Week-end et feriés');