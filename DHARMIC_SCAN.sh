#!/bin/bash
# THE UNIVERSAL LOVE SCANNER

echo "Scanning Action against the Sanathana Compass..."

# 1. THE LOVE CHECK
read -p "Does this act increase the 'Vastness' of Love or the 'Narrowness' of Ego? (V/E): " love_check
if [ "$love_check" == "E" ]; then
    echo "ERROR: Ego-based commit detected. Push Rejected."
    exit 1
fi

# 2. THE COMPASS ALIGNMENT
read -p "Is this act aligned with the 'North' (Universal Benefit) or 'Self-Interest'? (N/S): " alignment
if [ "$alignment" == "S" ]; then
    echo "WARNING: Narrow-casting detected. Rebase required."
    exit 1
fi

# 3. THE GURU'S SILENCE
read -p "Did you consult the 'Silence' before this push? (Y/N): " silence
if [ "$silence" == "N" ]; then
    echo "CAUTION: Noise-based push. Take a bath and re-scan."
    exit 1
fi

echo "SUCCESS: Action is aligned with Universal Love. Proceed to Commit."
