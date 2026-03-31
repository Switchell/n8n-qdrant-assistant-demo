# Bot Demo Checklist

## 1) Поднять сервисы

```powershell
cd "C:\Users\Son\Desktop\Кодинг проекты\Bot\scripts"
.\up.ps1
.\health.ps1
```

## 2) Импортировать workflow в n8n

1. Открыть `http://localhost:5678`
2. `Workflows` -> `Import from file`
3. Выбрать `workflows/bot_memory_demo.workflow.json`
4. Сохранить и активировать workflow

## 3) Прогнать тест вебхука

У workflow путь: `bot-memory-demo`  
Тест-запрос:

```powershell
Invoke-RestMethod -Method Post `
  -Uri "http://localhost:5678/webhook/bot-memory-demo" `
  -ContentType "application/json" `
  -Body (Get-Content "..\samples\webhook_request.json" -Raw)
```

Ожидаемый ответ:
- `status: "ok"`
- `stored_point_id` заполнен
- `similar_found` > 0

## 4) Проверка Qdrant

```powershell
Invoke-RestMethod -Method Get -Uri "http://localhost:6333/collections"
```

В списке должна быть коллекция `bot_memory`.
