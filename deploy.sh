#!/bin/bash
# BubisLaw — one command to deploy
set -e
cd "$(dirname "$0")"

# Remove any stale git locks
rm -f .git/index.lock .git/HEAD.lock

# Commit everything
git add -A
if git diff --cached --quiet; then
  git commit --allow-empty -m "Deploy: $(date '+%Y-%m-%d %H:%M')"
else
  git commit -m "Update: $(date '+%Y-%m-%d %H:%M')"
fi

# Push to GitHub
git push origin master

# Trigger Railway deploy immediately via API
TOKEN=$(python3 -c "import json,os; d=json.load(open(os.path.expanduser('~/.railway/config.json'))); print(d.get('token',''))" 2>/dev/null)
if [ -n "$TOKEN" ]; then
  curl -s -X POST https://backboard.railway.com/graphql/v2 \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $TOKEN" \
    -d '{"query":"mutation{serviceInstanceRedeploy(environmentId:\"3a31ac6a-ed47-42ea-a468-df9c92e415dc\",serviceId:\"7de9f805-9e7b-45fa-a50d-41d8cef06cd0\")}"}' > /dev/null
  echo "✅ Pushed and deploying — live in ~60 seconds at bubislaw.com"
else
  echo "✅ Pushed to GitHub. Run 'railway login' once to enable instant deploys."
fi
