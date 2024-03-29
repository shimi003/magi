"""
WSGI config for myportal project.

It exposes the WSGI callable as a module-level variable named ``application``.

For more information on this file, see
https://docs.djangoproject.com/en/2.1/howto/deployment/wsgi/
"""

import os
import sys

from django.core.wsgi import get_wsgi_application

sys.path.append('/home/user/http/magi/myportal')

os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'myportal.settings')

application = get_wsgi_application()
