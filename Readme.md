# Ariba Cloud Data Integration: The "Clear Water" Parser
**Author:** Subbaraman-Sowmya

## The "Deep" Concept
In a global procurement landscape, data is often "oily" (noisy and unstructured). This project demonstrates a Python-based middleware that acts as a "Washerman," cleaning external supplier sentiment (e.g., from Glassdoor-style datasets) before it integrates with the Ariba Cloud.

## The Churning (Logic)
- **Regex Filtration:** Uses advanced patterns to extract Truth (Supplier IDs/Ratings) from Chaos (Raw text).
- **Cloud Security:** Implemented via secure SSH/PAT handshakes to ensure Data Integrity.
- **Scalability:** Designed to remain "witness-like" in the cloud while interacting with multi-tenant architectures.

## How to Run
1. Ensure your 'Internal Manager' (Python 3.x) is active.
2. Run `python clean_data.py`.
