# 🧠 Vibe Coder Template

> A clean, modern GitHub template for building, reviewing, shipping, and scaling software **the right way**.

This is not just a starter repo.
It is a **workflow-enforcing template** designed to teach and reinforce real-world GitHub, CI/CD, and engineering best practices.

---

## ✨ Philosophy
- Clarity over cleverness
- Small commits, steady progress
- Automation over discipline
- Readable > smart
- If deploying feels scary, fix the pipeline

---

## ⚙️ Tech Stack
- **Runtime:** Node.js
- **Frontend:** React (Vite)
- **Backend:** Node.js (API-ready)
- **Tooling:** ESLint, Prettier, Husky
- **CI:** GitHub Actions
- **Infra-ready:** AWS / Serverless / Terraform friendly
- **Repo Style:** Monorepo

---

## 🚀 One-Click Repository Setup (Required)

After creating a repo from this template, run:

```bash
chmod +x scripts/bootstrap-repo.sh
./scripts/bootstrap-repo.sh
```

This script prepares the repository for:
- Local development
- Git hooks
- Consistent tooling
- CI compatibility

---

## 🔐 What This Template Enforces

Once bootstrapped, this repository is designed to enforce:
- Feature branches (no direct commits to main)
- Pull requests for all changes
- Automated linting and formatting
- Pre-commit checks via Husky
- CI checks before merge
- Release-ready structure
- Security-first defaults
This template intentionally nudges you into professional GitHub workflows.

---

## 🔁 Required GitHub Workflow

This repository assumes the following workflow:
1. Create a feature branch
2. Commit small, meaningful changes
3. Open a pull request
4. CI runs automatically
5. Address review feedback
6. Merge only when checks pass

Direct commits to main are intentionally discouraged.

---

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

---

## 🔍 Security & Quality

This template is compatible with GitHub’s security features:
- Dependency Graph
- Dependabot alerts
- Dependabot version updates
- Secret scanning
- Code scanning (CodeQL)

These features can be enabled per-repository after creation.
The template is structured to support them cleanly.

---

## 📦 Releases & Versioning

This repository supports:
- Release branches
- Tagged versions
- Hotfix workflows
- GitHub Releases

Releases should represent intentional, documented milestones, not random snapshots.

---

## 🚀 Getting Started

### Install dependencies

```bash
npm install
```

### Run frontend
```
npm run dev
```

### Run backend

```
npm run dev:backend
```

### Testing
```
npm test
```
Tests are expected for:
- Critical logic
- Bug fixes
- New features

---

## 📁 Repository Structure

vibe-coder-template/
├── .github/              # CI workflows, PR templates
├── .husky/               # Git hooks
├── apps/
│   ├── frontend/         # React app
│   └── backend/          # API / server
├── packages/             # Shared libraries
├── infra/                # Infrastructure definitions
├── docs/                 # Architecture, decisions, roadmap
├── scripts/              # Repo automation
├── .editorconfig
├── .env.example
├── eslint.config.mjs
├── .prettierrc
└── README.md

See /docs/architecture.md for full breakdown.

---

## 🗺 Roadmap

- Core setup
- Features
- Tests
- CI/CD
- Production hardening

---

## 🧠 Rules of the Repo

- No secrets in code - ever
- Every change goes through a PR
- Every feature has a purpose
- Automation is non-negotiable
- Quality is enforced, not hoped for

---

## What you'll Practice Using This Template

By using this template correctly, you will practice:
- GitHub repositories, branches, commits, and pull requests
- Pull request reviews and feedback cycles
- Merge conflict resolution
- GitHub Actions CI pipelines
- Linting and formatting automation
- Release management and versioning
- Secure coding and dependency hygiene
- Professional repository structure and documentation

---

## 🏁 Final Note

This template is opinionated on purpose.

If you follow it, you won’t just build projects —
you’ll build confidence, discipline, and credibility as a developer.

Happy shipping 🚀
