"""Lenovo Software Assist (LSA) integration for Motorola firmware downloads.

This module provides two authentication paths to ``lsa.lenovo.com``:

OAuth2/PKCE flow (current, recommended)
----------------------------------------
1. Call ``client.get_oauth2_login_url()`` to get the Passport authorize URL.
2. User authenticates in browser at ``passport-glb.lenovo.com``.
3. Passport redirects to ``/Tips/lenovoIdSuccess.html?code=X&scope=openid&state=X``.
4. Callback page JS calls ``/Interface/user/oauth2/callback.jhtml`` with the code,
   which returns ``softwareFix://authcallback?wust=<WUST_TOKEN>``.
5. ``client.login(wust=<WUST>)`` exchanges the WUST for a rotating Bearer token.

Cookie-based bypass (legacy)
-----------------------------
1. Export Lenovo Passport cookies from a browser session (e.g. via EditThisCookie).
2. The ``LPSWUST`` cookie carries the WUST token.
3. ``client.login()`` posts the WUST to ``lenovoIdLogin.jhtml``.
4. Each API response returns a new Bearer token in the ``Authorization`` header.

IP restriction
--------------
Tokens generated from datacenter IPs (AWS, Azure) are rejected with
``403 Invalid token`` on all authenticated endpoints.  Use a residential
IP for full API access.

Infrastructure (April 2026)
---------------------------
- Server: Apache Tomcat/11.0.12 behind AWS ELB (us-east-1)
- TLS: TLSv1.2 with ECDHE-RSA-AES128-GCM-SHA256
- 75 Interface endpoints discovered (71 require auth)
- OAuth2 client_id: ``127cbff4e99dd5579db0627769509be972a3f38ad0dd11f2f2a7947516c923f0``
"""
