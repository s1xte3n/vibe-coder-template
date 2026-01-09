#!/usr/bin/env bash
set -e

echo "🚀 Bootstrapping Vibe Coder Template repository..."

# -----------------------------
# Preconditions
# -----------------------------
if ! command -v gh &>/dev/null; then
  echo "❌ GitHub CLI (gh) is not installed."
  echo "👉 Install from: https://cli.github.com/"
  exit 1
fi

if ! gh auth status &>/dev/null; then
  echo "❌ GitHub CLI is not authenticated."
  echo "👉 Run: gh auth login"
  exit 1
fi

if ! git rev-parse --is-inside-work-tree &>/dev/null; then
  echo "❌ Not inside a git repository."
  exit 1
fi

# -----------------------------
# Repo Info
# -----------------------------
REPO=$(gh repo view --json nameWithOwner -q .nameWithOwner)
echo "📦 Repo: $REPO"

# -----------------------------
# Ensure develop branch exists
# -----------------------------
echo "🔀 Ensuring 'develop' branch exists..."
if git show-ref --quiet refs/heads/develop; then
  git checkout develop
else
  git checkout -b develop
fi

git push -u origin develop || true

# -----------------------------
# Set default branch
# -----------------------------
echo "⭐ Setting default branch to 'develop'..."
gh repo edit "$REPO" --default-branch develop

# -----------------------------
# Enable repository features
# -----------------------------
echo "🧩 Enabling repository features..."
gh repo edit "$REPO" \
  --enable-issues=true \
  --enable-projects=true \
  --enable-wiki=false

# -----------------------------
# Enable security features
# -----------------------------
echo "🔐 Enabling security features (where available)..."
gh api -X PUT "repos/$REPO/vulnerability-alerts" >/dev/null 2>&1 || true
gh api -X PUT "repos/$REPO/automated-security-fixes" >/dev/null 2>&1 || true

# -----------------------------
# Apply branch protection (develop & main)
# -----------------------------
echo "🔒 Protecting branches..."
for branch in develop main; do
  echo "Protecting '$branch' branch..."
  gh api -X PUT "repos/$REPO/branches/$branch/protection" \
    -H "Accept: application/vnd.github+json" \
    -f required_status_checks.strict=true \
    -f required_status_checks.contexts='["ci"]' \
    -f enforce_admins=true \
    -f required_pull_request_reviews.dismiss_stale_reviews=false \
    -f required_pull_request_reviews.require_code_owner_reviews=false \
    -f required_pull_request_reviews.required_approving_review_count=1
done

# -----------------------------
# Add badges & banner to README
# -----------------------------
echo "🏷 Adding default badges & banner to README..."
README_FILE="README.md"

# CI badge
if ! grep -q "workflow/status" "$README_FILE"; then
  echo -e "\n![CI](https://github.com/$REPO/actions/workflows/ci.yml/badge.svg)" >> "$README_FILE"
fi

# License badge
if ! grep -q "license" "$README_FILE"; then
  echo -e "\n![License](https://img.shields.io/badge/license-MIT-green.svg)" >> "$README_FILE"
fi

# Banner GIF
if ! grep -q "vibe-coder-banner" "$README_FILE"; then
  echo -e "\n![Vibe Coder Banner](https://media.giphy.com/media/3oEjI6SIIHBdRxXI40/giphy.gif)" >> "$README_FILE"
fi

# -----------------------------
# Push changes via PR (Option 2)
# -----------------------------
TMP_BRANCH="bootstrap-readme-$(date +%s)"
git checkout -b "$TMP_BRANCH"
git add "$README_FILE"
git commit -m "chore: add default badges & banner to README" || true
git push -u origin "$TMP_BRANCH"

echo "📬 Creating pull request into 'develop'..."
gh pr create \
  --title "chore: add default badges & banner" \
  --body "Bootstrap badges & banner for template" \
  --base develop \
  --head "$TMP_BRANCH"

# -----------------------------
# Final message
# -----------------------------
echo ""
echo "✅ Vibe Coder Template bootstrap complete!"
echo ""
echo "Next steps:"
echo "• Merge the PR to apply README changes"
echo "• Push your first feature branch"
echo "• Let CI enforce quality"
echo ""
echo "🧠 Remember: automate early, commit often, ship calmly."
