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
# Enable recommended features
# -----------------------------
echo "🧩 Enabling repository features..."

gh repo edit "$REPO" \
  --enable-issues=true \
  --enable-projects=true \
  --enable-wiki=false

# -----------------------------
# Enable security features (public repos)
# -----------------------------
echo "🔐 Enabling security features (where available)..."

gh api -X PUT "repos/$REPO/vulnerability-alerts" >/dev/null 2>&1 || true
gh api -X PUT "repos/$REPO/automated-security-fixes" >/dev/null 2>&1 || true

# -----------------------------
# Final message
# -----------------------------
echo ""
echo "✅ Vibe Coder Template bootstrap complete!"
echo ""
echo "Next steps:"
echo "• Set up branch protection rules in GitHub UI"
echo "• Push your first feature branch"
echo "• Let CI enforce quality"
echo ""
echo "🧠 Remember: automate early, commit often, ship calmly."
