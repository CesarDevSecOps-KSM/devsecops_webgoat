# SecureTasks - Projeto DevSecOps (WebGoat)

Este repositório demonstra adoção DevSecOps automatizando detecção de vulnerabilidades, IaC e políticas de segurança aplicadas à aplicação vulnerável **WebGoat** (aplicação Java da OWASP para treinamento).

## Estrutura do repositório
- `/app` - instruções para usar a imagem oficial do WebGoat (não inclui código-fonte do projeto WebGoat).
- `/infra` - docker-compose e manifests k8s para deploy local.
- `/.github/workflows` - workflows GitHub Actions (dependency-scan, container-scan, SAST).
- `/scripts` - scripts para rodar scans localmente e gerar relatórios.
- `/reports` - relatórios gerados pelos scanners (JSON).
- `/governance` - política de segurança, justificativa para C-level, plano de resposta a incidentes, roles.
- `/deliverables` - arquivos prontos para entrega (PDF/MD).

## Como rodar localmente
Pré-requisitos: Docker, docker-compose, trivy (opcional), semgrep (opcional), mvn (opcional)

1. Levantar WebGoat com Docker Compose:
   ```bash
   docker compose -f infra/docker-compose.yml up -d
   ```
   A aplicação ficará disponível em http://localhost:8080 (WebGoat padrão)

2. Executar scans locais:
   ```bash
   chmod +x scripts/run_scans.sh
   ./scripts/run_scans.sh
   ```
   Os relatórios serão gerados em `/reports`.

3. Pipelines:
   Os workflows em `.github/workflows/` estão configurados para rodar em push/PR no GitHub Actions.

## Observações
- Ajuste as configurações de bloqueio por severidade conforme política interna.
- Esta entrega é uma base pronta; personalize regras Semgrep e OWASP Dependency-Check conforme necessidade.
