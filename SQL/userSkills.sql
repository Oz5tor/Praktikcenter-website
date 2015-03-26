CREATE TABLE userSkills(
userId int NOT NULL,
skillId int NOT NULL,
FOREIGN KEY (userId) REFERENCES user(id),
FOREIGN KEY (skillId) REFERENCES skills(id)
)