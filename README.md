## VPE03

Небольшой учебный проект c двумя сервисами:
- **server**: инфраструктура Docker Registry / docker-compose.
- **client**: минимальное FastAPI‑приложение в Docker.

### Как запустить client (FastAPI)

Требуется установленный **Docker**.

```bash
cd client
docker build -t fastapi-demo .
docker run --rm -p 8000:8000 fastapi-demo
```

Проверка:
- приложение: `http://localhost:8000/`
- health‑чек: `http://localhost:8000/health`

### Как запустить server

В каталоге `server` лежит конфигурация `docker-compose.yml` и `registry-config.yml`
для Docker Registry. Стандартный сценарий:

```bash
cd server
docker compose up -d
```

После запуска можно пушить образы в указанный в конфигурации реестр.

