# test-and-push.ps1
param([string]$dossier)

if (-not $dossier) {
    Write-Host "❌ Erreur : Tu dois spécifier un dossier (ex: ./test-and-push.ps1 create-appointment)" -ForegroundColor Red
    exit 1
}

Write-Host "🧪 Lancement des tests Jest pour : $dossier" -ForegroundColor Cyan

npm test -- $dossier

if ($LASTEXITCODE -eq 0) {
    Write-Host "✅ Tests au vert ! Envoi sur Git..." -ForegroundColor Green
    
    git add .
    git commit -m "Feat($dossier): finished"
    git push
    
    Write-Host "🚀 Mission accomplie : Testé, Commité, Poussé." -ForegroundColor Magenta
} else {
    Write-Host "❌ Échec des tests. Le commit a été annulé." -ForegroundColor Red
    exit 1
}
