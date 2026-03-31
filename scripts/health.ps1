Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Test-Port {
  param(
    [Parameter(Mandatory = $true)][string]$Name,
    [Parameter(Mandatory = $true)][int]$Port
  )

  $client = New-Object System.Net.Sockets.TcpClient
  try {
    $iar = $client.BeginConnect("127.0.0.1", $Port, $null, $null)
    $ok = $iar.AsyncWaitHandle.WaitOne(3000, $false)
    if (-not $ok) {
      throw "$Name is not reachable on port $Port"
    }
    $client.EndConnect($iar)
    Write-Host "$Name`: OK (port $Port)"
  } finally {
    $client.Close()
  }
}

Test-Port -Name "n8n" -Port 5678
Test-Port -Name "qdrant" -Port 6333
