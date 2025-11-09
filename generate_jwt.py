import jwt
import datetime
import time

# --- Configuration ---
# 1. APP_ID: Replace this with your GitHub App ID (OM-GEM App).
APP_ID = 2260237  # Example ID - REPLACE THIS!
# 2. PRIVATE_KEY_PATH: Ensure this path matches the file you committed locally.
PRIVATE_KEY_PATH = "/root/myproject/om-gem.2025-11-08.private-key.pem"

def generate_jwt():
    """Generates a JSON Web Token (JWT) for GitHub App authentication."""
    try:
        with open(PRIVATE_KEY_PATH, 'rb') as key_file:
            signing_key = key_file.read()
    except FileNotFoundError:
        print(f"❌ ERROR: Private key file not found at {PRIVATE_KEY_PATH}")
        return None

    # JWT requires an issued at time (iat) and an expiration time (exp)
    now = int(time.time())
    
    # Expiration time is 10 minutes from now (max allowed is 10 minutes)
    expiration = now + (10 * 60)

    payload = {
        # issued at time
        'iat': now,
        # JWT expiration time (10 minutes maximum)
        'exp': expiration,
        # GitHub App's ID
        'iss': APP_ID
    }

    # Algorithm must be RS256
    encoded_jwt = jwt.encode(
        payload,
        signing_key,
        algorithm='RS256'
    )
    return encoded_jwt

if __name__ == "__main__":
    generated_jwt = generate_jwt()
    if generated_jwt:
        print(f"✅ Generated JWT (valid for 10 minutes):")
        print(generated_jwt)
