# Política de Segurança - SecureTasks (Resumo) - WebGoat Project

## Objetivo
Integrar verificações de segurança ao pipeline de desenvolvimento, reduzindo tempo de exposição a vulnerabilidades e garantindo entregas seguras.

## Diretrizes mínimas
1. Executar Dependency Scans, Container Scans e SAST em PRs.
2. Bloquear merges quando houver vulnerabilidades críticas (CVSS >= 9) a menos que exista exceção aprovada.
3. Definir SLAs: Critical = 24h, High = 7 dias, Medium = 30 dias.
4. Quem valida:
   - Security Owner: validação final de exceções.
   - Dev Lead: correção técnica.
   - SRE: implementação de controles e monitoração.
5. Metodologia de avaliação: CVSS + Impacto de Negócio → Priorizar por RPN.
