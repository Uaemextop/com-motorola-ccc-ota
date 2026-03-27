"""
Motorola OTA Update Analyzer

Clean architecture implementation for analyzing and interacting with
Motorola CDS (Content Delivery Service) OTA update servers.

Architecture:
    config/   - Server endpoints, environments, and application settings
    models/   - Data models for device info, requests, and responses
    auth/     - Authentication handling (header-based auth)
    client/   - HTTP client for OTA API communication
    analysis/ - Smali bytecode and native binary analysis (capstone)
    utils/    - URL construction and helper utilities
"""

__version__ = "1.0.0"
