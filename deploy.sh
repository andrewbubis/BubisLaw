#!/bin/bash
# BubisLaw deploy script — run this anytime you want to push to Railway
cd "$(dirname "$0")"

git add -A

if git diff --cached --quiet; then
  echo "No file changes — forcing Railway redeploy with empty commit..."
  git commit --allow-empty -m "Deploy: $(date '+%Y-%m-%d %H:%M')"
else
  git commit -m "Update: $(date '+%Y-%m-%d %H:%M')"
fi

git push origin master
echo "✅ Pushed to GitHub — Railway will deploy in ~2 minutes."
