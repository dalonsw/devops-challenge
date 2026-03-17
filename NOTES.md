# Notas do desafio de DevOps

## Comentários e soluções que pensei para o desafio:
Durante a realização do desafio, pensei em algumas soluções para os problemas propostos. O app em python é algo que já tinha feito antes, então não tive dificuldades para criar a API. 

Coloquei apenas um arquivo ali de configuração para o ambiente, o config.py, para centralizar as variáveis de ambiente e facilitar a manutenção do código. Assim, se precisar mudar alguma variável, basta alterar ali e o resto do código continua funcionando normalmente. O .env.example serve mais para fazer a cópia do arquivo .env para o container.

Para o Dockerfile pensei em usar uma imagem alpine, mas acabei optando por uma imagem mais completa, a python:3.14-slim, para evitar problemas de dependências. Além de usar uma versão mais atualizada ali para garantir que o app rodasse sem problemas.

Pensei também em fazer multi-stage builds para otimizar a imagem, mas como o app é simples e não tem muitas dependências, optei por uma imagem única mesmo.

Ali na questão do GitHub Actions, fui fazendo testes com o lint e moldando o código para passar nas verificações. Usei o pylint.

No terraform fiz uma configuração básica para criar uma máquina EC2 e um security group, para garantir que tivesse mais segurança a máquina.

Tentei fazer o repositório o mais organizado possível, com uma estrutura clara de pastas e arquivos e com um gitflow simples, usando branches para organizar as features e fixes.

