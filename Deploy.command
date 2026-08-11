#!/bin/bash
cd "$(dirname "$0")"
clear
echo "Deploying bubislaw.com..."
echo ""
rm -f .git/index.lock .git/HEAD.lock
git add -A
if git diff --cached --quiet && git diff --quiet; then
  git commit --allow-empty -m "Deploy: $(date '+%Y-%m-%d %H:%M')" -q
else
  git commit -m "Update: $(date '+%Y-%m-%d %H:%M')" -q
fi
if git push origin master 2>&1 | grep -qi "error\|fatal\|rejected"; then
  echo "PUSH FAILED - see above"
else
  echo "Pushed to GitHub."
  echo "Railway is auto-deploying now - live in ~60 seconds."
fi
echo ""
echo "You can close this window."
