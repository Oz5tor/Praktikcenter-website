CREATE TABLE userProject(
userId int NOT NULL,
projectId int NOT NULL,
FOREIGN KEY (userId) REFERENCES user(id),
FOREIGN KEY (projectId) REFERENCES project(id)
)