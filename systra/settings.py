# Django settings for systra project.
import os
##import ldap
#from django_auth_ldap.config import LDAPSearch, GroupOfNamesType
#PROJECT_PATH = os.path.abspath(os.path.dirname(__file__))
#SITE_PATH = os.path.abspath(os.path.join(PROJECT_PATH, os.path.pardir))
DEBUG = True
TEMPLATE_DEBUG = DEBUG
import os
BASE_DIR = os.path.dirname(os.path.dirname(__file__))

ADMINS = (
    # ('Your Name', 'your_email@example.com'),
)
CONTENT="/srv/content/"
MANAGERS = ADMINS

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql', # Add 'postgresql_psycopg2', 'mysql', 'sqlite3' or 'oracle'.
        #'NAME': 'systra4',                      # Or path to database file if using sqlite3.
        'NAME': 'systra3', 
        'USER': 'systra',                      # Not used with sqlite3.
        #'PASSWORD': 'sys007',                  # Not used with sqlite3.
        'PASSWORD': '1234',
        #'HOST': '192.1.9.162',                      # Set to empty string for localhost. Not used with sqlite3.
        'HOST': 'localhost',
        'PORT': '3306',                      # Set to empty string for default. Not used with sqlite3.
    }
}

# Local time zone for this installation. Choices can be found here:
# http://en.wikipedia.org/wiki/List_of_tz_zones_by_name
# although not all choices may be available on all operating systems.
# In a Windows environment this must be set to your system time zone.
TIME_ZONE = 'America/Chicago'

# Language code for this installation. All choices can be found here:
# http://www.i18nguy.com/unicode/language-identifiers.html
LANGUAGE_CODE = 'es-MX'

SITE_ID = 1

# If you set this to False, Django will make some optimizations so as not
# to load the internationalization machinery.
USE_I18N = True

# If you set this to False, Django will not format dates, numbers and
# calendars according to the current locale.
USE_L10N = True

# If you set this to False, Django will not use timezone-aware datetimes.
USE_TZ = True

# Absolute filesystem path to the directory that will hold user-uploaded files.
# Example: "/home/media/media.lawrence.com/media/"
MEDIA_ROOT = ''

# URL that handles the media served from MEDIA_ROOT. Make sure to use a
# trailing slash.
# Examples: "http://media.lawrence.com/media/", "http://example.com/media/"
MEDIA_URL = ''

# Absolute path to the directory static files should be collected to.
# Don't put anything in this directory yourself; store your static files
# in apps' "static/" subdirectories and in STATICFILES_DIRS.
# Example: "/home/media/media.lawrence.com/static/"
STATIC_ROOT = ''

# URL prefix for static files.
# Example: "http://media.lawrence.com/static/"
STATIC_URL = '/static/'

# Additional locations of static files
STATICFILES_DIRS = (
    # Put strings here, like "/home/html/static" or "C:/www/django/static".
    # Always use forward slashes, even on Windows.
    # Don't forget to use absolute paths, not relative paths.
    '/srv/systra/systra/static/',
)
#STATICFILES_DIRS = (
#    os.path.join(SITE_PATH, 'systra/static'),)

# List of finder classes that know how to find static files in
# various locations.
STATICFILES_FINDERS = (
    'django.contrib.staticfiles.finders.FileSystemFinder',
    'django.contrib.staticfiles.finders.AppDirectoriesFinder',
#    'django.contrib.staticfiles.finders.DefaultStorageFinder',
)

# Make this unique, and don't share it with anybody.
SECRET_KEY = 'i9yey=4dvy!d873c=_63)0o%t@s9e*lf#x0ro3*2$0fpw%bf$f'

# List of callables that know how to import templates from various sources.
TEMPLATE_LOADERS = (
     ('pyjade.ext.django.Loader',(
        'django.template.loaders.filesystem.Loader',
        'django.template.loaders.app_directories.Loader',
    )),
    #'django.template.loaders.filesystem.Loader',
    #'django.template.loaders.app_directories.Loader',
#     'django.template.loaders.eggs.Loader',


)

MIDDLEWARE_CLASSES = (
    'django.middleware.common.CommonMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    # Uncomment the next line for simple clickjacking protection:
    # 'django.middleware.clickjacking.XFrameOptionsMiddleware',
)

ROOT_URLCONF = 'systra.urls'

# Python dotted path to the WSGI application used by Django's runserver.
WSGI_APPLICATION = 'systra.wsgi.application'

TEMPLATE_DIRS = (
    #'templates'
    '/srv/systra/systra/templates',
    # Put strings here, like "/home/html/django_templates" or "C:/www/django/templates".
    # Always use forward slashes, even on Windows.
    # Don't forget to use absolute paths, not relative paths.
)

