CREATE TABLE Annee (
    ID_Annee INT PRIMARY KEY,
    annee INT
);

CREATE TABLE Mois (
    ID_Mois INT PRIMARY KEY,
    Mois DATETIME,
    ID_Annee INT,
    FOREIGN KEY (ID_Annee) REFERENCES Annee(ID_Annee)
);

CREATE TABLE JourSemaine (
    ID_JourSemaine INT PRIMARY KEY,
    JourSemaine INT,
    ID_Mois INT,
    FOREIGN KEY (ID_Mois) REFERENCES Mois(ID_Mois)
);

CREATE TABLE Date (
    ID_Date INT PRIMARY KEY,
    Date DATETIME,
    ID_JourSemaine INT,
    FOREIGN KEY (ID_JourSemaine) REFERENCES JourSemaine(ID_JourSemaine)
);

CREATE TABLE CategService (
    ID_CategService INT PRIMARY KEY,
    Nom_Categorie VARCHAR(100)
);

CREATE TABLE Service (
    ID_Service INT PRIMARY KEY,
    NomService VARCHAR(100),
    ID_CategService INT,
    FOREIGN KEY (ID_CategService) REFERENCES CategService(ID_CategService)
);

CREATE TABLE Medecin (
    ID_Medecin INT PRIMARY KEY,
    Nom VARCHAR(100),
    Numero VARCHAR(20)
);

CREATE TABLE Patient (
    ID_Patient INT PRIMARY KEY,
    Nom VARCHAR(50),
    Age INT,
    Tel INT,
    Sexe VARCHAR(10),
    Adresse VARCHAR(255)
);

CREATE TABLE FamilleMaladies (
    ID_FamilleMaladies INT PRIMARY KEY,
    Nom_Famille VARCHAR(100)
);

CREATE TABLE Maladie (
    ID_Maladie INT PRIMARY KEY,
    Nom VARCHAR(50),
    Gravite VARCHAR(50),
    Symptom VARCHAR(50),
    ID_FamilleMaladies INT,
    FOREIGN KEY (ID_FamilleMaladies) REFERENCES FamilleMaladies(ID_FamilleMaladies)
);

CREATE TABLE SatisfactionPatient (
    ID_Satisfaction INT PRIMARY KEY,
    SatisfConsult VARCHAR(50)
);

CREATE TABLE Consultation (
    ID_Consultation INT PRIMARY KEY,
    Cout_Consultation DECIMAL(10,2),
    ID_Service INT,
    ID_Patient INT,
    ID_Medecin INT,
    ID_Maladie INT,
    ID_Date INT,
    ID_Satisfaction INT,
    FOREIGN KEY (ID_Service) REFERENCES Service(ID_Service),
    FOREIGN KEY (ID_Patient) REFERENCES Patient(ID_Patient),
    FOREIGN KEY (ID_Medecin) REFERENCES Medecin(ID_Medecin),
    FOREIGN KEY (ID_Maladie) REFERENCES Maladie(ID_Maladie),
    FOREIGN KEY (ID_Date) REFERENCES Date(ID_Date),
    FOREIGN KEY (ID_Satisfaction) REFERENCES SatisfactionPatient(ID_Satisfaction)
);
