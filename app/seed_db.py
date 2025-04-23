# seed_db.py

import sqlite3
import os

# Path to your SQLite file
db_dir  = os.path.join(os.path.dirname(__file__), 'db')
db_path = os.path.join(db_dir, 'peakranks.db')

# Remove old database if it exists
if os.path.exists(db_path):
    os.remove(db_path)
    print(f"Removed existing {db_path}")

# Connect (this will create a new file)
conn = sqlite3.connect(db_path)
cursor = conn.cursor()

# Load schema
ddl_path = os.path.join(db_dir, 'PeakRanks-ddl.sql')
with open(ddl_path, 'r', encoding='utf-8') as f:
    ddl = f.read()
cursor.executescript(ddl)
print(f"Schema created from {ddl_path}")

# Load seed data
seed_path = os.path.join(db_dir, 'PeakRanks-seed.sql')
with open(seed_path, 'r', encoding='utf-8') as f:
    seed = f.read()
cursor.executescript(seed)
print(f"Data seeded from {seed_path}")

conn.commit()
conn.close()
print("Database setup complete.")
