param(
  [string]$Service = ""
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

if ([string]::IsNullOrWhiteSpace($Service)) {
  docker compose -f "..\docker-compose.yml" logs --tail=150
} else {
  docker compose -f "..\docker-compose.yml" logs --tail=150 $Service
}
