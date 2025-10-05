#!/bin/bash

# Setup script for Mushroom Disease Detector
# This script helps developers set up the project securely

echo "🍄 Mushroom Disease Detector - Secure Setup"
echo "=========================================="

# Check if google-services.json already exists
if [ -f "app/google-services.json" ]; then
    echo "⚠️  WARNING: google-services.json already exists!"
    echo "   This file should contain YOUR API keys, not the original ones."
    echo "   Please verify this file contains your own credentials."
    read -p "   Do you want to continue? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "   Setup cancelled. Please check your google-services.json file."
        exit 1
    fi
else
    echo "📋 Setting up google-services.json from template..."
    if [ -f "app/google-services.json.template" ]; then
        cp app/google-services.json.template app/google-services.json
        echo "✅ Template copied to app/google-services.json"
        echo "⚠️  IMPORTANT: You must now edit app/google-services.json with your own API keys!"
    else
        echo "❌ ERROR: Template file not found!"
        echo "   Please ensure app/google-services.json.template exists."
        exit 1
    fi
fi

# Check .gitignore
echo ""
echo "🔍 Checking .gitignore configuration..."
if grep -q "google-services.json" .gitignore; then
    echo "✅ google-services.json is properly ignored in .gitignore"
else
    echo "❌ WARNING: google-services.json is NOT in .gitignore!"
    echo "   This could lead to accidental API key commits."
    echo "   Please add 'google-services.json' to your .gitignore file."
fi

# Check for any remaining API keys in the codebase
echo ""
echo "🔍 Scanning for potential API key leaks..."
if grep -r "AIzaSy" . --exclude-dir=.git --exclude="*.template" 2>/dev/null; then
    echo "❌ WARNING: Potential API keys found in the codebase!"
    echo "   Please remove any hardcoded API keys from your code."
else
    echo "✅ No hardcoded API keys detected"
fi

echo ""
echo "🎉 Setup complete!"
echo ""
echo "📝 Next steps:"
echo "   1. Edit app/google-services.json with your Google API credentials"
echo "   2. Obtain API keys from Google Cloud Console"
echo "   3. Restrict API keys to your app's package name: com.example.herblife"
echo "   4. Build and test your application"
echo ""
echo "🔐 Security reminder:"
echo "   - Never commit google-services.json to version control"
echo "   - Use restricted API keys for production"
echo "   - Monitor API usage regularly"
echo ""
echo "For more information, see SECURITY.md and README.md"
