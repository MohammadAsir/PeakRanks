--------------------------------------------------------------------------------
-- 1) Games
--------------------------------------------------------------------------------
INSERT INTO Game (id, title, description) VALUES
  (1, 'CS:GO',               'Counter-Strike: Global Offensive'),
  (2, 'League of Legends',   'MOBA by Riot Games'),
  (3, 'Rainbow Six Siege',   'Ubisoft tactical shooter'),
  (4, 'Valorant',            '5v5 tactical shooter by Riot'),
  (5, 'Overwatch',           'Team-based shooter by Blizzard'),
  (6, 'Deadlock',            'MOBA/shooter by Valve');

--------------------------------------------------------------------------------
-- 2) Ranks for each game
--------------------------------------------------------------------------------
INSERT INTO Rank (id, gameId, rankName, rankOrder) VALUES
  -- Deadlock (6)
  (1,6,'Initiate I',1),   (2,6,'Initiate II',2),  (3,6,'Initiate III',3),
  (4,6,'Initiate IV',4),  (5,6,'Initiate V',5),   (6,6,'Initiate VI',6),
  (7,6,'Seeker I',7),     (8,6,'Seeker II',8),    (9,6,'Seeker III',9),
  (10,6,'Seeker IV',10),  (11,6,'Seeker V',11),   (12,6,'Seeker VI',12),
  (13,6,'Alchemist I',13),(14,6,'Alchemist II',14),(15,6,'Alchemist III',15),
  (16,6,'Alchemist IV',16),(17,6,'Alchemist V',17),(18,6,'Alchemist VI',18),
  (19,6,'Arcanist I',19), (20,6,'Arcanist II',20), (21,6,'Arcanist III',21),
  (22,6,'Arcanist IV',22),(23,6,'Arcanist V',23), (24,6,'Arcanist VI',24),
  (25,6,'Ritualist I',25),(26,6,'Ritualist II',26),(27,6,'Ritualist III',27),
  (28,6,'Ritualist IV',28),(29,6,'Ritualist V',29),(30,6,'Ritualist VI',30),
  (31,6,'Emissary I',31), (32,6,'Emissary II',32), (33,6,'Emissary III',33),
  (34,6,'Emissary IV',34),(35,6,'Emissary V',35), (36,6,'Emissary VI',36),
  (37,6,'Archon I',37),   (38,6,'Archon II',38),   (39,6,'Archon III',39),
  (40,6,'Archon IV',40),  (41,6,'Archon V',41),    (42,6,'Archon VI',42),
  (43,6,'Oracle I',43),   (44,6,'Oracle II',44),   (45,6,'Oracle III',45),
  (46,6,'Oracle IV',46),  (47,6,'Oracle V',47),    (48,6,'Oracle VI',48),
  (49,6,'Phantom I',49),  (50,6,'Phantom II',50),  (51,6,'Phantom III',51),
  (52,6,'Phantom IV',52), (53,6,'Phantom V',53),   (54,6,'Phantom VI',54),
  (55,6,'Ascendant I',55),(56,6,'Ascendant II',56),(57,6,'Ascendant III',57),
  (58,6,'Ascendant IV',58),(59,6,'Ascendant V',59), (60,6,'Ascendant VI',60),
  (61,6,'Eternus I',61),  (62,6,'Eternus II',62),  (63,6,'Eternus III',63),
  (64,6,'Eternus IV',64), (65,6,'Eternus V',65),   (66,6,'Eternus VI',66),

  -- Overwatch (5)
  (67,5,'Bronze',1), (68,5,'Silver',2), (69,5,'Gold',3),
  (70,5,'Platinum',4), (71,5,'Diamond',5), (72,5,'Master',6),
  (73,5,'Grandmaster',7),

  -- Rainbow Six Siege (3)
  (74,3,'Copper IV',1),  (75,3,'Copper III',2), (76,3,'Copper II',3),
  (77,3,'Copper I',4),   (78,3,'Bronze IV',5),  (79,3,'Bronze III',6),
  (80,3,'Bronze II',7),   (81,3,'Bronze I',8),   (82,3,'Silver IV',9),
  (83,3,'Silver III',10), (84,3,'Silver II',11), (85,3,'Silver I',12),
  (86,3,'Gold IV',13),    (87,3,'Gold III',14),  (88,3,'Gold II',15),
  (89,3,'Gold I',16),     (90,3,'Platinum IV',17),(91,3,'Platinum III',18),
  (92,3,'Platinum II',19),(93,3,'Platinum I',20),(94,3,'Diamond',21),
  (95,3,'Champion',22),

  -- Valorant (4)
  (96,4,'Iron 1',1),   (97,4,'Iron 2',2),   (98,4,'Iron 3',3),
  (99,4,'Bronze 1',4), (100,4,'Bronze 2',5), (101,4,'Bronze 3',6),
  (102,4,'Silver 1',7),(103,4,'Silver 2',8),(104,4,'Silver 3',9),
  (105,4,'Gold 1',10), (106,4,'Gold 2',11), (107,4,'Gold 3',12),
  (108,4,'Platinum 1',13),(109,4,'Platinum 2',14),(110,4,'Platinum 3',15),
  (111,4,'Diamond 1',16),(112,4,'Diamond 2',17),(113,4,'Diamond 3',18),
  (114,4,'Immortal 1',19),(115,4,'Immortal 2',20),(116,4,'Immortal 3',21),
  (117,4,'Radiant',22),

  -- CS:GO (1)
  (118,1,'Silver I',1),    (119,1,'Silver II',2),  (120,1,'Silver III',3),
  (121,1,'Silver IV',4),   (122,1,'Silver Elite',5),(123,1,'Silver Elite Master',6),
  (124,1,'Gold Nova I',7), (125,1,'Gold Nova II',8),(126,1,'Gold Nova III',9),
  (127,1,'Gold Nova Master',10),(128,1,'Master Guardian I',11),(129,1,'Master Guardian II',12),
  (130,1,'Master Guardian Elite',13),(131,1,'Distinguished Master Guardian',14),
  (132,1,'Legendary Eagle',15),(133,1,'Legendary Eagle Master',16),
  (134,1,'Supreme Master First Class',17),(135,1,'Global Elite',18),

  -- League of Legends (2)
  (200,2,'Iron IV',1),(201,2,'Iron III',2),(202,2,'Iron II',3),
  (203,2,'Iron I',4),(204,2,'Bronze IV',5),(205,2,'Bronze III',6),
  (206,2,'Bronze II',7),(207,2,'Bronze I',8),(208,2,'Silver IV',9),
  (209,2,'Silver III',10),(210,2,'Silver II',11),(211,2,'Silver I',12),
  (212,2,'Gold IV',13),(213,2,'Gold III',14),(214,2,'Gold II',15),
  (215,2,'Gold I',16),(216,2,'Platinum IV',17),(217,2,'Platinum III',18),
  (218,2,'Platinum II',19),(219,2,'Platinum I',20),(220,2,'Diamond IV',21),
  (221,2,'Diamond III',22),(222,2,'Diamond II',23),(223,2,'Diamond I',24),
  (224,2,'Master',25),(225,2,'Grandmaster',26),(226,2,'Challenger',27);

