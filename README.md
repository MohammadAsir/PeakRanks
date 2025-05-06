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

### 4. Delete
- **PeakRecord**: Remove a record entered incorrectly.  
- **User**: Delete or deactivate an account.  
- **Team**: Disband a team if creator deletes account.  
- **Badge**: Admin might revoke or delete a badge if needed.


---

## Getting Started

These steps assume you have Python 3.8+ and Git installed.

```bash
# 1. Clone the repo
git clone https://github.com/MohammadAsir/PeakRanks.git
cd PeakRanks

# 2. Create & activate a virtual environment
python3 -m venv venv
# On macOS/Linux:
source venv/bin/activate
# On Windows PowerShell:
.\venv\Scripts\Activate.ps1
# if you hvae an error:
Set-ExecutionPolicy -Scope Process -ExecutionPolicy RemoteSigned
.\venv\Scripts\Activate.ps1

# 3. Install dependencies
pip install -r requirements.txt

# 4. Initialize the database
# From project root
# Windows
python app\seed_db.py
# macOS/Linux
python3 app/seed_db.py

# 5. Run the application
python run.py
```
Alternative: Flask CLI
```bash
# macOS/Linux
export FLASK_APP=run.py
export FLASK_ENV=development
flask run

# Windows PowerShell
$env:FLASK_APP = 'run.py'
$env:FLASK_ENV = 'development'
flask run
```
## AI Usage
### App development on flask
Development process for the app:
- It made the full styles.css files
- Helped me debug routes.py file for routing in flask

### Documentation
- Transformed the README.md from the word file I wrote to markdown format
- Documentation comments on some code

