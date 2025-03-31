# PeakRanks

**Name:**  
Mohammad Ammar Ahed Shaker Asir

## Application Title
**PeakRanks**

## Purpose and Summary
**PeakRanks** is designed to let gamers collect, display, and share their highest in-game ranks across various competitive titles (e.g., CS:GO, CS2, League of Legends, Rainbow Six Siege, Valorant, Overwatch, Deadlock as these are the games I personally play and want to add). Unlike existing rank-tracking websites that hook into official game APIs, PeakRank primarily relies on user-provided information. This allows you to store and compare your peak ranks even for older or less-supported games where automated tracking is unavailable, and to view your friend’s performance in these games, to judge if they are worthy of becoming your partner in a different game.

---

## Entities

### 1. User
- **Purpose:** Stores basic user information (username, email, password, etc.).  
- **Key Fields:**  
  - `id`  
  - `username`  
  - `email`  
  - `password`  
  - `dateJoined`

### 2. Game
- **Purpose:** Represents each game tracked within PeakRanks.  
- **Key Fields:**  
  - `id`  
  - `title`  
  - `description`

### 3. Rank
- **Purpose:** Defines the rank tiers for each game (e.g., Silver, Gold, Diamond…).  
- **Key Fields:**  
  - `id`  
  - `gameId`  
  - `rankName`  
  - `rankOrder` (numeric for sorting)

### 4. PeakRecord
- **Purpose:** Connects a User to a Game with a specific Rank, representing the user’s highest achieved rank in that game.  
- **Key Fields:**  
  - `id`  
  - `userId`  
  - `gameId`  
  - `rankId`  
  - `dateAchieved`

### 5. GameAccount (Optional)
- **Purpose:** Allows users to link an in-game account (e.g., Steam, Riot ID), paving the way for possible API validation later.  
- **Key Fields:**  
  - `id`  
  - `userId`  
  - `gameId`  
  - `accountUsername`

### 6. Friendship
- **Purpose:** Enables social connections between users.  
- **Key Fields:**  
  - `id`  
  - `userId`  
  - `friendId`  
  - `status` (e.g., “pending,” “accepted,” “blocked”)

### 7. Team
- **Purpose:** Groups multiple users who want to share a team profile or compete together.  
- **Key Fields:**  
  - `id`  
  - `teamName`  
  - `description`  
  - `createdByUserId`  
- **Relationships:** Many-to-many between Team and User (via a join table).

### 8. Badge (Optional)
- **Purpose:** Awards users for specific milestones (e.g., “Reached Global Elite in CS:GO”).  
- **Key Fields:**  
  - `id`  
  - `badgeName`  
  - `description`  
  - `iconUrl`  
- **Relationships:** Many-to-many with User (a user can earn multiple badges).

---

## Proposed Technology Stack

1. **Programming Language**  
   - Python (Flask/Django)

2. **User Interface**  
   - Simple Web Interface with HTML/CSS and light JavaScript

3. **Database**  
   - SQLite for local simplicity

4. **Frameworks**  
   - Python: Flask (and potentially other libraries as needed)

---

## How Users Will Interact (CRUD)

### 1. Create
- **User**: Registration with username and password.  
- **PeakRecord**: Users manually add their highest rank for a game.  
- **GameAccount** (optional): Link in-game accounts.  
- **Friendship**: Send friend/follow requests.  
- **Team**: Create a new team and invite users.  
- **Badge**: Created and assigned by admin or automated logic.

### 2. Read (View)
- **Profiles**: Display user’s peak records, teams, badges, etc.  
- **Game**: View details about each game and its rank tiers.  
- **Teams**: Show team info, members, and possibly aggregated stats.  
- **Friend Lists**: List of accepted or pending friendships.

### 3. Update
- **User Profile**: Change username, email, or password.  
- **PeakRecord**: Update to a higher rank if the user has achieved one.  
- **Team**: Update team name/description, add/remove members.  
- **Badge**: Admin or system might grant new badges to users based on conditions.

### 4. Delete
- **PeakRecord**: Remove a record entered incorrectly.  
- **User**: Delete or deactivate an account.  
- **Team**: Disband a team if no longer active.  
- **Badge**: Admin might revoke or delete a badge if needed.

---

## Optional Features (Out of Scope for Now)
- **Automatic Rank Verification**: Integrate external game APIs to validate or auto-update ranks in the future.  
- **Messaging/Comments**: Let teammates or friends comment on each other’s profiles.  
- **Notifications System**: Alert users for friend requests, team invites, badge awards, etc.  
- **Global Leaderboard**: Show a sitewide “top rankers” list or highlight special achievements (e.g., unique profile designs for highest rankers).

---
