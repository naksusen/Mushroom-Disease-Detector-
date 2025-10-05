# Setup script for Mushroom Disease Detector (PowerShell)
# This script helps developers set up the project securely

Write-Host "🍄 Mushroom Disease Detector - Secure Setup" -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Green

# Check if google-services.json already exists
if (Test-Path "app\google-services.json") {
    Write-Host "⚠️  WARNING: google-services.json already exists!" -ForegroundColor Yellow
    Write-Host "   This file should contain YOUR API keys, not the original ones." -ForegroundColor Yellow
    Write-Host "   Please verify this file contains your own credentials." -ForegroundColor Yellow
    $response = Read-Host "   Do you want to continue? (y/N)"
    if ($response -notmatch "^[Yy]$") {
        Write-Host "   Setup cancelled. Please check your google-services.json file." -ForegroundColor Red
        exit 1
    }
} else {
    Write-Host "📋 Setting up google-services.json from template..." -ForegroundColor Blue
    if (Test-Path "app\google-services.json.template") {
        Copy-Item "app\google-services.json.template" "app\google-services.json"
        Write-Host "✅ Template copied to app\google-services.json" -ForegroundColor Green
        Write-Host "⚠️  IMPORTANT: You must now edit app\google-services.json with your own API keys!" -ForegroundColor Yellow
    } else {
        Write-Host "❌ ERROR: Template file not found!" -ForegroundColor Red
        Write-Host "   Please ensure app\google-services.json.template exists." -ForegroundColor Red
        exit 1
    }
}

# Check .gitignore
Write-Host ""
Write-Host "🔍 Checking .gitignore configuration..." -ForegroundColor Blue
if (Select-String -Path ".gitignore" -Pattern "google-services.json" -Quiet) {
    Write-Host "✅ google-services.json is properly ignored in .gitignore" -ForegroundColor Green
} else {
    Write-Host "❌ WARNING: google-services.json is NOT in .gitignore!" -ForegroundColor Red
    Write-Host "   This could lead to accidental API key commits." -ForegroundColor Red
    Write-Host "   Please add 'google-services.json' to your .gitignore file." -ForegroundColor Red
}

# Check for any remaining API keys in the codebase
Write-Host ""
Write-Host "🔍 Scanning for potential API key leaks..." -ForegroundColor Blue
$apiKeyMatches = Get-ChildItem -Recurse -File | Where-Object { $_.Name -notlike "*.template" -and $_.DirectoryName -notlike "*\.git*" } | Select-String -Pattern "AIzaSy" -List
if ($apiKeyMatches) {
    Write-Host "❌ WARNING: Potential API keys found in the codebase!" -ForegroundColor Red
    Write-Host "   Please remove any hardcoded API keys from your code." -ForegroundColor Red
} else {
    Write-Host "✅ No hardcoded API keys detected" -ForegroundColor Green
}

Write-Host ""
Write-Host "🎉 Setup complete!" -ForegroundColor Green
Write-Host ""
Write-Host "📝 Next steps:" -ForegroundColor Cyan
Write-Host "   1. Edit app\google-services.json with your Google API credentials" -ForegroundColor White
Write-Host "   2. Obtain API keys from Google Cloud Console" -ForegroundColor White
Write-Host "   3. Restrict API keys to your app's package name: com.example.herblife" -ForegroundColor White
Write-Host "   4. Build and test your application" -ForegroundColor White
Write-Host ""
Write-Host "🔐 Security reminder:" -ForegroundColor Cyan
Write-Host "   - Never commit google-services.json to version control" -ForegroundColor White
Write-Host "   - Use restricted API keys for production" -ForegroundColor White
Write-Host "   - Monitor API usage regularly" -ForegroundColor White
Write-Host ""
Write-Host "For more information, see SECURITY.md and README.md" -ForegroundColor Blue