--------------------------------------------------------------------------------
-- 3) Users
--------------------------------------------------------------------------------
INSERT INTO "User" (id, username, email, password, dateJoined, teamId) VALUES
  (1,'user1','user1@peakranks.com','pass1','2024-01-01',NULL),
  (2,'user2','user2@peakranks.com','pass2','2024-02-02',NULL),
  (3,'user3','user3@peakranks.com','pass3','2024-03-03',NULL),
  (4,'user4','user4@peakranks.com','pass4','2024-04-04',NULL),
  (5,'user5','user5@peakranks.com','pass5','2024-05-05',NULL),
  (6,'user6','user6@peakranks.com','pass6','2024-06-06',NULL),
  (7,'user7','user7@peakranks.com','pass7','2024-07-07',NULL),
  (8,'user8','user8@peakranks.com','pass8','2024-08-08',NULL),
  (9,'user9','user9@peakranks.com','pass9','2024-09-09',NULL),
  (10,'user10','user10@peakranks.com','pass10','2024-10-10',NULL),
  (11,'user11','user11@peakranks.com','pass11','2024-11-11',NULL),
  (12,'user12','user12@peakranks.com','pass12','2024-12-12',NULL),
  (13,'user13','user13@peakranks.com','pass13','2024-01-13',NULL),
  (14,'user14','user14@peakranks.com','pass14','2024-02-14',NULL),
  (15,'user15','user15@peakranks.com','pass15','2024-03-15',NULL),
  (16,'user16','user16@peakranks.com','pass16','2024-04-16',NULL),
  (17,'user17','user17@peakranks.com','pass17','2024-05-17',NULL),
  (18,'user18','user18@peakranks.com','pass18','2024-06-18',NULL),
  (19,'user19','user19@peakranks.com','pass19','2024-07-19',NULL),
  (20,'user20','user20@peakranks.com','pass20','2024-08-20',NULL),
  (21,'user21','user21@peakranks.com','pass21','2024-09-21',NULL),
  (22,'user22','user22@peakranks.com','pass22','2024-10-22',NULL),
  (23,'user23','user23@peakranks.com','pass23','2024-11-23',NULL),
  (24,'user24','user24@peakranks.com','pass24','2024-12-24',NULL),
  (25,'user25','user25@peakranks.com','pass25','2024-01-25',NULL);

