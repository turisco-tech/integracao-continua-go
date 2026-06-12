# 🐳 Domínio Prático: Git, GitHub e Docker

## 📖 Sobre o Projeto
Este repositório é um laboratório prático projetado para consolidar o aprendizado em controle de versão e conteinerização de aplicações, evoluindo do nível básico ao avançado. Ele explora a integração contínua desde o desenvolvimento do código até o deploy automatizado em containers. 

O objetivo principal é entender como o Git atua no controle do histórico local, como o GitHub facilita a colaboração remota, e como o Docker proporciona o isolamento de aplicações, garantindo que o software funcione em qualquer ambiente de forma padronizada.

---

## 🎯 Objetivos de Aprendizado
Ao longo deste projeto, os seguintes conceitos foram aplicados na prática:

### 🐙 Git & GitHub
* **Fundamentos:** Diferença entre Git (local) e GitHub (remoto).
* **Segurança:** Configuração e autenticação via Chaves SSH (`ed25519`) para comunicação segura entre a máquina e o GitHub.
* **Manipulação de Histórico:** Uso estratégico de commits, alteração de mensagens (`amend`), reversão segura para trabalho em equipe (`revert`) e exclusão de histórico local (`reset`).
* **Colaboração e Conflitos:** Resolução de conflitos de código utilizando o Merge Editor do VSCode.
* **Automação (CI/CD):** Criação de workflows no GitHub Actions separando jobs de validação (`check.yml`) e construção de artefatos (`build.yml`).

### 🐋 Docker & Docker Compose
* **Ciclo de Vida de Containers:** Inicialização, execução em segundo plano, mapeamento de portas (`-p`) para acesso no host e encerramento de processos.
* **Criação de Imagens:** Escrita de Dockerfile utilizando instruções como `FROM`, `WORKDIR`, `COPY` e `ENTRYPOINT` para empacotar a aplicação.
* **Redes e Volumes:** Criação de volumes nativos para persistência de dados em banco de dados e redes do tipo `bridge` para comunicação entre aplicações no mesmo servidor utilizando o nome do container.
* **Orquestração:** Uso do `docker-compose.yml` para iniciar e conectar múltiplos containers (aplicação e banco de dados) simultaneamente com um único comando.
* **Otimização Avançada:** Aplicação da técnica de *Multistage Build* para separar a compilação da execução, resultando em imagens de produção mais leves e rápidas.
* **Deploy:** Autenticação via Secrets (Tokens) e publicação (`push`) das imagens otimizadas no Docker Hub.

---

## 💻 Guia Rápido de Comandos Utilizados

### Controle de Versão (Git)
| Comando | Descrição Prática |
| :--- | :--- |
| `ssh-keygen -t ed25519 -C "email"` | Gera chaves criptográficas para autenticar a máquina com o GitHub. |
| `git init` | Transforma a pasta local em um repositório Git, criando a pasta `.git`. |
| `git remote add origin` | Conecta o projeto local ao repositório remoto no GitHub. |
| `git commit --amend` | Modifica ou adiciona arquivos no último commit sem sujar o histórico. |
| `git revert` | Desfaz as alterações de um commit passado criando um novo commit seguro. |
| `git reset --hard` | Apaga o histórico e retorna o projeto exatamente ao estado do *hash* informado. |
| `git add .` | Adiciona todos os arquivos modificados na pasta atual para a área de preparação (staging) do próximo commit. |
| `git commit -m "mensagem"` | Salva as alterações preparadas no histórico local com uma mensagem descritiva. |
| `git push -u origin main` | Envia os commits locais para a branch principal do repositório remoto pela primeira vez. |

### Conteinerização (Docker)
| Comando | Descrição Prática |
| :--- | :--- |
| `docker run -d -p 8080:80` | Baixa a imagem, executa o container no fundo (`-d`) e mapeia as portas (`-p`). |
| `docker build -t dockermactur/app .` | Constrói a imagem localmente lendo o Dockerfile da pasta atual (`.`) e aplica sua tag. |
| `docker volume create` | Cria um volume persistente para banco de dados no host gerenciado pelo Docker. |
| `docker network create --driver bridge` | Cria rede isolada para containers conversarem. |
| `docker compose up --build -d` | Lê o `docker-compose.yml`, constrói as imagens do zero e sobe a infraestrutura. |
| `docker push dockermactur/app` | Envia sua imagem final pronta para o seu repositório no Docker Hub. |
| `docker run -d -p 8080:80 dockersamples/static-site` | Baixa e executa o container de exemplo em segundo plano, mapeando a porta 80 do container para a 8080 do host. |
| `docker ps` | Lista todos os containers que estão em execução no momento. |
| `docker rm -f <id_ou_nome>` | Força a parada e remove um container específico do seu computador. |
| `docker build -t dockermactur/nome-da-app .` | Constrói a imagem local baseada no `Dockerfile` e já aplica a tag com o nome do seu usuário. |
| `docker image ls --filter reference='*go_*'` | Lista imagens que contenham o trecho `go_` no nome. |
| `docker build --target=builder -t go_builder .` | Compila e gera uma imagem com o nome `go_builder`. |

---

## 🗺️ Roteiro Prático (Backlog)
Para dominar os conceitos, o projeto foi estruturado nos seguintes épicos:

### Fase 1: Primeiro Commit de Atividades (Concluído ✅)
* **Épico 1 - Fundamentos e Configuração Inicial (Básico):** Configuração de autenticação segura gerando uma chave SSH e adicionando-a na conta GitHub (`marcosturisco`), criação e inicialização do repositório local (`git init`) com vínculo ao repositório remoto, e execução do primeiro container público (`dockersamples/static-site`) mapeando a porta `8080`, seguido da listagem e exclusão do container.
* **Épico 2 - Customização e Comunicação (Intermediário):** Escrita do próprio `Dockerfile` (definindo imagem base, diretório de trabalho e comandos de inicialização) e construção da imagem localmente, já nomeando-a com a tag do usuário do Docker Hub (`dockermactur`).
Criar um volume gerenciado pelo Docker para garantir a persistência de dados (como arquivos ou banco de dados) e testar a criação de arquivos dentro dele.
* **Épico 3 - Orquestração e Histórico (Avançado):** Abandonar a inicialização manual de múltiplos containers criando um arquivo (`docker-compose.yml`). Configurar os serviços, redes e volumes em um único arquivo e iniciar a aplicação.
Refatorar o seu (`Dockerfile`) aplicando a técnica de (`Multistage Build`). Criar um estágio para compilação (`build`) e outro apenas com o necessário para execução (`production`), tornando sua imagem mais leve.

---

**Autor:** Marcos Turisco (@marcosturisco)  
**Imagens Docker:** `dockermactur`