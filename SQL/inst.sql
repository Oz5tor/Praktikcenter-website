CREATE TABLE inst(
studUserId int NOT NULL,
instUserId int NOT NULL,
FOREIGN KEY (studUserId) REFERENCES user(id),
FOREIGN KEY (instUserId) REFERENCES user(id)
)