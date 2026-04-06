"""Lenovo Software Assist (LSA) integration for Motorola firmware downloads.

This module provides cookie-based authentication to lsa.lenovo.com,
bypassing the interactive Passport browser login by reusing exported
cookies from a previous browser session.

Flow
----
1. User exports Lenovo Passport cookies (``passport.lenovo.com`` +
   ``.lenovo.com``) from their browser (e.g. via EditThisCookie).
2. The LPSWUST cookie carries the *WUST* token that LSA uses to
   exchange for a rotating Bearer token.
3. ``LenovoLSAClient.login()`` posts the WUST to
   ``/Interface/user/lenovoIdLogin.jhtml`` and receives the first
   Bearer token in the ``Authorization`` response header.
4. Every subsequent API call sends the current Bearer and replaces it
   with the new one returned in the response ``Authorization`` header.
"""