INSTALLED_APPS = (
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.sites',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'accidentes',
    'infracciones',
    'inventarios',
    'content',
    'estadisticas',
    'perfil',
    # Uncomment the next line to enable the admin:
    'django.contrib.admin',
    # Uncomment the next line to enable admin documentation:
    # 'django.contrib.admindocs',
)
# A sample logging configuration. The only tangible logging
# performed by this configuration is to send an email to
# the site admins on every HTTP 500 error when DEBUG=False.
# See http://docs.djangoproject.com/en/dev/topics/logging for
# more details on how to customize your logging configuration.
LOGIN_URL='/login/'
LOGGING = {
    'version': 1,
    'disable_existing_loggers': True,
    'formatters': {
        'standard': {
            'format' : "[%(asctime)s] %(levelname)s [%(name)s:%(lineno)s] %(message)s",
            'datefmt' : "%d/%b/%Y %H:%M:%S"
        },
    },
    'filters': {
        'require_debug_false': {
            '()': 'django.utils.log.RequireDebugFalse'
        }
    },
    'handlers': {
        'mail_admins': {
            'level': 'ERROR',
            'filters': ['require_debug_false'],
            'class': 'django.utils.log.AdminEmailHandler'
        },
       'logfile': {
            'level':'DEBUG',
            'class':'logging.handlers.RotatingFileHandler',
            'filename': "systra.log",
            'maxBytes': 50000,
            'backupCount': 2,
            'formatter': 'standard',
        },
    },
    'loggers': {
        'django.request': {
            'handlers': ['mail_admins'],
            'level': 'ERROR',
            'propagate': True,
        },
        'accidentes.views': {
            'handlers': ['logfile'],
            'level': 'DEBUG',
        },
    }
}
#AUTH_LDAP_SERVER_URI = "ldap://localhost"
#AUTH_LDAP_BIND_DN = "cn=Manager,dc=siosp,dc=local"
#AUTH_LDAP_BIND_PASSWORD = "sys007"
#AUTH_LDAP_USER_DN_TEMPLATE = "uid=%(user)s,ou=TRANSITO,dc=siosp,dc=local"
#--AUTH_LDAP_USER_SEARCH = LDAPSearch("ou=captura,ou=transito,dc=siosp,dc=local",
 #--   ldap.SCOPE_SUBTREE, "(uid=%(user)s)")
# or perhaps:
# AUTH_LDAP_USER_DN_TEMPLATE = "uid=%(user)s,ou=users,dc=example,dc=com"

#--AUTH_LDAP_GROUP_TYPE = GroupOfNamesType(name_attr="cn")

# Simple group restrictions
#AUTH_LDAP_REQUIRE_GROUP = "ou=CAPTURA,ou=TRANSITO,dc=siosp,dc=local"
#--AUTH_LDAP_DENY_GROUP = "cn=disabled,ou=CAPTURA,ou=TRANSITO,dc=siosp,dc=local"

# Populate the Django user from the LDAP directory.
#AUTH_LDAP_USER_ATTR_MAP = {
#    "first_name": "givenName",
#    "last_name": "sn",
#    "email": "mail"
#}

#--AUTH_LDAP_PROFILE_ATTR_MAP = {
#--    "employee_number": "employeeNumber"
#--}

#--AUTH_LDAP_USER_FLAGS_BY_GROUP = {
 #--   "is_active": "cn=active,ou=CAPTURA,ou=TRANSITO,dc=siosp,dc=local",
#--    "is_staff": "cn=staff,ou=CAPTURA,ou=TRANSITO,dc=siosp,dc=local",
#--    "is_superuser": "cn=superuser,ou=CAPTURA,ou=TRANSITO,dc=siosp,dc=local"
#--}

#--AUTH_LDAP_PROFILE_FLAGS_BY_GROUP = {
#--    "is_awesome": "cn=awesome,ou=CAPTURA,ou=TRANSITO,dc=siosp,dc=local",
#--}

# This is the default, but I like to be explicit.
#AUTH_LDAP_ALWAYS_UPDATE_USER = True

# Use LDAP group membership to calculate group permissions.
#--AUTH_LDAP_FIND_GROUP_PERMS = True

# Cache group memberships for an hour to minimize LDAP traffic
#--AUTH_LDAP_CACHE_GROUPS = True
#--AUTH_LDAP_GROUP_CACHE_TIMEOUT = 3600


# Keep ModelBackend around for per-user permissions and maybe a local
# superuser.
#AUTHENTICATION_BACKENDS = (
#    'django_auth_ldap.backend.LDAPBackend',
#    'django.contrib.auth.backends.ModelBackend',
#)

