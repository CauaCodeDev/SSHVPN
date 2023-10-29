```markdown
# Ativar Senha Root no Servidor

Aqui está o comando para ativar a senha root no servidor:

```bash
sudo passwd
```

[**Copiar Comando**](#)

# Ativar MySQL e PHP

Para ativar o MySQL e o PHP, execute os seguintes comandos:

```bash
sudo apt-get install mysql-server
sudo apt-get install php
```

[**Copiar Comando**](#)

# Ativar Node.js v16 e Chrome Atualizado

Para ativar o Node.js v16 e garantir que o Chrome esteja atualizado, utilize os seguintes comandos:

```bash
nvm install 16
sudo apt-get update && sudo apt-get upgrade google-chrome-stable
```

[**Copiar Comando**](#)

# Restaurar Backup SQL

Para restaurar um backup SQL, use o seguinte comando (substitua `nome-do-arquivo.sql` pelo nome do seu arquivo de backup):

```bash
mysql -u seu-usuario -p sua-base-de-dados < nome-do-arquivo.sql
```

[**Copiar Comando**](#)
```

Lembre-se de que os links "Copiar Comando" (#) não copiam automaticamente o comando, mas você pode criar um mecanismo para copiar o comando usando JavaScript, se desejar. Isso fornecerá um guia útil para executar comandos em seu servidor. Certifique-se de personalizar as informações conforme necessário para se adequar ao seu ambiente e requisitos específicos.
