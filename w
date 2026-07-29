#!/bin/bash
# Bootstrap do World Cup Database dentro da VM do freeCodeCamp
cd /workspace/project || exit 1
B=https://raw.githubusercontent.com/abelsilvaeng/world-cup-database/main
curl -sL $B/worldcup.sql | psql -U postgres > /dev/null
curl -sL $B/insert_data.sh -o insert_data.sh
curl -sL $B/queries.sh -o queries.sh
chmod +x insert_data.sh queries.sh
echo "--- teams/games ---"
psql -U freecodecamp -d worldcup -t --no-align -c "SELECT COUNT(*) FROM teams" -c "SELECT COUNT(*) FROM games"
ls -l insert_data.sh queries.sh
