FROM golang:1.22-alpine AS builder

WORKDIR /app

# Copia todos os arquivos do projeto para o diretório de trabalho no container, exceto os arquivos listados no .dockerignore
COPY . /app

RUN go build main.go

FROM alpine:latest AS production

EXPOSE 8080

WORKDIR /app

#Adiciona variáveis com valores padrão de ambiente para configuração do banco de dados
ENV PORT 8080
ENV DB_HOST postgres
ENV DB_USER root
ENV DB_PASSWORD root
ENV DB_NAME root
ENV DB_PORT 5432

COPY ./assets/ /app/assets/
COPY ./templates/ /app/templates/
COPY --from=builder /app/main /app/main

CMD ["./main"]