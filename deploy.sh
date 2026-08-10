#!/bin/bash
# BubisLaw deploy script — guaranteed deploy every time
cd "$(dirname "$0")"

# 1. Commit everything
git add -A
if git diff --cached --quiet; then
  git commit --allow-empty -m "Deploy: $(date '+%Y-%m-%d %H:%M')"
else
  git commit -m "Update: $(date '+%Y-%m-%d %H:%M')"
fi

# 2. Push to GitHub for version history (runs in background)
git push origin master &

# 3. Deploy directly to Railway — bypasses the unreliable webhook entirely
railway up --detach

echo "✅ Deploying — live in ~60 seconds at bubislaw.com"
wait
