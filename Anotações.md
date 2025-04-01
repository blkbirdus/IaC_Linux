# Curso Básico de Linux - Anotações

## 1. Comandos Básicos

- Sempre use o parâmetro `--help` quando não souber o comando.

### Procurar arquivos/diretórios no sistema
```bash
find -name arquivo
```

### Ver grupos e usuários
```bash
cat /etc/group   # Ver grupos de usuários
cat /etc/sudoers # Ver usuários com permissão de sudo
```

### Acessar e gerenciar permissões de superusuário
```bash
sudo su         # Entrar como superusuário
sudo passwd root # Definir senha para root
su (nome_usuário) # Sair do superusuário
```

## 2. Gerenciamento de SSH

### Habilitar acesso remoto para root
```bash
nano /etc/ssh/sshd_config
# Alterar a linha: #PermitRootLogin prohibit-password para PermitRootLogin yes
```

### Reiniciar o serviço SSH
```bash
systemctl restart ssh
```

### Verificar status do SSH
```bash
systemctl status ssh
```

## 3. Histórico de Comandos

### Comandos relacionados ao histórico
```bash
history              # Exibir histórico de comandos
!comando            # Reutilizar um comando anterior
!!                  # Executar o último comando novamente
export HISTTIMEFORMAT="%c "  # Alterar formato de data/hora do histórico
set +o history      # Desativar o histórico\
set -o history      # Ativar o histórico
history -w         # Armazenar o histórico em um arquivo
```

### Configurar limite de comandos armazenados
```bash
nano .bashrc
# Editar a linha: HISTSIZE=(tamanho desejado)
```

## 4. Gerenciamento de Usuários

### Criar usuário
```bash
useradd user
# Criar diretório home e definir nome do usuário
useradd -m -c "nome" user
# Definir interpretador
useradd -s /bin/bash user
# Adicionar ao grupo
usermod -G grupo user
# Definir data de expiração
usermod -e data_para_expiração user
```

### Alterar configurações do usuário
```bash
usermod user
passwd user  # Definir senha para o usuário
```

### Remover usuário
```bash
userdel user    # Remover usuário
userdel -f user # Forçar remoção se ainda estiver logado
userdel -r user # Remover diretório do usuário
```

### Ver usuários do servidor
```bash
cat /etc/passwd
```

### Criar senha encriptada ao adicionar usuário
```bash
useradd user -p $(openssl passwd -6 senha)
```

## 5. Scripts no Linux

- Todo script deve ter extensão `.sh` e iniciar com:
```bash
#!/bin/bash
```
- Para torná-lo executável:
```bash
chmod +x script.sh
```

## 6. Gerenciamento de grupos

### Criar e remover grupos
```bash
groupadd grupo  # Criar grupo
groupdel grupo  # Remover grupo
```

### Gerenciar usuários em grupos
```bash
usermod -G grupo user   # Adicionar usuário a um grupo
gpasswd -d user grupo  # Remover usuário de um grupo
```

## 7. Permissões de Arquivos e Diretórios

### Conceitos
- **r**: leitura (4)
- **w**: escrita (2)
- **x**: execução (1)
- **Sem permissão**: (-)
- Para indicar mais que uma permissão se usa a soma dos números
- Exemplo de estrutura de permissões: `drwxr-xr--`

### Modificar permissões
```bash
chmod 754 arquivo  # Exemplo de configuração de permissão
```
- **dono**: `7 = leitura + gravação + execução`
- **grupo**: `5 = leitura + execução`
- **Outros**: `4 = leitura`

### Alterar dono e grupo
```bash
chown dono:grupo arquivo
```
