# bubislaw.com

Static one-page site for Andrew Bubis, Attorney at Law.

## Files
- `index.html` — the whole site
- `styles.css` — stylesheet (Industry design tokens)

## Deploy on Railway
1. Push this folder to a GitHub repo (e.g. `bubislaw`).
2. In Railway: New Project → Deploy from GitHub repo → select the repo.
3. Railway detects a static site; if asked, use a static server. Easiest: add a `Dockerfile` or set the start command to `npx serve .` — or use Railway's "Static Site" option with output directory `/`.
4. In Railway → Settings → Domains, add custom domain `bubislaw.com` and `www.bubislaw.com`.
5. In Namecheap → Domain → Advanced DNS, add the CNAME record Railway shows you (for the apex domain use Namecheap's ALIAS record pointing at the Railway domain).

## Contact form
The form opens the visitor's email app addressed to Andrew@bubislaw.com (no server needed). For submissions that arrive even when a visitor has no mail app configured, swap in a form service like Formspree later.
