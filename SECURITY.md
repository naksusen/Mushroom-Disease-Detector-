# Security Configuration for Mushroom Disease Detector

## API Key Security Guidelines

### Files to NEVER commit to Git:
- `google-services.json` (contains Google API keys)
- `local.properties` (may contain sensitive paths)
- Any files containing API keys, tokens, or credentials

### Required Setup Steps for New Developers:

1. **Clone the repository**
2. **Copy the template file**: `cp app/google-services.json.template app/google-services.json`
3. **Obtain your own Google API key** from Google Cloud Console
4. **Replace placeholder values** in `google-services.json` with your actual credentials
5. **Verify `.gitignore`** includes `google-services.json`

### Security Checklist:
- [ ] `google-services.json` is in `.gitignore`
- [ ] No API keys are hardcoded in source code
- [ ] API keys are restricted to specific package names
- [ ] Sensitive files are not tracked by Git
- [ ] Regular API key rotation is implemented

### Emergency Response for Exposed API Keys:
1. **Immediately revoke** the exposed API key in Google Cloud Console
2. **Generate a new API key** with proper restrictions
3. **Update all environments** with the new key
4. **Review access logs** for unauthorized usage
5. **Update security documentation** to prevent future incidents


