CREATE TABLE userRoles(
userId int NOT NULL,
roleId int NOT NULL,
FOREIGN KEY (userId) REFERENCES user(id),
FOREIGN KEY (roleId) REFERENCES roles(id)
)