CREATE TABLE equipment(
name varchar(45) NOT NULL,
sn varchar(100) NOT NULL,
fk_prodId int NOT NULL,
fk_eqTypeId int NOT NULL,
spec text,
PRIMARY KEY (sn, fk_prodId),
FOREIGN KEY (fk_prodId) REFERENCES project(id),
FOREIGN KEY (fk_eqTypeId) REFERENCES eqtype(id)
)