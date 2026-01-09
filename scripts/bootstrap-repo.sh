#!/usr/bin/env bash
set -e

echo "🚀 Bootstrapping Vibe Coder Template repository..."

# ---------- Checks ----------
command -v gh >/dev/null 2>&1 || {
  echo "❌ GitHub CLI (gh) is not installed."
  exit 1
}

gh auth status >/dev/null 2>&1 || {
  echo "❌ GitHub CLI not authenticated. Run: gh auth login"
  exit 1
}

OWNER=$(gh repo view --json owner -q .owner.login)
REPO=$(gh repo view --json name -q .name)

echo "📦 Repo: $OWNER/$REPO"

# ---------- Branch Setup ----------
echo "🔀 Setting default branch to 'develop'..."
gh api repos/$OWNER/$REPO --method PATCH \
  -f default_branch='develop'

# ---------- Branch Protection ----------
echo "🔒 Enabling branch protection on main..."

gh api repos/$OWNER/$REPO/branches/main/protection \
  --method PUT \
  --input - <<EOF
{
  "required_status_checks": {
    "strict": true,
    "contexts": ["ci"]
  },
  "enforce_admins": true,
  "required_pull_request_reviews": {
    "required_approving_review_count": 1,
    "dismiss_stale_reviews": true
  },
  "restrictions": null
}
EOF

# ---------- GitHub Pages ----------
echo "📄 Enabling GitHub Pages (docs folder)..."

gh api repos/$OWNER/$REPO/pages \
  --method POST \
  -f source.branch='main' \
  -f source.path='/docs' || echo "ℹ️ Pages may already be enabled."

# ---------- Environments ----------
echo "🌍 Creating environments..."

gh api repos/$OWNER/$REPO/environments/staging --method PUT
gh api repos/$OWNER/$REPO/environments/production --method PUT

# ---------- Labels ----------
echo "🏷 Adding deployment labels..."

gh label create deploy:staging --color 0E8A16 --force
gh label create deploy:production --color 5319E7 --force
gh label create destroy:env --color B60205 --force

# ---------- Done ----------
echo "✅ Repository successfully bootstrapped!"
echo "🎉 Your template is now fully enforced and production-ready."
