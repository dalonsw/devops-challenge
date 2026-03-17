# Segurança

Como última parte do desafio, é necessário criar um arquivo explicando as medidas de segurança que foram implementadas no projeto.

## Medidas de segurança implementadas
- **Container sem root**: no `Dockerfile` é criado o usuário `appuser` e o processo roda com `USER appuser`, reduzindo o impacto em caso de exploração dentro do container.
- **Menor superfície de ataque da imagem**: uso de base `python:3.14-slim` no `Dockerfile`, que tende a trazer menos pacotes/ferramentas do que imagens “full”.
- **Segredos/arquivos sensíveis fora do Git**: o `.gitignore` ignora `.env` e `.terraform*`, evitando commitar credenciais e artefatos locais.
- **Kubernetes com probes de saúde**: no `infra/k8s/deployment.yaml` existem `readinessProbe` e `livenessProbe` no endpoint `/health` (implementado em `app.main.health`), ajudando o cluster a remover pods não saudáveis automaticamente (resiliência operacional).
- **Pipeline com varredura de vulnerabilidades**: o workflow `.github/workflows/devops-challenge.yaml` faz scan da imagem Docker com Trivy e falha o build se achar vulnerabilidades `HIGH`/`CRITICAL` (gate de segurança).
- **Uso de secrets no CI**: no workflow `.github/workflows/devops-challenge.yaml`, o login no DockerHub usa `secrets.DOCKER_USERNAME` e `secrets.DOCKER_PASSWORD` (não ficam hardcoded no repositório).

## Perguntas adicionais:
1. **Como gerenciar segredos em produção:** Em produção é recomendado usar um gerenciador de segredos como HashiCorp Vault, AWS Secrets Manager ou Azure Key Vault. Além de implementar no GitHub Actions (caso utilize) as variáveis de ambiente como secrets do repositório, evitando expor credenciais sensíveis.
2. **Como evitar vulnerabilidades em dependências:** Manter as dependências atualizadas, usar ferramentas de análise de vulnerabilidades (como Dependabot) e revisar regularmente os relatórios de segurança das bibliotecas utilizadas.
3. **Como melhorar a segurança da imagem Docker:** Usar uma imagem base ainda mais minimalista (como `alpine` ou `slim`), remover pacotes desnecessários, rodar o processo com um usuário não-root, e aplicar patches de segurança regularmente.
4. **Boas práticas de acesso em ambientes cloud:** Implementar o princípio do menor privilégio, usar roles e políticas de acesso bem definidas, habilitar autenticação multifator (MFA) para contas de acesso, e monitorar logs de acesso para detectar atividades suspeitas. Implementar um user próprio para o Terraform, com permissões limitadas apenas ao necessário para criar os recursos.
