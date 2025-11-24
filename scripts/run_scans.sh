#!/usr/bin/env bash
set -e
mkdir -p reports
echo "[*] Pulling WebGoat image..."
IMAGE=webgoat/webgoat-8.0
docker pull $IMAGE
echo "[*] Running Trivy image scan..."
if ! command -v trivy >/dev/null 2>&1; then
  echo "trivy not found. Install trivy first: https://aquasecurity.github.io/trivy/"
  echo "{}" > reports/trivy-image.json
else
  trivy image --format json -o reports/trivy-image.json $IMAGE || true
fi
echo "[*] Running semgrep (OWASP rules)..."
if command -v semgrep >/dev/null 2>&1; then
  semgrep --config=p/owasp --json --output=reports/semgrep.json app || true
else
  echo "{}" > reports/semgrep.json
  echo "semgrep not installed; created placeholder reports/semgrep.json"
fi
echo "[*] Running OWASP Dependency-Check (placeholder)..."
echo "{}" > reports/dependency-check.json
echo "[*] Done. Reports available in ./reports"
