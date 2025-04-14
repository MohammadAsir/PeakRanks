
INSERT INTO Game (id, title, description) VALUES
(1, 'CS:GO', 'Counter-Strike: Global Offensive'),
(2, 'League of Legends', 'MOBA by Riot Games'),
(3, 'Rainbow Six Siege', 'Ubisoft tactical shooter'),
(4, 'Valorant', '5v5 tactical shooter by Riot'),
(5, 'Overwatch', 'Team-based shooter by Blizzard'),
(6, 'Deadlock', 'Fictional game for demonstration');

INSERT INTO "User" (id, username, email, password, dateJoined, teamId)
VALUES
(1,  'user1',  'user1@peakranks.com',  'pass1',  '2024-01-15', NULL),
(2,  'user2',  'user2@peakranks.com',  'pass2',  '2024-02-03', NULL),
(3,  'user3',  'user3@peakranks.com',  'pass3',  '2024-02-19', NULL),
(4,  'user4',  'user4@peakranks.com',  'pass4',  '2024-03-02', NULL),
(5,  'user5',  'user5@peakranks.com',  'pass5',  '2024-03-11', NULL);

INSERT INTO PeakRecord (id, userId, gameId, rankId, dateAchieved) VALUES

(1, 1, 1, 3, '2024-05-10'),  -- user1, CS:GO -> Platinum
(2, 1, 4, 14, '2024-06-12'), -- user1, Valorant -> Gold

-- user2 has 2 peak records: game 2 (LoL, random rank), game 5 (Overwatch, random rank)
(3, 2, 2, 8, '2024-02-17'),  -- user2, League -> Diamond
(4, 2, 5, 17, '2024-03-22'), -- user2, Overwatch -> Silver

-- user3 has 3 peak records: game 1, game 2, game 6
(5, 3, 1, 2, '2024-04-01'),  -- user3, CS:GO -> Gold
(6, 3, 2, 6, '2024-04-15'),  -- user3, League -> Gold
(7, 3, 6, 22, '2025-01-10'); -- user3, Deadlock -> Gold

--------------------------------------------------------------------------------
-- 1) Deadlock (Game ID = 1)
--    11 distinct ranks, each with 6 sub-ranks (66 total).
--------------------------------------------------------------------------------
INSERT INTO Rank (id, gameId, rankName, rankOrder) VALUES
  -- Initiate (6 sub-ranks)
  (1, 1, 'Initiate I', 1),
  (2, 1, 'Initiate II', 2),
  (3, 1, 'Initiate III', 3),
  (4, 1, 'Initiate IV', 4),
  (5, 1, 'Initiate V', 5),
  (6, 1, 'Initiate VI', 6),

  -- Seeker (6 sub-ranks)
  (7, 1, 'Seeker I', 7),
  (8, 1, 'Seeker II', 8),
  (9, 1, 'Seeker III', 9),
  (10, 1, 'Seeker IV', 10),
  (11, 1, 'Seeker V', 11),
  (12, 1, 'Seeker VI', 12),

  -- Alchemist (6 sub-ranks)
  (13, 1, 'Alchemist I', 13),
  (14, 1, 'Alchemist II', 14),
  (15, 1, 'Alchemist III', 15),
  (16, 1, 'Alchemist IV', 16),
  (17, 1, 'Alchemist V', 17),
  (18, 1, 'Alchemist VI', 18),

  -- Arcanist (6 sub-ranks)
  (19, 1, 'Arcanist I', 19),
  (20, 1, 'Arcanist II', 20),
  (21, 1, 'Arcanist III', 21),
  (22, 1, 'Arcanist IV', 22),
  (23, 1, 'Arcanist V', 23),
  (24, 1, 'Arcanist VI', 24),

  -- Ritualist (6 sub-ranks)
  (25, 1, 'Ritualist I', 25),
  (26, 1, 'Ritualist II', 26),
  (27, 1, 'Ritualist III', 27),
  (28, 1, 'Ritualist IV', 28),
  (29, 1, 'Ritualist V', 29),
  (30, 1, 'Ritualist VI', 30),

  -- Emissary (6 sub-ranks)
  (31, 1, 'Emissary I', 31),
  (32, 1, 'Emissary II', 32),
  (33, 1, 'Emissary III', 33),
  (34, 1, 'Emissary IV', 34),
  (35, 1, 'Emissary V', 35),
  (36, 1, 'Emissary VI', 36),

  -- Archon (6 sub-ranks)
  (37, 1, 'Archon I', 37),
  (38, 1, 'Archon II', 38),
  (39, 1, 'Archon III', 39),
  (40, 1, 'Archon IV', 40),
  (41, 1, 'Archon V', 41),
  (42, 1, 'Archon VI', 42),

  -- Oracle (6 sub-ranks)
  (43, 1, 'Oracle I', 43),
  (44, 1, 'Oracle II', 44),
  (45, 1, 'Oracle III', 45),
  (46, 1, 'Oracle IV', 46),
  (47, 1, 'Oracle V', 47),
  (48, 1, 'Oracle VI', 48),

  -- Phantom (6 sub-ranks)
  (49, 1, 'Phantom I', 49),
  (50, 1, 'Phantom II', 50),
  (51, 1, 'Phantom III', 51),
  (52, 1, 'Phantom IV', 52),
  (53, 1, 'Phantom V', 53),
  (54, 1, 'Phantom VI', 54),

  -- Ascendant (6 sub-ranks)
  (55, 1, 'Ascendant I', 55),
  (56, 1, 'Ascendant II', 56),
  (57, 1, 'Ascendant III', 57),
  (58, 1, 'Ascendant IV', 58),
  (59, 1, 'Ascendant V', 59),
  (60, 1, 'Ascendant VI', 60),

  -- Eternus (6 sub-ranks)
  (61, 1, 'Eternus I', 61),
  (62, 1, 'Eternus II', 62),
  (63, 1, 'Eternus III', 63),
  (64, 1, 'Eternus IV', 64),
  (65, 1, 'Eternus V', 65),
  (66, 1, 'Eternus VI', 66);