--------------------------------------------------------------------------------
-- 4) Teams
--------------------------------------------------------------------------------
INSERT INTO Team (id, teamName, description, createdByUserId) VALUES
  (1,'Team Alpha','team with users 1–5',1),
  (2,'Team Beta','team with users 6–9',6);

UPDATE "User" SET teamId = 1 WHERE id BETWEEN 1 AND 5;
UPDATE "User" SET teamId = 2 WHERE id BETWEEN 6 AND 9;

--------------------------------------------------------------------------------
-- 5) Badges & awards
--------------------------------------------------------------------------------
INSERT INTO Badge (id, badgeName, description, iconUrl) VALUES
  (1,'Global Elite','Reached Global Elite in CS:GO','/icons/global_elite.png'),
  (2,'Challenger','Reached Challenger rank in League','/icons/challenger.png'),
  (3,'Master Collector','Recorded peak ranks in all 6 games','/icons/collector.png'),
  (4,'Deadlock Eternus','Reached Eternus VI in Deadlock','/icons/eternus_vi.png');

INSERT INTO UserBadge (userId, badgeId) VALUES
  (1,1),(1,2),(1,3),(1,4),
  (2,1),
  (3,2),(3,3),
  (6,4),
  (10,3);

--------------------------------------------------------------------------------
-- 6) Game Accounts
--------------------------------------------------------------------------------
INSERT INTO GameAccount (id, userId, gameId, accountUsername) VALUES
  (1,1,1,'user1_steam'),
  (2,1,2,'AetherGhost'),
  (3,2,1,'Elite2CSGO'),
  (4,2,4,'Viper2'),
  (5,3,6,'DeadlockKing'),
  (6,4,5,'OWL4Life'),
  (7,5,3,'SiegeMaster5'),
  (8,6,4,'Sharpshooter6'),
  (9,7,2,'Summoner7'),
  (10,8,5,'Zenyatta8'),
  (11,9,1,'Arcanist9'),
  (12,10,6,'Eternus10'),
  (13,11,3,'Copper11'),
  (14,12,2,'Iron12'),
  (15,13,4,'Immortal13'),
  (16,14,5,'Phantom14'),
  (17,15,1,'GoldNova15'),
  (18,16,6,'Master16'),
  (19,17,4,'Radiant17'),
  (20,18,3,'Platinum18'),
  (21,19,5,'Hero19'),
  (22,20,2,'Grandmaster20'),
  (23,21,1,'Seeker21'),
  (24,22,4,'Immortal22'),
  (25,23,6,'Challenger23'),
  (26,24,5,'Master24'),
  (27,25,3,'Champion25');

