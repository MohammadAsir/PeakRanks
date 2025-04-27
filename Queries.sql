-- 1. List each user’s game account username alongside their user name and the game title.
SELECT u.username,
       g.title       AS game,
       ga.accountUsername
FROM "User" u
JOIN GameAccount ga
  ON ga.userId = u.id
JOIN Game g
  ON g.id = ga.gameId;

-- 2. For each user, count how many peak rank records they have achieved.
SELECT u.username,
       COUNT(pr.id) AS record_count
FROM "User" u
LEFT JOIN PeakRecord pr
  ON pr.userId = u.id
GROUP BY u.id, u.username;

-- 3. Identify users who have earned more than two badges.
SELECT u.username,
       COUNT(ub.badgeId) AS badge_count
FROM "User" u
JOIN UserBadge ub
  ON ub.userId = u.id
GROUP BY u.id, u.username
HAVING COUNT(ub.badgeId) > 2;

-- 4. Find users who have a rank updated on the most recent day where a  rank was updated.
SELECT u.username
FROM "User" u
WHERE u.id IN (
  SELECT pr.userId
  FROM PeakRecord pr
  WHERE pr.dateAchieved = (
    SELECT MAX(dateAchieved)
    FROM PeakRecord
  )
);

-- 5. List users who have achieved peak records in every game available.(same as users who have the collector badge)
SELECT u.username
FROM "User" u
WHERE (
  SELECT COUNT(DISTINCT pr.gameId)
  FROM PeakRecord pr
  WHERE pr.userId = u.id
) = (
  SELECT COUNT(*) FROM Game
);

-- 6. Combine users who have at least one game account with those who have earned at least one badge.
SELECT u.username
FROM "User" u
WHERE u.id IN (
  SELECT DISTINCT userId FROM GameAccount
)
UNION
SELECT u.username
FROM "User" u
WHERE u.id IN (
  SELECT DISTINCT userId FROM UserBadge
);

-- 7. For each team, list members and their accepted friends who belong to the same team.
SELECT t.teamName,
       u.username AS member,
       f.username AS friend
FROM Team t
JOIN "User" u
  ON u.teamId = t.id
JOIN Friendship fr
  ON fr.userId = u.id
 AND fr.status = 'accepted'
JOIN "User" f
  ON f.id = fr.friendId
 AND f.teamId = t.id;

-- 8. Find teams whose members have records in more than 3 distinct games.
SELECT t.teamName,
       COUNT(DISTINCT pr.gameId) AS distinct_games
FROM Team t
JOIN "User" u
  ON u.teamId = t.id
JOIN PeakRecord pr
  ON pr.userId = u.id
JOIN Game g
  ON g.id = pr.gameId
GROUP BY t.id, t.teamName
HAVING COUNT(DISTINCT pr.gameId) > 3;

-- 9. Find badges that have not been awarded to any user.
SELECT b.badgeName
FROM Badge b
WHERE NOT EXISTS (
  SELECT 1 FROM UserBadge ub
  WHERE ub.badgeId = b.id
);