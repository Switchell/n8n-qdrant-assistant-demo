Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

docker compose -f "..\docker-compose.yml" up -d
docker compose -f "..\docker-compose.yml" ps
