# 🧠 Vibe Coder Template

> A clean, modern GitHub template for building, reviewing, shipping, and scaling software **the right way**.

This is not just a starter repo. It is a **workflow-enforcing template** designed to teach and reinforce real-world GitHub, CI/CD, and engineering best practices.

## ✨ Philosophy
- Clarity over cleverness
- Small commits, steady progress
- Automation over discipline
- Readable > smart
- If deploying feels scary, fix the pipeline

## ⚙️ Tech Stack
- **Runtime:** Node.js
- **Frontend:** React (Vite)
- **Backend:** Node.js (API-ready)
- **Tooling:** ESLint, Prettier, Husky
- **CI:** GitHub Actions
- **Infra-ready:** AWS / Serverless / Terraform friendly
- **Repo Style:** Monorepo

## 🚀 One-Click Repository Setup (Required)

After creating a repo from this template, run:

```bash
chmod +x scripts/bootstrap-repo.sh
./scripts/bootstrap-repo.sh
```

This script automatically configures:
- `develop` as the default branch
- Branch protection on `main` and `develop`
- CI status checks requirement
- Repository features (issues, projects)
- Security features (Dependabot, vulnerability alerts)
- README badges and branding

**Note:** The script adds README changes and pushes them *before* enabling branch protection, so this initial setup commit goes directly to `develop`. After that, all changes must go through pull requests.

## 🔐 What This Template Enforces

Once bootstrapped, this repository is designed to enforce:
- Feature branches (no direct commits to `main` or `develop`)
- Pull requests for all changes
- CI checks must pass before merge
- Automated linting and formatting
- Pre-commit checks via Husky
- Release-ready structure
- Security-first defaults

This template intentionally nudges you into professional GitHub workflows, even for solo projects.

## 🔁 Required GitHub Workflow

This repository assumes the following workflow:

1. **Create a feature branch** from `develop`
   ```bash
   git checkout develop
   git pull
   git checkout -b feature/your-feature-name
   ```

2. **Commit small, meaningful changes**
   ```bash
   git add .
   git commit -m "feat: add your feature"
   git push -u origin feature/your-feature-name
   ```

3. **Open a pull request** targeting `develop`
   - CI runs automatically
   - Review your own changes
   - Ensure all checks pass

4. **Merge when green**
   - No approval required for solo projects
   - CI must pass before merge
   - Merge via GitHub UI

5. **Deploy to production** via `main`
   - When ready for production, create a PR from `develop` to `main`
   - This represents a release candidate
   - Merge to `main` triggers production deployment

Direct commits to protected branches are intentionally blocked.

## 🤖 Automation & CI

GitHub Actions is used to:
- Lint JavaScript / JSX
- Enforce formatting standards
- Catch issues before merge
- Prepare artifacts for future deployment

All workflows live in:
```
.github/workflows/
```

The bootstrap script configures both `main` and `develop` to require the `ci` status check to pass before any PR can be merged.

## 🔍 Security & Quality

This template is compatible with GitHub's security features:
- Dependency Graph
- Dependabot alerts (auto-enabled by bootstrap script)
- Dependabot version updates
- Secret scanning
- Code scanning (CodeQL)

The bootstrap script automatically enables vulnerability alerts and automated security fixes where available.

## 📦 Releases & Versioning

This repository supports:
- Release branches
- Tagged versions
- Hotfix workflows
- GitHub Releases

**Recommended flow:**
- `develop` = active development
- `main` = production-ready code
- Feature branches merge into `develop`
- `develop` merges into `main` for releases

Releases should represent intentional, documented milestones, not random snapshots.

## 🚀 Getting Started

### Install dependencies

```bash
npm install
```

### Run frontend
```bash
npm run dev
```

### Run backend

```bash
npm run dev:backend
```

### Testing
```bash
npm test
```

Tests are expected for:
- Critical logic
- Bug fixes
- New features

## 📁 Repository Structure

```
vibe-coder-template/
├── .github/              # CI workflows, PR templates
├── .husky/               # Git hooks
├── apps/
│   ├── frontend/         # React app
│   └── backend/          # API / server
├── packages/             # Shared libraries
├── infra/                # Infrastructure definitions
├── docs/                 # Architecture, decisions, roadmap
├── scripts/              # Repo automation (including bootstrap)
├── .editorconfig
├── .env.example
├── eslint.config.mjs
├── .prettierrc
└── README.md
```

See `/docs/architecture.md` for full breakdown.

## 🗺 Roadmap

- Core setup
- Features
- Tests
- CI/CD
- Production hardening

## 🧠 Rules of the Repo

- No secrets in code - ever
- Every change goes through a PR (except initial bootstrap)
- Every feature has a purpose
- Automation is non-negotiable
- Quality is enforced, not hoped for
- CI must pass before merge

## 💡 What You'll Practice Using This Template

By using this template correctly, you will practice:
- GitHub repositories, branches, commits, and pull requests
- Pull request reviews and feedback cycles (even reviewing your own work)
- Merge conflict resolution
- GitHub Actions CI pipelines
- Linting and formatting automation
- Release management and versioning
- Branch protection and workflow enforcement
- Secure coding and dependency hygiene
- Professional repository structure and documentation

## 🏁 Final Note

This template is opinionated on purpose.

If you follow it, you won't just build projects — you'll build confidence, discipline, and credibility as a developer.

Even working solo, treating your code with the same rigor as a team project will level up your engineering habits.

Happy shipping 🚀
