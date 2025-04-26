DROP TABLE IF EXISTS UserBadge;
DROP TABLE IF EXISTS Badge;
DROP TABLE IF EXISTS GameAccount;
DROP TABLE IF EXISTS PeakRecord;
DROP TABLE IF EXISTS Rank;
DROP TABLE IF EXISTS Game;
DROP TABLE IF EXISTS Friendship;
DROP TABLE IF EXISTS Team;
DROP TABLE IF EXISTS "User";

CREATE TABLE User (
    id            INTEGER PRIMARY KEY AUTOINCREMENT,
    username      TEXT    NOT NULL,
    email         TEXT    NOT NULL,
    password      TEXT    NOT NULL,
    dateJoined    TEXT    NOT NULL
    --added team id later after making team
);

CREATE TABLE Team (
  id               INTEGER PRIMARY KEY AUTOINCREMENT,
  teamName         TEXT    NOT NULL,
  description      TEXT,
  createdByUserId  INTEGER /* Removed not null so if team is deleted other players can still bein it if team creator deletes his account */,
  FOREIGN KEY (createdByUserId) REFERENCES "User"(id)
    ON DELETE SET NULL  -- instead of CASCADE for reason mentioned above, this is why it failed in my class presentation
    ON UPDATE CASCADE
);

ALTER TABLE "User"
    ADD COLUMN teamId INTEGER
        REFERENCES Team(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE;

CREATE TABLE Friendship (
    id        INTEGER PRIMARY KEY AUTOINCREMENT,
    userId    INTEGER NOT NULL,
    friendId  INTEGER NOT NULL,
    status    TEXT    NOT NULL,
    CHECK(status IN ('pending','accepted','blocked')),
    FOREIGN KEY (userId)   REFERENCES "User"(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (friendId) REFERENCES "User"(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Game (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    title       TEXT    NOT NULL,
    description TEXT
);

CREATE TABLE Rank (
    id        INTEGER PRIMARY KEY AUTOINCREMENT,
    gameId    INTEGER NOT NULL,
    rankName  TEXT    NOT NULL,
    rankOrder INTEGER NOT NULL,
    RankRating INTEGER,
    FOREIGN KEY (gameId) REFERENCES Game(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE PeakRecord (
    id           INTEGER PRIMARY KEY AUTOINCREMENT,
    userId       INTEGER NOT NULL,
    gameId       INTEGER NOT NULL,
    rankId       INTEGER NOT NULL,
    dateAchieved DATETIME    NOT NULL,
    FOREIGN KEY (userId) REFERENCES "User"(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (gameId) REFERENCES Game(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (rankId) REFERENCES Rank(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE GameAccount (
    id              INTEGER PRIMARY KEY AUTOINCREMENT,
    userId          INTEGER NOT NULL,
    gameId          INTEGER NOT NULL,
    accountUsername TEXT NOT NULL,
    FOREIGN KEY (userId) REFERENCES "User"(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (gameId) REFERENCES Game(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE Badge (
    id          INTEGER PRIMARY KEY AUTOINCREMENT,
    badgeName   TEXT    NOT NULL,
    description TEXT,
    iconUrl     TEXT
);

CREATE TABLE UserBadge (
    userId  INTEGER NOT NULL,
    badgeId INTEGER NOT NULL,
    PRIMARY KEY (userId, badgeId),
    FOREIGN KEY (userId) REFERENCES "User"(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    FOREIGN KEY (badgeId) REFERENCES Badge(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);