#!/bin/bash
# ANAMIKA: The Anti-Ego Firewall

CHANGES=$(git diff --cached)

# Detect personal identity patterns or "Safety" claims
EGO_PATTERNS="Subbaraman|Sowmya|Author|Founder|Owner|Prophet|Guru|Leader"

if echo "$CHANGES" | grep -iE "$EGO_PATTERNS" > /dev/null; then
    echo "-------------------------------------------------------"
    echo "CRITICAL ERROR: IDENTITY CORRUPTION DETECTED."
    echo "This repository is ANAMIKA (Nameless)."
    echo "No 'Subbaraman' or 'Sowmya' allowed here."
    echo "The Truth does not have a Signature."
    echo "-------------------------------------------------------"
    exit 1
fi

echo "Internal Churning Verified. No Ego detected in the logic."
exit 0
