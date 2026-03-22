# Runbook

## Local Development

### Start frontend
npm run dev

### Start backend
npm run dev:backend

---

## CI/CD

- GitHub Actions runs on PR
- Lint + tests must pass

---

## Debugging

### Common Issues

#### CI stuck
- Check workflow name matches required status check

#### Build fails
- Run:
  npm install
  npm run lint

---

## Logs

- Use console logs locally
- Use CloudWatch in production (future)
