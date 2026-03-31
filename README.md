# Bot (n8n + Qdrant)

Локальный проект для запуска n8n и Qdrant в отдельном Docker compose-неймспейсе.

## Что поднимается

- `n8n` на `http://localhost:5678`
- `qdrant` на `http://localhost:6333`

Compose project name: `bot_showcase` (изолирован от других Docker-проектов).

## Подготовка

1. Убедись, что Docker Desktop запущен.
2. Проверь наличие `google-creds.json` в корне `Bot`.
3. Проверь `.env` (пример в `.env.example`).

## Быстрый запуск

Из папки `Bot\scripts`:

```powershell
.\up.ps1
```

## Проверка здоровья сервисов

```powershell
.\health.ps1
```

Ожидается:
- `n8n: OK (200)`
- `qdrant: OK (200)`

## Полезные команды

```powershell
.\status.ps1
.\logs.ps1
.\logs.ps1 n8n
.\logs.ps1 qdrant
.\down.ps1
```

## Demo workflow (для витрины)

- Workflow JSON: `workflows/bot_memory_demo.workflow.json`
- Пример запроса: `samples/webhook_request.json`
- Пошаговая проверка: `DEMO_CHECKLIST.md`

## Безопасность

- В `.gitignore` уже добавлены: `.env`, `google-creds.json`.
- Не публикуй `google-creds.json` и `.env` в репозитории/архивах.
