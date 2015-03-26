CREATE TABLE rolesPermissions(
rolesId int NOT NULL,
permissionsId int NOT NULL,
FOREIGN KEY (rolesIdId) REFERENCES roles(id),
FOREIGN KEY (permissionsId) REFERENCES permissions(id)

)