--------------------------------------------------------------------------------
-- 2) Overwatch (Game ID = 2)
--    7 primary tiers: Bronze, Silver, Gold, Platinum, Diamond, Master, Grandmaster
--------------------------------------------------------------------------------
INSERT INTO Rank (id, gameId, rankName, rankOrder) VALUES
(67, 2, 'Bronze',       1),
(68, 2, 'Silver',       2),
(69, 2, 'Gold',         3),
(70, 2, 'Platinum',     4),
(71, 2, 'Diamond',      5),
(72, 2, 'Master',       6),
(73, 2, 'Grandmaster',  7);

--------------------------------------------------------------------------------
-- 3) Rainbow Six Siege (Game ID = 3)
--    Tiers with subdivisions (Copper IV→I, Bronze IV→I, Silver IV→I, Gold IV→I,
--    Platinum IV→I) plus Diamond, Champion (no subdivisions except Diamond
--    used to have I–V in older seasons, but we use the current approach).
--------------------------------------------------------------------------------
INSERT INTO Rank (id, gameId, rankName, rankOrder) VALUES
(74,  3, 'Copper IV',   1),
(75,  3, 'Copper III',  2),
(76,  3, 'Copper II',   3),
(77,  3, 'Copper I',    4),
(78,  3, 'Bronze IV',   5),
(79,  3, 'Bronze III',  6),
(80,  3, 'Bronze II',   7),
(81,  3, 'Bronze I',    8),
(82,  3, 'Silver IV',   9),
(83,  3, 'Silver III',  10),
(84,  3, 'Silver II',   11),
(85,  3, 'Silver I',    12),
(86,  3, 'Gold IV',     13),
(87,  3, 'Gold III',    14),
(88,  3, 'Gold II',     15),
(89,  3, 'Gold I',      16),
(90,  3, 'Platinum IV', 17),
(91,  3, 'Platinum III',18),
(92,  3, 'Platinum II', 19),
(93,  3, 'Platinum I',  20),
(94,  3, 'Diamond',     21),
(95,  3, 'Champion',    22);