--------------------------------------------------------------------------------
-- 7) Friendships
--------------------------------------------------------------------------------
INSERT INTO Friendship (id, userId, friendId, status) VALUES
  (1,1,2,'accepted'),
  (2,1,3,'pending'),
  (3,2,3,'accepted'),
  (4,4,5,'accepted'),
  (5,5,6,'blocked'),
  (6,7,8,'accepted'),
  (7,8,9,'accepted'),
  (8,10,11,'pending'),
  (9,12,13,'accepted'),
  (10,14,15,'accepted'),
  (11,16,17,'accepted'),
  (12,18,19,'blocked'),
  (13,20,21,'accepted'),
  (14,22,23,'accepted'),
  (15,24,25,'pending');

--------------------------------------------------------------------------------
-- 8) Peak Records
--------------------------------------------------------------------------------
INSERT INTO PeakRecord (id, userId, gameId, rankId, dateAchieved) VALUES
  (7,2,1,135,'2024-04-17'),
  (8,2,4,99,'2024-02-08'),
  (9,3,2,226,'2024-03-29'),
  (10,3,1,134,'2024-12-16'),
  (11,3,5,71,'2024-06-04'),
  (12,4,6,24,'2024-07-01'),
  (13,4,5,69,'2024-10-06'),
  (14,4,4,113,'2024-04-27'),
  (15,5,6,6,'2024-05-05'),
  (16,5,3,92,'2024-03-20'),
  (17,6,6,66,'2024-11-19'),
  (18,6,5,72,'2024-02-09'),
  (19,6,4,114,'2024-08-15'),
  (20,7,1,133,'2024-06-23'),
  (21,7,3,87,'2024-03-11'),
  (22,7,5,67,'2024-12-13'),
  (23,7,4,104,'2024-01-15'),
  (24,8,4,99,'2024-11-25'),
  (25,9,6,21,'2024-02-02'),
  (26,9,5,70,'2024-12-24'),
  (27,9,3,94,'2024-07-04'),
  (28,9,1,124,'2024-06-01'),
  (29,10,2,217,'2024-09-18'),
  (30,10,6,3,'2024-08-21'),
  (31,10,4,107,'2024-01-10'),
  (32,11,5,71,'2024-04-16'),
  (33,11,1,129,'2024-05-24'),
  (34,12,2,203,'2024-01-12'),
  (35,13,3,82,'2024-08-02'),
  (36,13,6,33,'2024-10-30'),
  (37,13,4,115,'2024-07-22'),
  (38,14,5,68,'2024-09-29'),
  (39,15,1,120,'2024-03-04'),
  (40,15,2,220,'2024-02-28'),
  (41,15,6,18,'2024-11-09'),
  (42,16,3,74,'2024-02-20'),
  (43,17,4,112,'2024-04-29'),
  (44,17,1,134,'2024-03-15'),
  (45,18,6,60,'2024-06-09'),
  (46,19,5,73,'2024-11-07'),
  (47,19,2,210,'2024-07-30'),
  (48,20,1,118,'2024-10-05'),
  (49,21,3,85,'2024-09-01'),
  (50,21,6,12,'2024-12-20'),
  (51,21,4,104,'2024-08-13'),
  (52,22,2,68,'2024-07-15'),
  (53,23,6,226,'2024-05-02'),
  (54,23,4,115,'2024-06-25'),
  (55,23,1,27,'2024-11-11'),
  (56,24,5,122,'2024-03-18'),
  (57,24,5,72,'2024-10-07'),
  (58,25,3,77,'2024-04-01'),
  (59,25,2,211,'2024-02-17'),
  (60,3,6,27,'2024-05-01'),
  (61,3,3,90,'2024-05-02'),
  (62,3,4,104,'2024-05-03'),
  (63,10,5,71,'2024-06-01'),
  (64,10,3,86,'2024-06-02'),
  (65,10,1,133,'2024-06-03'),
  (66,1,6,66,'2024-06-30'),
  (67,1,5,73,'2024-06-30'),
  (68,1,3,95,'2024-06-30'),
  (69,1,4,117,'2024-06-30'),
  (70,1,1,135,'2024-06-30'),
  (71,1,2,226,'2024-06-30');