--------------------------------------------------------------------------------
-- 4) Valorant (Game ID = 4)
--    Iron (3 subranks), Bronze (3), Silver (3), Gold (3), Platinum (3), Diamond (3),
--    Immortal (3), Radiant (no sub-rank).
--------------------------------------------------------------------------------
INSERT INTO Rank (id, gameId, rankName, rankOrder) VALUES
(96,  4, 'Iron 1',       1),
(97,  4, 'Iron 2',       2),
(98,  4, 'Iron 3',       3),
(99,  4, 'Bronze 1',     4),
(100, 4, 'Bronze 2',     5),
(101, 4, 'Bronze 3',     6),
(102, 4, 'Silver 1',     7),
(103, 4, 'Silver 2',     8),
(104, 4, 'Silver 3',     9),
(105, 4, 'Gold 1',       10),
(106, 4, 'Gold 2',       11),
(107, 4, 'Gold 3',       12),
(108, 4, 'Platinum 1',   13),
(109, 4, 'Platinum 2',   14),
(110, 4, 'Platinum 3',   15),
(111, 4, 'Diamond 1',    16),
(112, 4, 'Diamond 2',    17),
(113, 4, 'Diamond 3',    18),
(114, 4, 'Immortal 1',   19),
(115, 4, 'Immortal 2',   20),
(116, 4, 'Immortal 3',   21),
(117, 4, 'Radiant',      22);

--------------------------------------------------------------------------------
-- 5) CS:GO (Game ID = 5)
--    Silver (6 sub-ranks), Gold Nova (4), Master Guardian (4),
--    Legendary Eagle (2), Supreme, Global Elite => 18 total.
--------------------------------------------------------------------------------
INSERT INTO Rank (id, gameId, rankName, rankOrder) VALUES
(118, 5, 'Silver I',                  1),
(119, 5, 'Silver II',                 2),
(120, 5, 'Silver III',                3),
(121, 5, 'Silver IV',                 4),
(122, 5, 'Silver Elite',              5),
(123, 5, 'Silver Elite Master',       6),
(124, 5, 'Gold Nova I',               7),
(125, 5, 'Gold Nova II',              8),
(126, 5, 'Gold Nova III',             9),
(127, 5, 'Gold Nova Master',          10),
(128, 5, 'Master Guardian I',         11),
(129, 5, 'Master Guardian II',        12),
(130, 5, 'Master Guardian Elite',     13),
(131, 5, 'Distinguished Master Guardian', 14),
(132, 5, 'Legendary Eagle',           15),
(133, 5, 'Legendary Eagle Master',    16),
(134, 5, 'Supreme Master First Class',17),
(135, 5, 'Global Elite',              18);

--------------------------------------------------------------------------------
-- 5) League of Legends (Game ID = 6)
--    Iron (4 sub-ranks), Bronze (4), Silver (4), Gold(4),
--    Platinum (4), Diamond (4), Master (1), Grandmaster (1),
--    Challenger (1) =>  27 total.
--------------------------------------------------------------------------------
INSERT INTO Rank (id, gameId, rankName, rankOrder) VALUES
    -- Iron (IV → I)
    (200, 6, 'Iron IV',   1),
    (201, 6, 'Iron III',  2),
    (202, 6, 'Iron II',   3),
    (203, 6, 'Iron I',    4),
    -- Bronze (IV → I)
    (204, 6, 'Bronze IV', 5),
    (205, 6, 'Bronze III',6),
    (206, 6, 'Bronze II', 7),
    (207, 6, 'Bronze I',  8),
    -- Silver (IV → I)
    (208, 6, 'Silver IV', 9),
    (209, 6, 'Silver III',10),
    (210, 6, 'Silver II', 11),
    (211, 6, 'Silver I',  12),
    -- Gold (IV → I)
    (212, 6, 'Gold IV',   13),
    (213, 6, 'Gold III',  14),
    (214, 6, 'Gold II',   15),
    (215, 6, 'Gold I',    16),
    -- Platinum (IV → I)
    (216, 6, 'Platinum IV',17),
    (217, 6, 'Platinum III',18),
    (218, 6, 'Platinum II',19),
    (219, 6, 'Platinum I', 20),
    -- Diamond (IV → I)
    (220, 6, 'Diamond IV', 21),
    (221, 6, 'Diamond III',22),
    (222, 6, 'Diamond II', 23),
    (223, 6, 'Diamond I',  24),
    -- Master (no subdivisions, but sometimes subdivided in modern LoL)
    (224, 6, 'Master',     25),
    -- Grandmaster (same assumption)
    (225, 6, 'Grandmaster',26),
    -- Challenger (highest)
    (226, 6, 'Challenger', 27);